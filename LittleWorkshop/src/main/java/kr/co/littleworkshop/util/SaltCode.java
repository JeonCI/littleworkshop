package kr.co.littleworkshop.util;

import java.math.BigInteger;
import java.security.MessageDigest;

import kr.co.littleworkshop.model.Account;

public class SaltCode {
	public void accountSaltCode(Account account) {
		String SaltCode = account.getId();
			    
	    for(int i = 0; i < 3; i++) {
	       MessageDigest md = null;
	       
	       try {
	          md = MessageDigest.getInstance("SHA-256");
	       } catch (Exception e) {
	          System.out.println(e);
	       }
	       
	       md.update(SaltCode.getBytes());
	       
	       String hex = String.format("%064x", new BigInteger(1, md.digest()));
	       
	       SaltCode = hex;
	       System.out.println(SaltCode);
	    }
	    account.setSaltCode(SaltCode);

  }
	
		
}


	
	

	
