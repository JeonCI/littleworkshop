package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Account;

public interface AccountService {

	boolean login(Account account);

	void signup(Account item);

	List<Account> list();

	void delete(String id);

	Account item(String id);

	void update(Account item);

	boolean checkId(Account account);



}
