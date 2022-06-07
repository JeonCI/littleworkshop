package kr.co.littleworkshop.service;

import java.util.List;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.AccountAddress;
import kr.co.littleworkshop.model.ReceiveRequest;

public interface AccountAddressService {

	List<AccountAddress> list(String id);

	void add(AccountAddress address);

	List<ReceiveRequest> requestList();

	void delete(int code, String id);

	void update(AccountAddress address);

	AccountAddress item(int code, String id);

}
