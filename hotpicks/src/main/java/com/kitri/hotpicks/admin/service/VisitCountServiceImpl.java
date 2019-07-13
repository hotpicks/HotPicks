package com.kitri.hotpicks.admin.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.hotpicks.admin.dao.VisitCountDao;

@Service
public class VisitCountServiceImpl implements VisitCountService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public int selectVisitCount(String date) {
		int cnt = sqlsession.getMapper(VisitCountDao.class).selectVisitCount(date);
		return cnt;
	}

	@Override
	public void insertVisitCountRow() {
		sqlsession.getMapper(VisitCountDao.class).insertVisitCountRow();
	}
	@Override
	public void insertVisitorCountRow() {
		sqlsession.getMapper(VisitCountDao.class).insertVisitorCountRow();
	}
	@Override
	public void updateVisitCount(String date) {
		sqlsession.getMapper(VisitCountDao.class).updateVisitCount(date);
	}

	@Override
	public void updateVisitor(String date) {
		sqlsession.getMapper(VisitCountDao.class).updateVisitor(date);
	}
	
	@Override
	public void updateNewVisitor(String date) {
		sqlsession.getMapper(VisitCountDao.class).updateNewVisitor(date);
	}

}
