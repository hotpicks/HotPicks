package com.kitri.hotpicks.admin.dao;

public interface VisitCountDao {
	int selectVisitCount(String date);
	void insertVisitCountRow();
	void insertVisitorCountRow();
	void updateVisitCount(String date);
	void updateVisitor(String date);
	void updateNewVisitor(String date);
}
