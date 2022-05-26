package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Account;

public interface AccountDao {

	Account login(Account account);

	void signup(Account item);

	List<Account> list();

	void delete(String id);

	Account item(Account item);

	void update(Account account);

}
