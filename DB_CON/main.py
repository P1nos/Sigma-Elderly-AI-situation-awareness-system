from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import os
import pymysql

app = Flask(__name__)

# 이미지를 저장할 디렉토리 설정
image_upload_folder = ''

# MySQL 연결 설정
db_config = {
    "host": "localhost",  # MySQL 호스트 주소
    "user": "",  # MySQL 사용자 이름
    "password": "",  # MySQL 비밀번호
    "database": ""  # MySQL 데이터베이스 이름
}

# 이미지 업로드 경로가 없으면 생성
if not os.path.exists(image_upload_folder):
    os.makedirs(image_upload_folder)


# 업로드된 파일의 확장자를 확인하는 함수
def allowed_file(filename):
    allowed_extensions = {'png', 'jpg', 'jpeg'}
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in allowed_extensions


@app.route('/api', methods=['POST'])
def upload_image():
    # 파일이 업로드되었는지 확인
    if 'image' not in request.files:
        return jsonify({"message": "No image part"}), 400

    image = request.files['image']

    # 파일 이름 확인
    if image.filename == '':
        return jsonify({"message": "No selected image"}), 400

    # 파일 확장자 확인
    if not allowed_file(image.filename):
        return jsonify({"message": "Invalid file extension"}), 400

    # 파일을 안전한 방식으로 저장
    filename = secure_filename(image.filename)
    filepath = os.path.join(image_upload_folder, filename)
    image.save(filepath)

    # 이미지 정보를 MySQL에 저장
    insert_image_to_mysql(filename, filepath)

    return jsonify({"message": "Image uploaded successfully"}), 200


# 데이터베이스에 이미지 정보를 저장하는 함수
def insert_image_to_mysql(filename, filepath):
    try:
        connection = pymysql.connect(**db_config)
        cursor = connection.cursor()
        parts = filename.split("_")

        if len(parts) == 2:
            username = parts[0]
            filetime = parts[1]
            # 이미지 정보를 DB에 저장하는 것.
            with open(filepath, 'rb') as image_file:
                image_db = image_file.read()
            # 각각에 맞는 테이블, values 값 설정해놔야함.
            sql = "INSERT INTO images (id, filetime, image) VALUES (%s, %s, %s)"
            values = (username, filetime, image_db)
            cursor.execute(sql, values)
            connection.commit()

        print("데이터베이스에 이미지 데이터 저장 완료")
    except Exception as e:
        print("데이터베이스 이미지 저장 오류:", e)
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()


if __name__ == '__main__':
    app.run(host='', port=8000) # DB 아이피 주소