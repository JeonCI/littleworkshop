package kr.co.littleworkshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.AdminDao;
import kr.co.littleworkshop.model.Account;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao dao;
	
	@Override
	public boolean adminLogin(Account account) {
		Account item = dao.adminLogin(account);
		
		if(item != null) {
			account.setAccountSaltCode(item.getSaltCode());
			
			return true;
		}
		
		return false;
	}

}
