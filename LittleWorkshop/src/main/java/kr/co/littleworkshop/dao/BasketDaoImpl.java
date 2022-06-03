package kr.co.littleworkshop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BasketDaoImpl implements BasketDao {

	@Autowired
	SqlSession sql;
	
}
