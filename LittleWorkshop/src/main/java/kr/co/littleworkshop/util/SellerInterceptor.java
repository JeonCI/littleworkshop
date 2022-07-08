package kr.co.littleworkshop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import kr.co.littleworkshop.model.Account;

public class SellerInterceptor extends HandlerInterceptorAdapter {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		if(session != null) {
			Account account = (Account) session.getAttribute("account");
			if(account != null) {
				if(account.getClassify() == 2)
					return true;
				else {
					response.sendRedirect("/");
					return false;
				}
			}
		}
		
		String referer  = (String)request.getHeader("REFERER");
	
		session.setAttribute("target", referer != null ? referer : "/");
		response.sendRedirect("/login");
		
		return false;
	}

	
}

