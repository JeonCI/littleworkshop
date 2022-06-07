package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.ReceiveRequest;

public interface AccountAddressDao {

	List<AccountAddress> list(String id);

	void add(AccountAddress address);

	List<ReceiveRequest> requestList();

	void delete(int code, String id);

	AccountAddress item(int code, String id);

	void update(AccountAddress address);

}
