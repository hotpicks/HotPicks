package com.kitri.hotpicks.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

public interface AdminDao {
	
	// 회원 관리
	public Map<String , String> getMemberCount();
	public List<MemberDto> getAllMembers();
	public List<MemberDto> getBlockMembers();
	public void getOutMember(Map<String, ArrayList<String>> map);
	public void outCancelMember(Map<String, ArrayList<String>> map);

	// 게시글 (리뷰) 관리
	public Map<String, String> getReviewCount();
	public List<Map<String, String>> getAllReviews();
	public List<Map<String, String>> getBlockReviews();
	public void deleteReview(Map<String, ArrayList<String>> map);
	public void deleteBReview(Map<String, ArrayList<String>> map);
	
	// 사용자 선호도 통계
	public Map<String, String> getStatDate();
	public List<Map<String, String>> getHashTags(String hashtagType);
	public List<Map<String, Integer>> getrCateStat();
	public List<Map<String, Integer>> getpCateStat();

	// 방문 통계
	public Map<String, String> getTodayVisit();
	public List<Map<String, String>> getVisitStat(String visitType);

}
