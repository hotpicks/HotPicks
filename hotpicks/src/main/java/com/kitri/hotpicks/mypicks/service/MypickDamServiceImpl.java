package com.kitri.hotpicks.mypicks.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.hotpicks.mypicks.dao.MypicksDamDao;
import com.kitri.hotpicks.mypicks.model.PickListDto;
import com.kitri.hotpicks.util.CafeConstance;
import com.kitri.hotpicks.util.NumberCheck;

@Service
public class MypickDamServiceImpl implements MypickDamService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PickListDto> listArticle(Map<String, String> map) {
//		int pg = NumberCheck.NotNumberToOne(parameter.get("pg"));
//		int end = pg * CafeConstance.ARTICLE_SIZE;
//		int start = end - CafeConstance.ARTICLE_SIZE;
//		parameter.put("start", start+"");
//		parameter.put("end", end+"");
		return sqlSession.getMapper(MypicksDamDao.class).listArticle(map);
	}

	@Override
	@Transactional
	public PickListDto viewArticle(String userid) {
		return null;
		
	}

	@Override
	public int modifyArticle(PickListDto pickListDto) {
		return sqlSession.getMapper(MypicksDamDao.class).modifyArticle(pickListDto);
	}

	@Override
	public void deleteArticle(int seq) {
		
	}

	@Override
	public PickListDto getArticle(String userid) {
		return sqlSession.getMapper(MypicksDamDao.class).viewArticle(userid);
	}


	
}
