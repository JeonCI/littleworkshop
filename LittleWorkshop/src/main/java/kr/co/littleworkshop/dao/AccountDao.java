package kr.co.littleworkshop.dao;

import java.util.List;

import kr.co.littleworkshop.model.Account;
import kr.co.littleworkshop.model.ProfileImage;

public interface AccountDao {

	Account login(Account account);

	void signup(Account item);

	List<Account> list();

	void delete(String id);

	void update(Account item);

	int checkId(Account account);

	Account item(String id);

	void addProfileImage(ProfileImage item);

	ProfileImage getProfileImage(String id);

	void updateProfileImage(ProfileImage item);

}
