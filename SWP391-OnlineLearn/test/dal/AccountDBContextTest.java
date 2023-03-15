/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Account;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Acer
 */
public class AccountDBContextTest {
    
    public AccountDBContextTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Test of updatePassword method, of class AccountDBContext.
     */
    @Test
    public void testUpdatePassword() {
        System.out.println("updatePassword");
        String username = "";
        String newpassword = "";
        AccountDBContext instance = new AccountDBContext();
        instance.updatePassword(username, newpassword);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insertRoll method, of class AccountDBContext.
     */
    @Test
    public void testInsertRoll() {
        System.out.println("insertRoll");
        int role_id = 0;
        String username = "";
        AccountDBContext instance = new AccountDBContext();
        instance.insertRoll(role_id, username);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of login method, of class AccountDBContext.
     */
    @Test
    public void testLogin() {
        System.out.println("login");
        String username = "khadnad";
        String password = "1242345";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = null;
        Account result = instance.login(username, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkAccountExisted method, of class AccountDBContext.
     */
    @Test
    public void testCheckAccountExisted() {
        System.out.println("checkAccountExisted");
        String username = "";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = null;
        Account result = instance.checkAccountExisted(username);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of signup method, of class AccountDBContext.
     */
    @Test
    public void testSignup() {
        System.out.println("signup");
        String username = "";
        String password = "";
        AccountDBContext instance = new AccountDBContext();
        instance.signup(username, password);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of fillin4 method, of class AccountDBContext.
     */
    @Test
    public void testFillin4() {
        System.out.println("fillin4");
        String username = "";
        String password = "";
        AccountDBContext instance = new AccountDBContext();
        instance.fillin4(username, password);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of insert method, of class AccountDBContext.
     */
    @Test
    public void testInsert() {
        System.out.println("insert");
        Account model = null;
        AccountDBContext instance = new AccountDBContext();
        instance.insert(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class AccountDBContext.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        Account model = null;
        AccountDBContext instance = new AccountDBContext();
        instance.update(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class AccountDBContext.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        Account model = null;
        AccountDBContext instance = new AccountDBContext();
        instance.delete(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of get method, of class AccountDBContext.
     */
    @Test
    public void testGet_int() {
        System.out.println("get");
        int id = 0;
        AccountDBContext instance = new AccountDBContext();
        Account expResult = null;
        Account result = instance.get(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of get method, of class AccountDBContext.
     */
    @Test
    public void testGet_String() {
        System.out.println("get");
        String username = "";
        AccountDBContext instance = new AccountDBContext();
        Account expResult = null;
        Account result = instance.get(username);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of list method, of class AccountDBContext.
     */
    @Test
    public void testList() {
        System.out.println("list");
        AccountDBContext instance = new AccountDBContext();
        ArrayList<Account> expResult = null;
        ArrayList<Account> result = instance.list();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateClassifyAccount method, of class AccountDBContext.
     */
    @Test
    public void testUpdateClassifyAccount() {
        System.out.println("updateClassifyAccount");
        Account model = null;
        AccountDBContext instance = new AccountDBContext();
        instance.updateClassifyAccount(model);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
