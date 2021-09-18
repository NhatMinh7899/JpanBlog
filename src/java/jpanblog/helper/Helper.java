/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpanblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Admin
 */
public class Helper {
    public static boolean deleteFile(String path) {
        boolean f = false;
        try {
            //tạo 1 đường dẫn đến file đó
            File file = new File(path);
            f = file.delete(); // Xóa file --> Hàm sẽ trả về giá trị true hay false

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;

        try {
            byte b[] = new byte[is.available()]; //tạo 1 mảng byte từ file hình ảnh

            is.read(b); //đọc hình ảnh đó

            FileOutputStream fos = new FileOutputStream(path); 

            fos.write(b);//xuất file và ghi vào tệp
            fos.flush();
            fos.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }
}
