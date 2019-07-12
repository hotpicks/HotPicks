package com.kitri.hotpicks.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kitri.hotpicks.admin.dao.AdminDao;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, String> getMemberCount() {
		System.out.println("admin_s_Impl : 오늘 날짜 회원 수 가져오기 메소드 실행");

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

	@Override
	public void getOutMember(Map<String, ArrayList<String>> map) {
		System.out.println("admin_s_Impl : 회원 강제 탈퇴 메소드 실행");
		
		sqlSession.getMapper(AdminDao.class).getOutMember(map);
	}
	
	@Override
	public void outCancelMember(Map<String, ArrayList<String>> map) {
		System.out.println("admin_s_Impl : 회원 탈퇴 취소 메소드 실행");
		
		sqlSession.getMapper(AdminDao.class).outCancelMember(map);
	}	
	
	
	@Override
	public Map<String, String> getReviewCount() {
		System.out.println("admin_s_Impl : 오늘 날짜 리뷰 수 가져오기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getReviewCount();
	}

	@Override
	public List<Map<String, String>> getReviews(String reviewType) {
		System.out.println("admin_s_Impl : 리뷰 목록 가져오기 메소드 실행 (" + reviewType + ")");
		
		List<Map<String, String>> reviews = new ArrayList<Map<String, String>>();
		
		if(reviewType.equals("전체리뷰")) {
			reviews = sqlSession.getMapper(AdminDao.class).getAllReviews();
		}else if(reviewType.equals("신고리뷰")){
			reviews = sqlSession.getMapper(AdminDao.class).getBlockReviews();
		}
		
		return reviews;
	}

	@Override
	@Transactional
	public void deleteReview(Map<String, ArrayList<String>> map) {
		System.out.println("admin_s_Impl : 리뷰 삭제 메소드 실행");
		
		// 신고리뷰에서 삭제
		sqlSession.getMapper(AdminDao.class).deleteBReview(map);
		// 리뷰에서 삭제
		sqlSession.getMapper(AdminDao.class).deleteReview(map);
	}

	@Override
	public List<Map<String, String>> getHashTags(String hashtagType) {
		System.out.println("admin_s_Impl : 해시태그 랭킹 얻기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getHashTags(hashtagType);
	}

	@Override
	public Map<String, String> statDate() {
		System.out.println("admin_s_Impl : 통계 기간 얻기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getStatDate();
	}

	@Override
	public List<Map<String, Integer>> getrCateStat() {
		System.out.println("admin_s_Impl : 사용자 선호도 통계 결과(리뷰수 기준) 얻기 메소드 실행");
	
		return sqlSession.getMapper(AdminDao.class).getrCateStat();
	}

	@Override
	public List<Map<String, Integer>> getpCateStat() {
		System.out.println("admin_s_Impl : 사용자 선호도 통계 결과(리뷰수 기준) 얻기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getpCateStat();
	}

	@Override
	public Map<String, String> getTodayVisit() {
		System.out.println("admin_s_Impl : 오늘자 방문 수 + 새 가입자 수 얻기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getTodayVisit();
	}

	@Override
	public List<Map<String, String>> getVisitStat(String visitType) {
		System.out.println("admin_s_Impl : 기간별 방문 그래프 얻기 메소드 실행");

		return sqlSession.getMapper(AdminDao.class).getVisitStat(visitType);
	}

	@Override
	public List<ContentsDto> getContents(int page) {
		return sqlSession.getMapper(AdminDao.class).getContents(page);
	}
	
	
	
	
}
