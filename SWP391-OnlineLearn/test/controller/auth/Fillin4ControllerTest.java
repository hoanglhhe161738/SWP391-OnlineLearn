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
    public void testCheckInputStringFullName() {
        String inputString  = "Nguyen Luong Khang";
        boolean input = f.checkInputString(inputString);
        String expectationString = "Nguyen Luong Khang";
        boolean expectation = f.checkInputString(expectationString);
        assertEquals(expectation, input);
    }
    @Test
    public void testCheckInputStringFullNameNull() {
        String inputString  = "";
        boolean input = f.checkInputString(inputString);
        String expectationString = "Nguyen Luong Khang";
        boolean expectation = f.checkInputString(expectationString);
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
    public void testIsDateValidFalseNull() {
        Date input = Date.valueOf("");
        boolean isValid = f.isDateValid(input);
        boolean expectation = false;
        assertEquals(expectation, isValid);       
    }
    @Test
    public void testIsDateValidFalse1() {
        Date input = Date.valueOf("30/2/2022");
        boolean isValid = f.isDateValid(input);
        boolean expectation = false;
        assertEquals(expectation, isValid);       
    }
    @Test
    public void testIsDateValidFalse2() {
        Date input = Date.valueOf("-21/3/2022");
        boolean isValid = f.isDateValid(input);
        boolean expectation = false;
        assertEquals(expectation, isValid);       
    }

    @Test
    public void testIsValidEmailFalse() {
        String email = "abc";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    @Test
    public void testIsValidEmailNull() {
        String email = "";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    @Test
    public void testIsValidEmailFalse1() {
        String email = ".vn";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    @Test
    public void testIsValidEmailFalse2() {
        String email = "Khang@";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    @Test
    public void testIsValidEmailFalse3() {
        String email = "Khang @gmail.com";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    @Test
    public void testIsValidEmailFalse4() {
        String email = "Khang@-gmail.com";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = false;
        assertEquals(expectation, isValid);  
    }
    
    @Test
    public void testIsValidEmailTrue() {
        String email = "abc@gmail.com";
        boolean isValid = f.isValidEmail(email);
        boolean expectation = true;
        assertEquals(expectation, isValid);  
    }

    @Test
    public void testIsVietnamesePhoneNumberFalse() {
        String phone = "085856744374";
        boolean isValid = f.isVietnamesePhoneNumber(phone);
        boolean expectation = false;
        assertEquals(expectation, isValid);
    }
    @Test
    public void testIsVietnamesePhoneNumberNull() {
        String phone = "";
        boolean isValid = f.isVietnamesePhoneNumber(phone);
        boolean expectation = false;
        assertEquals(expectation, isValid);
    }
    @Test
    public void testIsVietnamesePhoneNumberTrue() {
        String phone = "0345345467";
        boolean isValid = f.isVietnamesePhoneNumber(phone);
        boolean expectation = true;
        assertEquals(expectation, isValid);
    }
    @Test
    public void testIsVietnamesePhoneNumberFalse2() {
        String phone = "9438bsdh12";
        boolean isValid = f.isVietnamesePhoneNumber(phone);
        boolean expectation = true;
        assertEquals(expectation, isValid);
    }
    @Test
    public void testIsVietnamesePhoneNumberFalse3() {
        String phone = "1265476325432567";
        boolean isValid = f.isVietnamesePhoneNumber(phone);
        boolean expectation = true;
        assertEquals(expectation, isValid);
    }
    
}
