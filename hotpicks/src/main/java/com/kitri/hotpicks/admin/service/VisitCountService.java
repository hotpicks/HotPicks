package com.kitri.hotpicks.admin.service;

public interface VisitCountService {
	int selectVisitCount(String date);
	void insertVisitCountRow();
	void insertVisitorCountRow();
	void updateVisitCount(String date);
	void updateVisitor(String date);
	void updateNewVisitor(String date);
}
