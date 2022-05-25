package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.AccountInquery;

@Repository
public class AccountInqueryDaoImpl implements AccountInqueryDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<AccountInquery> list() {
		return sql.selectList("accountInquery.list");
	}

	@Override
	public List<AccountInquery> categoryList() {
		return sql.selectList("accountInquery.categoryList");
	}

	@Override
	public void add(AccountInquery item) {
		sql.insert("accountInquery.add", item);
	}

	@Override
	public AccountInquery item(AccountInquery item) {
		return sql.selectOne("accountInquery.item", item);
	}

	@Override
	public void update(AccountInquery item) {
		sql.update("accountInquery.update", item);
	}

	@Override
	public void delete(int accountInqueryCode) {
		sql.delete("accountInquery.delete", accountInqueryCode);
	}

}
