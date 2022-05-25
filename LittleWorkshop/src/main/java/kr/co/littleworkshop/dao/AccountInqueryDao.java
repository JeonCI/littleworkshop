package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.AccountInquery;

public interface AccountInqueryDao {

	List<AccountInquery> list();

	List<AccountInquery> categoryList();

	void add(AccountInquery item);

	AccountInquery item(AccountInquery item);

	void update(AccountInquery item);

	void delete(int accountInqueryCode);

}
