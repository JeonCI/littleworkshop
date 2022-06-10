package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.FdOpinion;
import kr.co.littleworkshop.util.FdPager;

@Repository
public class FdOpinionDaoImpl implements FdOpinionDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<FdOpinion> fdOpinionList(FdPager pager) {
		return sql.selectList("fdOpinion.list", pager);
	}

	@Override
	public void fdOpinionAdd(FdOpinion fdOpinion) {
		sql.insert("fdOpinion.fdOpinionAdd", fdOpinion);
	}

	@Override
	public int total(FdPager pager) {
		return sql.selectOne("fdOpinion.total", pager);
	}

	@Override
	public void confirm(FdOpinion fdOpinion) {
		sql.update("fdOpinion.confirm", fdOpinion);
	}

	@Override
	public void removeConfirm(FdOpinion fdOpinion) {
		sql.update("fdOpinion.removeConfirm", fdOpinion);
	}

	@Override
	public void updateProducerAnswer(FdOpinion fdOpinion) {
		sql.update("fdOpinion.updateProducerAnswer", fdOpinion);
	}

}
