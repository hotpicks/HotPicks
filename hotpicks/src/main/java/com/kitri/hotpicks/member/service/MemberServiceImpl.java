package com.kitri.hotpicks.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.member.dao.MemberDao;
import com.kitri.hotpicks.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void join(MemberDto memberDto) {

	}

	@Override
	public MemberDto login(MemberDto memberDto) {
		System.out.println("s_Impl : 로그인 메소드 실행");
		return sqlSession.getMapper(MemberDao.class).login(memberDto);
	}

}
