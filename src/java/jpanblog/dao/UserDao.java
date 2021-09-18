/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpanblog.dao;

import jpanblog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user -->database
            //xem cách insert này, dấu chấm hỏi sao dùng dc
            
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            //mỗi thành phần dưới đây ứng với values bên trên
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();
//             lấy dữ liệu từ data gán tạm vào biến String
                String name = set.getString("name");
//             set user tạm vừa tạo để hiện thị với giá trị tên
                user.setName(name);
//              Tương tự với các thành phần ở đây
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update user set name=? , password=? , gender=? ,about=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            //p.setString(2, user.getEmail());
            p.setString(2, user.getPassword());
            p.setString(3, user.getGender());
            p.setString(4, user.getAbout());
            p.setString(5, user.getProfile());
            p.setInt(6, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();


                String name = set.getString("name");
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
