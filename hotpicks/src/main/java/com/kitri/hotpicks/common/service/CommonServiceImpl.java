package com.kitri.hotpicks.common.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.common.dao.CommonDao;
import com.kitri.hotpicks.util.CafeConstance;
import com.kitri.hotpicks.util.NumberCheck;
import com.kitri.hotpicks.util.PageNavigation;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getNextSeq() {
		
		return sqlSession.getMapper(CommonDao.class).getNextSeq();
		
	}
	
	@Override
	public int getReNextSeq() {
		
		return sqlSession.getMapper(CommonDao.class).getReNextSeq();
		
	}

	@Override
	   public PageNavigation getPageNavigation(Map<String, String> parameter) {
	      PageNavigation navigation = new PageNavigation();
	      
//	      int newArticleCount = sqlSession.getMapper(CommonDao.class).getNewArticleCount(Integer.parseInt(parameter.get("bcode")));
//	      navigation.setNewArticleCount(newArticleCount);
	      
	      int totalArticleCount = sqlSession.getMapper(CommonDao.class).getTotalArticleCount(parameter);
	      navigation.setTotalArticleCount(totalArticleCount);
	      
	      int totalPageCount = (totalArticleCount -1) / CafeConstance.ARTICLE_SIZE +1;
	      navigation.setTotalPageCount(totalPageCount);
	      
	      int pg = NumberCheck.NotNumberToOne(parameter.get("pg"));
	      navigation.setNowFirst(pg <= CafeConstance.PAGE_SIZE);
	      navigation.setNowEnd((totalPageCount-1)/CafeConstance.PAGE_SIZE * CafeConstance.PAGE_SIZE < pg);
	      navigation.setPageNo(pg);
	      return navigation;
	   }
	
}
