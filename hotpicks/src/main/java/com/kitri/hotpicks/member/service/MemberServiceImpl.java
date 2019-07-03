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

	@Override
	public void modify(MemberDto memberDto) {
		System.out.println("s_Impl : 정보수정 메소드 실행");
		if(memberDto.getNewpass() != "") {
			sqlSession.getMapper(MemberDao.class).modifynew(memberDto); //비밀번호 변경 + 정보 수정
		}else {
			sqlSession.getMapper(MemberDao.class).modify(memberDto);	//비밀번호 유지 + 정보 수정
		}
	}

	@Override
	public void exit(MemberDto memberDto) {
		System.out.println("s_Impl : 회원탈퇴 메소드 실행");
		sqlSession.getMapper(MemberDao.class).exit(memberDto);
	}


}
