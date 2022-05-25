package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.AccountInqueryDao;
import kr.co.littleworkshop.model.AccountInquery;

@Service
public class AccountInqueryServiceImpl implements AccountInqueryService {
	
	@Autowired
	AccountInqueryDao dao;
	
	@Override
	public List<AccountInquery> list() {
		return dao.list();
	}

	@Override
	public List<AccountInquery> CategoryList() {
		return dao.categoryList();
	}

	@Override
	public void add(AccountInquery item) {
		dao.add(item);
	}

	@Override
	public AccountInquery item(int accountInqueryCode) {
		AccountInquery item = new AccountInquery();
		
		item.setAccountInqueryCode(accountInqueryCode);
		
		return dao.item(item);
	}

	@Override
	public void update(AccountInquery item) {
		dao.update(item);
	}

	@Override
	public void delete(int accountInqueryCode) {
		dao.delete(accountInqueryCode);
	}

}
