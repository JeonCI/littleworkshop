package kr.co.littleworkshop.util;

import java.math.BigInteger;
import java.security.MessageDigest;

import kr.co.littleworkshop.model.Account;

public class SaltCode {
	public void accountSaltCode(Account account) {
		String password = account.getPasswd();
		String SaltCode = account.getId();
		
	    for(int i = 0; i < 3; i++) {
	       MessageDigest md = null;
	       
	       try {
	          md = MessageDigest.getInstance("SHA-256");
	       } catch (Exception e) {
	          System.out.println(e);
	       }
	       
	       md.update(SaltCode.getBytes());
	       md.update(password.getBytes());
	      
	       String hex = String.format("%064x", new BigInteger(1, md.digest()));
	       password = hex;
	     
	    }
	    account.setPasswd(password);
	    System.out.println(password);
  }
	
		
}


	
	

	
