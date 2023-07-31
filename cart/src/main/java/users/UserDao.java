package users;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DbManager;

public class UserDao {

    private DbManager dbManager;

    public UserDao() {
        dbManager = new DbManager();
    }

    public ArrayList<User> getUserList() {
        Connection con = null;
        ArrayList<User> users = new ArrayList<>();
        try {
            con = dbManager.getConnection();
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM users");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setName(rs.getString("name"));
                u.setUserId(rs.getString("userid"));
                u.setAddress(rs.getString("address"));
                u.setEmail(rs.getString("email"));
                u.setPhno(rs.getString("phno"));
                u.setPassword(rs.getString("password"));
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }

    public User getUser(String userId) {
        User user = null;
        try (Connection con = dbManager.getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE userid = ?")) {

            stmt.setString(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phno = rs.getString("phno");
                String password = rs.getString("password");

                user = new User();
                user.setUserId(userId);
                user.setName(name);
                user.setEmail(email);
                user.setAddress(address);
                user.setPhno(phno);
                user.setPassword(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public User updatePassword(String userId, String newPassword) {
        try (Connection con = dbManager.getConnection();
             PreparedStatement stmt = con.prepareStatement("UPDATE users SET password = ? WHERE userid = ?")) {

            stmt.setString(1, newPassword);
            stmt.setString(2, userId);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                return getUser(userId);
            } else {
                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public User registerUser(String name, String address, String email, String phno, String userid, String password) {
        try (Connection con = dbManager.getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM users WHERE userid = ?")) {

            stmt.setString(1, userid);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count > 0) {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        try (Connection con = dbManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "INSERT INTO users (name, address, email, phno, userid, password) VALUES (?, ?, ?, ?, ?, ?)")) {

            stmt.setString(1, name);
            stmt.setString(2, address);
            stmt.setString(3, email);
            stmt.setString(4, phno);
            stmt.setString(5, userid);
            stmt.setString(6, password);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                User newUser = new User();
                newUser.setName(name);
                newUser.setAddress(address);
                newUser.setEmail(email);
                newUser.setPhno(phno);
                newUser.setUserId(userid);
                newUser.setPassword(password);
                return newUser;
            } else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public User login(String userid, String password) {
        User user = null;
        try (Connection con = dbManager.getConnection();
             PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE userid = ? AND password = ?")) {

            stmt.setString(1, userid);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getString("userid"));
                user.setPassword(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public String doHashing(String password) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(password.getBytes());
            byte[] resultByteArray = messageDigest.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : resultByteArray) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
