package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.AccountInquery;

public interface AccountInqueryService {

	List<AccountInquery> list();

	List<AccountInquery> CategoryList();

	void add(AccountInquery item);

	AccountInquery item(int accountInqueryCode);

	void update(AccountInquery item);

	void delete(int accountInqueryCode);

}
