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
	public List<PickListDto> listArticle(String userid) {
		return sqlSession.getMapper(MypicksDamDao.class).listArticle(userid);
	}

	@Override
	@Transactional
	public PickListDto viewArticle(int seq) {
		return null;
		
	}

	@Override
	public int modifyArticle(PickListDto pickListDto) {
		return 0;
	}

	@Override
	public void deleteArticle(int seq) {
		
	}

	
}
