package kr.co.littleworkshop.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	public void setCookie(HttpServletResponse res, String value) {
		Cookie cookie = new Cookie("basket",value);
		cookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효기간 7일
		cookie.setPath("/"); // 접근 경로 설정
		res.addCookie(cookie);
	}
	
	public boolean getCookie(HttpServletRequest req, String cookId) {
		Cookie[] cookies = req.getCookies(); 
		
	    if(cookies!=null)
	        for (Cookie c : cookies) {
	            String name = c.getName(); 
	            if (name.equals(cookId)) {
	                return true;
	            }
	        }
	
	    return false;
	}

	public String selectCookie(HttpServletRequest req, String cookId) {
		Cookie[] cookies = req.getCookies(); 
		
	    if(cookies!=null)
	        for (Cookie c : cookies) {
	            String name = c.getName(); 
	            if (name.equals(cookId)) {
	                return c.getValue();
	            }
	        }
	
	    return null;
	}

	public void dropCookie(HttpServletResponse res, String cookId) {
		
		Cookie cookie = new Cookie(cookId, null); 
		
		cookie.setMaxAge(0); 
		res.addCookie(cookie); 
	}

	public void dropAllCookie(HttpServletRequest req, HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null)
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0); // 만료기간 0으로 설정
				res.addCookie(cookies[i]); // 응답에 추가하여 만료.
			}
	}

}
