/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller.auth;

import java.sql.Date;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Khangnekk
 */
public class Fillin4ControllerTest {
    Fillin4Controller f = new Fillin4Controller();
    public Fillin4ControllerTest() {
    }

    @Test
    public void testCheckInputString() {
        String input = "Nguyen";
        String expectation = "Nguyen";
        assertEquals(expectation, input);
    }

    @Test
    public void testIsDateValidTrue() {
        Date input = Date.valueOf("2023-10-25");
        boolean isValid = f.isDateValid(input);
        boolean expectation = false;
        assertEquals(expectation, isValid);
        
    }
    
    @Test
    public void testIsDateValidFalse() {
        Date input = Date.valueOf("");
        boolean isValid = f.isDateValid(input);
        boolean expectation = true;
        assertEquals(expectation, isValid);       
    }

    @Test
    public void testIsValidEmail() {
        String email = "abc";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }

    @Test
    public void testIsVietnamesePhoneNumber() {
        String phone = "085856744374";
        boolean isValid = f.isVietnamesePhoneNumber(phone);
        boolean expectation = false;
        assertEquals(expectation, isValid);
    }
    
}
