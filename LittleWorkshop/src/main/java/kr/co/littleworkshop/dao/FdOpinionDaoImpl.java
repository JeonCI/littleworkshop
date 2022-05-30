package kr.co.littleworkshop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.littleworkshop.model.FdOpinion;

@Repository
public class FdOpinionDaoImpl implements FdOpinionDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<FdOpinion> fdOpinionList(int fdCode) {
		return sql.selectList("fdOpinion.list", fdCode);
	}

	@Override
	public void fdOpinionAdd(FdOpinion fdOpinion) {
		sql.insert("fdOpinion.add", fdOpinion);
	}

}
