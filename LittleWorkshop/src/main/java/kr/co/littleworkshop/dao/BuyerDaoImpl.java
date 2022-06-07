package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Account;

@Repository
public class BuyerDaoImpl implements BuyerDao {
	
	@Autowired
	SqlSession sql;


}
