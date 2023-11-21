import os
import requests
from datetime import datetime
import json
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

# Flask 웹 서버 URL 설정
flask_server_url = "http://127.0.0.1:8000/api"  # Flask 웹 서버의 업로드 엔드포인트 URL

# 이미지 폴더 설정
image_folder = ""  # 이미지 폴더 경로를 실제 경로

# 이미지 폴더를 감시하고 새 이미지가 생성될 때 호출되는 이벤트 핸들러 클래스
class ImageHandler(FileSystemEventHandler):
    def on_created(self, event):
        if not event.is_directory and event.src_path.endswith((".jpg", ".png", ".jpeg")):
            print(f"New image detected: {event.src_path}")
            upload_image(event.src_path)

# 이미지 파일을 Flask 웹 서버로 업로드하는 함수
def upload_image(image_path):
    # 이미지 파일 열기
    with open(image_path, "rb") as image_file:
        files = {"image": (datetime.now().strftime("sinwook_%Y%m%d%H%M%S.jpg"), image_file)}
        try:
            response = requests.post(flask_server_url, files=files)
            if response.status_code == 200:
                print("Image successfully uploaded.")
            else:
                print(f"Failed to upload image. Status code: {response.status_code}")
        except Exception as e:
            print(f"An error occurred: {str(e)}")

if __name__ == "__main__":
    # 이미지 폴더를 감시하는 Observer 생성
    event_handler = ImageHandler()
    observer = Observer()
    observer.schedule(event_handler, path=image_folder, recursive=False)

    # Observer 시작
    observer.start()

    try:
        while True:
            time.sleep(1)  # 계속 실행 중이므로 종료하지 않도록 sleep
    except KeyboardInterrupt:
        observer.stop()
    observer.join()

