/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller.profile;

import java.sql.Date;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Khangnekk
 */
public class changeUserProfileControllerTest {
    changeUserProfileController cup = new changeUserProfileController();
    
    public changeUserProfileControllerTest() {
    }

    @Test
    public void testDoPostProcess() throws Exception {
    }

    @Test
    public void testDoGetProcess() throws Exception {
    }

    @Test
    public void testProcessPost() throws Exception {
    }

    @Test
    public void testProcessGet() throws Exception {
    }

    @Test
    public void testCheckInputStringFullName() {
        String inputString  = "Phan Manh Thang";
        boolean input = cup.checkInputString(inputString);
        String expectationString = "Phan Manh Thang";
        boolean expectation = true;
        assertEquals(expectation, input);
    }
    @Test
    public void testCheckInputStringFullNameNull() {
        String inputString  = "";
        boolean input = cup.checkInputString(inputString);
        String expectationString = "Phan Manh Thang";
        boolean expectation = false;
        assertEquals(expectation, input);
    }

    @Test
    public void testIsDateValidTrue() {
        Date input = Date.valueOf("2023-10-25");
        boolean isValid = cup.isDateValid(input);
        boolean expectation = false;
        assertEquals(expectation, isValid);
        
    }
    
    @Test
    public void testIsDateValidFalse() {
        Date input = Date.valueOf("2002-30-30");
        boolean isValid = cup.isDateValid(input);
        boolean expectation = true;
        assertEquals(expectation, isValid);       
    }

    @Test
    public void testIsValidEmailFalse() {
        String email = "xyz.com";
        boolean isValid = cup.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    @Test
    public void testIsValidEmailTrue() {
        String email = "abc@gmail.com";
        boolean isValid = cup.isValidEmail(email);
        boolean expectation = true;
        assertEquals(expectation, isValid);  
    }

    @Test
    public void testIsVietnamesePhoneNumberFalse() {
        String phone = "jhesfueyrbusefd";
        boolean isValid = cup.isVietnamesePhoneNumber(phone);
        boolean expectation = false;
        assertEquals(expectation, isValid);
    }
    @Test
    public void testIsVietnamesePhoneNumberTrue() {
        String phone = "0345345467";
        boolean isValid = cup.isVietnamesePhoneNumber(phone);
        boolean expectation = true;
        assertEquals(expectation, isValid);
    }
    
}
