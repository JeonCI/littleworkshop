package kr.co.littleworkshop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Account;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public Account adminLogin(Account account) {
		return sql.selectOne("account.adminLogin", account);
	}

}
