package kr.co.littleworkshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.littleworkshop.dao.AccountAddressDao;
import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.ReceiveRequest;

@Service
public class AccountAddressServiceImpl implements AccountAddressService {

	
	@Autowired
	AccountAddressDao dao;

	@Override
	public List<AccountAddress> list(String id) {
		return dao.list(id);
	}

	@Override
	public void add(AccountAddress address) {
		dao.add(address);
		
	}

	@Override
	public List<ReceiveRequest> requestList() {
		return dao.requestList();
	}

	@Override
	public void delete(int code, String id) {
		dao.delete(code,id);
		
	}

	@Override
	public void update(AccountAddress address) {
		dao.update(address);
		
	}

	@Override
	public AccountAddress item(int code, String id) {
		return dao.item(code,id);
	}
}
