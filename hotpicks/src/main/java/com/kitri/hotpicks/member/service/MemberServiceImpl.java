package com.kitri.hotpicks.member.service;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.member.dao.MemberDao;
import com.kitri.hotpicks.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int join(MemberDto memberDto) {
		System.out.println("s_Impl : 가입 메소드 실행");
		sqlSession.getMapper(MemberDao.class).join(memberDto);
		return 1;

	}

	@Override
	public String idCheck(String userId) {
		System.out.println("s_Impl : id검사 메소드 실행");
		int result = sqlSession.getMapper(MemberDao.class).idCheck(userId);
		
		JSONObject json = new JSONObject();
		json.put("idcount", result);
		
		return json.toString();
	}

	@Override
	public MemberDto login(MemberDto memberDto) {
		System.out.println("s_Impl : 로그인 메소드 실행");
		return sqlSession.getMapper(MemberDao.class).login(memberDto);
	}


}
