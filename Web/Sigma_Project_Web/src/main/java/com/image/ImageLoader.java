package com.image;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class ImageLoader{

    public ImageLoader() {
        // 생성자 코드 (필요한 경우 추가 작성)
    }

    public static List<ImageData> loadAllImagesFromDatabase(String target_id) throws SQLException, ClassNotFoundException {
        List<ImageData> imageList = new ArrayList<>();
        DataSource dataSource;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/mysql");
            con = dataSource.getConnection();
            pstmt = con.prepareStatement("SELECT * FROM images WHERE id = ? ORDER BY num DESC");
            pstmt.setString(1, target_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int num = rs.getInt("num");
                String id = rs.getString("id");
                String filetime = rs.getString("filetime");
                InputStream inputStream = rs.getBinaryStream("image");


                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();

                ImageData imageData = new ImageData(num, id, filetime, imageBytes);
                imageList.add(imageData);
            }
        } catch (SQLException ex) {
            // SQLException 처리 코드
        } catch (Exception ex) {
            // 기타 예외 처리 코드
        } finally {
            // 자원 해제 코드
        }

        return imageList;
    }
}
