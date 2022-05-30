package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.model.FdOption;
import kr.co.littleworkshop.model.FdOptionDetail;

@Repository
public class FdDaoImpl implements FdDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Fd> list() {
		return sql.selectList("fd.list");
	}

	@Override
	public Fd item(int fdCode) {
		return sql.selectOne("fd.item", fdCode);
	}

	@Override
	public List<Fd> categories() {
		return sql.selectList("fd.categories");
	}

	@Override
	public void add(Fd fd) {
		sql.insert("fd.add", fd);
	}

	@Override
	public void update(Fd fd) {
		sql.update("fd.update", fd);
	}

	@Override
	public void initFdOption(int fdCode) {
		sql.delete("fd.initFdOption", fdCode);
	}

	@Override
	public void fdOptionAdd(FdOption fdOption) {
		sql.insert("fd.fdOptionAdd", fdOption);
	}

	@Override
	public void fdOptionDetailAdd(FdOptionDetail fdOptionDetail) {
		sql.insert("fd.fdOptionDetailAdd", fdOptionDetail);
	}

	@Override
	public void delete(int fdCode) {
		sql.delete("fd.delete", fdCode);
	}

}
