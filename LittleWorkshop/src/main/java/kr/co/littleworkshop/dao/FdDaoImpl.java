package kr.co.littleworkshop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.Fd;
import kr.co.littleworkshop.model.FdOption;
import kr.co.littleworkshop.model.FdOptionDetail;
import kr.co.littleworkshop.util.FdPager;

@Repository
public class FdDaoImpl implements FdDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Fd> list(FdPager pager) {
		return sql.selectList("fd.list", pager);
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

	@Override
	public int nowCount(int fdCode) {
		return sql.selectOne("fd.nowCount", fdCode);
	}

	@Override
	public void viewCount(Fd fd) {
		sql.update("fd.viewCount", fd);
	}

	@Override
	public void participateFd(int participationPrice, int fdCode, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("participationPrice", participationPrice);
		map.put("fdCode", fdCode);
		map.put("id", id);
		
		sql.insert("fd.participateFd", map);
	}

	@Override
	public int total(FdPager pager) {
		return sql.selectOne("fd.total", pager);
	}

}
