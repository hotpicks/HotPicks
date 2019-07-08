package com.kitri.hotpicks.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.admin.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, String>> getMembers(String memberType) {
		System.out.println("admin_s_Impl : 회원 목록 가져오기 메소드 실행");
		
		return sqlSession.getMapper(AdminDao.class).getMembers(memberType);
	}
	
}
