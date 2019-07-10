package com.kitri.hotpicks.admin.controller;

import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.hotpicks.admin.service.VisitCountService;

@Controller
@RequestMapping("/visit")
public class VisitCountController {
	
	@Autowired
	private VisitCountService visitCountService;
	
	@RequestMapping("/nonvisitor")
	public String nonVisitorProcess(HttpServletRequest request) {
		Calendar calendar = new GregorianCalendar();
		int year = calendar.get(Calendar.YEAR);
		StringBuffer sbyear = new StringBuffer();
		sbyear.append(year);
		year = Integer.parseInt(sbyear.substring(2, 4).toString());
		int month = calendar.get(Calendar.MONTH)+1;
		String strmonth = month <10 ? "0"+month : month+"" ; 
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		String date = year+"/"+strmonth+"/"+day;
		int cnt = visitCountService.selectVisitCount(date);
		System.out.println("non cnt : " + cnt);
		System.out.println("non date : " + date);
		if (cnt == 0) {
			visitCountService.insertVisitCountRow();
		} else {
			visitCountService.updateVisitCount(date);
		}
		String referer = request.getHeader("Referer");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/visitor")
	public String visitorProcess(HttpServletRequest request) {
		Calendar calendar = new GregorianCalendar();
		int year = calendar.get(Calendar.YEAR);
		StringBuffer sbyear = new StringBuffer();
		sbyear.append(year);
		year = Integer.parseInt(sbyear.substring(2, 4).toString());
		int month = calendar.get(Calendar.MONTH)+1;
		String strmonth = month <10 ? "0"+month : month+"" ; 
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		String date = year+"/"+strmonth+"/"+day;
		int cnt = visitCountService.selectVisitCount(date);
		System.out.println("cnt : " + cnt);
		System.out.println("date : " + date);
		if (cnt == 0) {
			visitCountService.insertVisitorCountRow();
		} else {
			visitCountService.updateVisitor(date);
		}
		String referer = request.getHeader("Referer");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/newvisitor")
	public String newVisitorProcess(HttpServletRequest request) {
		Calendar calendar = new GregorianCalendar();
		int year = calendar.get(Calendar.YEAR);
		StringBuffer sbyear = new StringBuffer();
		sbyear.append(year);
		year = Integer.parseInt(sbyear.substring(2, 4).toString());
		int month = calendar.get(Calendar.MONTH)+1;
		String strmonth = month <10 ? "0"+month : month+"" ; 
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		String date = year+"/"+strmonth+"/"+day;
		int cnt = visitCountService.selectVisitCount(date);
		System.out.println("cnt : " + cnt);
		System.out.println("date : " + date);
		if (cnt == 0) {
			visitCountService.insertVisitorCountRow();
		} else {
			visitCountService.updateNewVisitor(date);
		}
		String referer = request.getHeader("Referer");
		return "redirect:/index.jsp";
	}
}
