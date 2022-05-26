package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Account;

@Repository
public class AccountDaoImpl implements AccountDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public Account login(Account account) {
		return sql.selectOne("account.login", account);
	}

	@Override
	public void signup(Account item) {
		sql.insert("account.signup", item);
	}

	@Override
	public List<Account> list() {
		return sql.selectList("account.list");
	}

	@Override
	public void delete(String id) {
		sql.delete("account.delete");
	}

	@Override
	public void item(Account item) {
		sql.selectOne("account.item", item);
	}

	@Override
	public void update(Account account) {
		sql.update("account.update", account);
	}

}
