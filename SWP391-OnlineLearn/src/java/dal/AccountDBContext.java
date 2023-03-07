/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author T490
 */
import controller.auth.securityProcessorCore;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Feature;
import model.Role;

public class AccountDBContext extends DBContext<Account> {

    
    public Account login(String username, String password){
        String sql = "SELECT * FROM Account \n" +
                       "WHERE username = ? \n" +
                       "and password = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return new Account(rs.getString(1),
                                   rs.getString(2),
                                   rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Account checkAccountExisted(String username){
        String sql = "SELECT * FROM Account \n" +
                       "WHERE username = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql); //open conextion with SQL
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return new Account(rs.getString(1),
                                   rs.getString(2),
                                   rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void signup(String username, String password){
        securityProcessorCore spc = new securityProcessorCore();
        String sql ="INSERT INTO [dbo].[Account]\n" +
"           ([username]\n" +
"           ,[password]\n" +
"           ,[classify_account])\n" +
"     VALUES\n" +
"           (?,\n" +
"           ?,\n" +
"           'nomal')";
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, spc.md5EncodePassword(password));
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void fillin4(String username, String password){
        String sql ="INSERT INTO [dbo].[Account]\n" +
"           ([username]\n" +
"           ,[password]\n" +
"           ,[classify_account])\n" +
"     VALUES\n" +
"           (?,\n" +
"           ?,\n" +
"           'nomal')";
        
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    

    @Override
    public void insert(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Account model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public Account get(String username) {
        Account account = new Account();
        String sql = "SELECT * FROM [Account] WHERE username = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                account.setClassify_account(rs.getString("classify_account"));
                account.setUsername(rs.getString("username"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    @Override
    public ArrayList<Account> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void updateClassifyAccount(Account model) {
        String sql = "UPDATE [Account]\n"
                + "   SET \n"
                + "      [classify_account] = 'premium'\n"
                + " WHERE username = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
