package com.kitri.hotpicks.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.admin.model.CommonContentsDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ReviewDto;
import com.kitri.hotpicks.member.model.MemberDto;

public interface AdminService {

	// 회원 관리
	Map<String, String> getMemberCount();
	List<MemberDto> getMembers(String memberType);
	void getOutMember(Map<String, ArrayList<String>> map);
	void outCancelMember(Map<String, ArrayList<String>> map);

	// 게시글 (리뷰) 관리
	Map<String, String> getReviewCount();
	List<Map<String, String>> getReviews(String reviewType);
	void deleteReview(Map<String, ArrayList<String>> map);
	
	// 회원 선호도 통계
	Map<String, String> statDate();
	List<Map<String, String>> getHashTags(String hashtagType);
	List<Map<String, Integer>> getrCateStat();
	List<Map<String, Integer>> getpCateStat();
	
	// 방문 통계
	Map<String, String> getTodayVisit();
	List<Map<String, String>> getVisitStat(String visitType);
	List<ContentsDto> getContents(Map<String, Object> map);
	void isendupdate(Map<String, Object> map);
	CommonContentsDto getCommonContentsDto();
}
