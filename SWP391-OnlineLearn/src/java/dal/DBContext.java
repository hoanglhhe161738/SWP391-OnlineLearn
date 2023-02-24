/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Khangnekk
 */
public abstract class DBContext<T> {
    protected Connection connection;

    public DBContext() {
        try {
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> parent of 0d23fd5 (remove membership in account.java and fix related things)
            String username = "phankien";
            String password = "sa123456";
<<<<<<< Updated upstream
            String url = "jdbc:sqlserver://localhost\\MSSQL:1433;databaseName=SWP391_Group2";
=======
<<<<<<< HEAD
            String url = "jdbc:sqlserver://localhost\\MSSQLSERVER:1433;databaseName=SWP391_Group2";
>>>>>>> Stashed changes
=======
            String username = "khanhnq";
            String password = "12345";
            String url = "jdbc:sqlserver://localhost\\MSSQLSERVER:1433;databaseName=SWP391_Group2_LHH_2";
>>>>>>> main
>>>>>>> parent of 0d23fd5 (remove membership in account.java and fix related things)
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection =  DriverManager.getConnection(url,username,password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }       
    }
    
    public abstract void insert(T model);
    public abstract void update(T model);
    public abstract void delete(T model);
    public abstract T get(int id);
    public abstract ArrayList<T> list();
    
}
