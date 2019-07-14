package com.kitri.hotpicks.mypicks.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonParser;
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
	public void modifyArticle(Map<String, Object> map) {
		sqlSession.getMapper(MypicksDamDao.class).modifyArticle(map);
	}


	@Override
	public void deleteArticle(Map<String, ArrayList<String>> map) {
		
		sqlSession.getMapper(MypicksDamDao.class).deleteArticle(map);
		
	}

	@Override
	public List<PickListDto> calArticle(Map<String, String> map) {
		return sqlSession.getMapper(MypicksDamDao.class).calArticle(map);
	}




	
}
