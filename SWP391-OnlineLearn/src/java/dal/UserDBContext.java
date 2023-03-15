/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import util.DateTimeHelper;

/**
 *
 * @author Khangnekk
 */
public class UserDBContext extends DBContext<User> {

    public List<User> getNomalUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.full_name,u.dob,u.gender,u.parent_email,u.parent_name,u.parent_phone_number,u.username FROM [User] u\n"
                + "JOIN Account a ON a.username = u.username\n"
                + "WHERE a.classify_account = 'normal'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setFull_name(rs.getString("full_name"));
                u.setDob(DateTimeHelper.toDateSql(rs.getDate("dob")));
                u.setGender(rs.getBoolean("gender"));
                u.setParent_email(rs.getString("parent_email"));
                u.setParent_name(rs.getString("parent_name"));
                u.setParent_phone_number(rs.getString("parent_phone_number"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getPremiumUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.full_name,u.dob,u.gender,u.parent_email,u.parent_name,u.parent_phone_number,u.username FROM [User] u\n"
                + "JOIN Account a ON a.username = u.username\n"
                + "WHERE a.classify_account = 'premium'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setFull_name(rs.getString("full_name"));
                u.setDob(DateTimeHelper.toDateSql(rs.getDate("dob")));
                u.setGender(rs.getBoolean("gender"));
                u.setParent_email(rs.getString("parent_email"));
                u.setParent_name(rs.getString("parent_name"));
                u.setParent_phone_number(rs.getString("parent_phone_number"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getTotalUser() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.full_name,u.dob,u.gender,u.parent_email,u.parent_name,u.parent_phone_number,u.username FROM [User] u\n"
                + "JOIN Account a ON a.username = u.username\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setFull_name(rs.getString("full_name"));
                u.setDob(DateTimeHelper.toDateSql(rs.getDate("dob")));
                u.setGender(rs.getBoolean("gender"));
                u.setParent_email(rs.getString("parent_email"));
                u.setParent_name(rs.getString("parent_name"));
                u.setParent_phone_number(rs.getString("parent_phone_number"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void insert(User model) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([full_name]\n"
                + "           ,[dob]\n"
                + "           ,[gender]\n"
                + "           ,[parent_name]\n"
                + "           ,[parent_email]\n"
                + "           ,[parent_phone_number]\n"
                + "           ,[username])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getFull_name());
            stm.setDate(2, DateTimeHelper.toDateSql(model.getDob()));
            stm.setBoolean(3, model.isGender());
            stm.setString(4, model.getParent_name());
            stm.setString(5, model.getParent_email());
            stm.setString(6, model.getParent_phone_number());
            stm.setString(7, model.getUsername());
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    @Override
    public void update(User model) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [full_name] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[parent_name] = ?\n"
                + "      ,[parent_email] = ?\n"
                + "      ,[parent_phone_number] = ?\n"
                + " WHERE [username] = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getFull_name());
            stm.setDate(2, DateTimeHelper.toDateSql(model.getDob()));
            stm.setBoolean(3, model.isGender());
            stm.setString(4, model.getParent_name());
            stm.setString(5, model.getParent_email());
            stm.setString(6, model.getParent_phone_number());
            stm.setString(7, model.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void delete(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public User getUserByUsername(String username) {
        User user = new User();
        String sql = "SELECT * FROM [User] WHERE username = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user.setUser_id(rs.getInt("user_id"));
                user.setFull_name(rs.getString("full_name"));
                user.setGender(rs.getBoolean("gender"));
                user.setDob(rs.getDate("dob"));
                user.setParent_name(rs.getString("parent_name"));
                user.setParent_email(rs.getString("parent_email"));
                user.setParent_phone_number(rs.getString("parent_phone_number"));
                user.setUsername(username);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<User> getTotalUserByKey(String keyRAW) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.full_name,u.dob,u.gender,u.parent_email,u.parent_name,u.parent_phone_number,u.username FROM [User] u \n"
                + "JOIN Account a ON a.username = u.username\n"
                + "WHERE u.full_name LIKE ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            String key = "%" + keyRAW + "%";
            stm.setString(1, key);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setFull_name(rs.getString("full_name"));
                u.setDob(DateTimeHelper.toDateSql(rs.getDate("dob")));
                u.setGender(rs.getBoolean("gender"));
                u.setParent_email(rs.getString("parent_email"));
                u.setParent_name(rs.getString("parent_name"));
                u.setParent_phone_number(rs.getString("parent_phone_number"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<User> getPremiumUserByKey(String keyRAW) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.full_name,u.dob,u.gender,u.parent_email,u.parent_name,u.parent_phone_number,u.username FROM [User] u \n"
                + "JOIN Account a ON a.username = u.username\n"
                + "WHERE u.full_name LIKE ? AND a.classify_account = 'premium'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            String key = "%" + keyRAW + "%";
            stm.setString(1, key);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setFull_name(rs.getString("full_name"));
                u.setDob(DateTimeHelper.toDateSql(rs.getDate("dob")));
                u.setGender(rs.getBoolean("gender"));
                u.setParent_email(rs.getString("parent_email"));
                u.setParent_name(rs.getString("parent_name"));
                u.setParent_phone_number(rs.getString("parent_phone_number"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public List<User> getNormalUserByKey(String keyRAW) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.full_name,u.dob,u.gender,u.parent_email,u.parent_name,u.parent_phone_number,u.username FROM [User] u \n"
                + "JOIN Account a ON a.username = u.username\n"
                + "WHERE u.full_name LIKE ? AND a.classify_account = 'normal'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            String key = "%" + keyRAW + "%";
            stm.setString(1, key);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setFull_name(rs.getString("full_name"));
                u.setDob(DateTimeHelper.toDateSql(rs.getDate("dob")));
                u.setGender(rs.getBoolean("gender"));
                u.setParent_email(rs.getString("parent_email"));
                u.setParent_name(rs.getString("parent_name"));
                u.setParent_phone_number(rs.getString("parent_phone_number"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
