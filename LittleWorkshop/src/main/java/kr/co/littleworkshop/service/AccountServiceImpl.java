package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.AccountDao;
import kr.co.littleworkshop.model.Account;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	AccountDao dao;
	
	@Override
	public boolean login(Account account) {
		Account item = dao.login(account);
		
		if(item != null) {
			account.setAccountRegDate(item.getAccountRegDate());
			account.setClassify(item.getClassify());
			account.setEmail(item.getEmail());
			account.setNickName(item.getNickName());
			account.setId(item.getId());
			account.setPhone(item.getPhone());
			account.setAccountName(item.getAccountName());
			account.setAccountSaltCode(item.getSaltCode());
			
			return true;
		}
		
		return false;
	}

	@Override
	public void signup(Account item) {
		dao.signup(item);
	}

	@Override
	public List<Account> list() {
		return dao.list();
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public Account item(String id) {
		
		return dao.item(id);
	}

	@Override
	public void update(Account item) {
		dao.update(item);
	}

	@Override
	public boolean checkId(Account account) {
		if(dao.checkId(account) == 0)
			return true;
		else
			return false;
	}

}
