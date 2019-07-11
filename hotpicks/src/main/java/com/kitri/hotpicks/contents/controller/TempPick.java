package com.kitri.hotpicks.contents.controller;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.hotpicks.contents.dao.tempPickDao;
import com.kitri.hotpicks.mypicks.model.PickListDto;

@Controller
@RequestMapping("/temp")
public class TempPick {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping(value = "/pick",method = RequestMethod.GET)
	@ResponseBody
	public int tempPick(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		int cnt =  sqlsession.getMapper(tempPickDao.class).tempPick(map);
		return cnt;
	}
	
	@RequestMapping("/insertpick")
	@ResponseBody
	public void insertPick(@RequestParam Map<String, Object> map) {
		System.out.println("ins : "+ map);
		sqlsession.getMapper(tempPickDao.class).insertPick(map);
	}
	
	@RequestMapping("/deletepick")
	@ResponseBody
	public void deletePick(@RequestParam Map<String, Object> map) {
		System.out.println("del : "+ map);
		sqlsession.getMapper(tempPickDao.class).deletePick(map);
	}
}
