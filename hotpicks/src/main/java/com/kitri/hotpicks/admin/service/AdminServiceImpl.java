package com.kitri.hotpicks.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.admin.dao.AdminDao;
import com.kitri.hotpicks.member.model.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, String> getMemberCount() {
		System.out.println("admin_s_Impl : 어제 날짜 회원 수 가져오기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getMemberCount();
	}
	
	@Override
	public List<MemberDto> getMembers(String memberType) {
		System.out.println("admin_s_Impl : 회원 목록 가져오기 메소드 실행 (" + memberType + ")");
		
		List<MemberDto> members = new ArrayList<MemberDto>();
		
		if(memberType.equals("전체회원")) {
			members = sqlSession.getMapper(AdminDao.class).getAllMembers();
		}else if(memberType.equals("신고회원")){
			members = sqlSession.getMapper(AdminDao.class).getBlockMembers();
		}
		
		return members;
	}
		
}
