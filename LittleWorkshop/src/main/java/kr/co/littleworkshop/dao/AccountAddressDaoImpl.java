package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.ReceiveRequest;

@Repository
public class AccountAddressDaoImpl implements AccountAddressDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<AccountAddress> list(String id) {
		return sql.selectList("accountAddress.list",id);
	}

	@Override
	public void add(AccountAddress address) {
		sql.insert("accountAddress.add",address);
		
	}

	@Override
	public List<ReceiveRequest> requestList() {
		return sql.selectList("accountAddress.requestList");
	}

	@Override
	public void delete(int code, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);

		sql.delete("accountAddress.delete",map);
		
	}

	@Override
	public AccountAddress item(int code, String id) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("code", code);
		return sql.selectOne("accountAddress.item", map);
	}

	@Override
	public void update(AccountAddress address) {
		sql.update("accountAddress.update",address);
		
	}
}
