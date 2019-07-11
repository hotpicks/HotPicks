package com.kitri.hotpicks.contents.dao;

import java.util.List;
import java.util.Map;

import com.kitri.hotpicks.contents.model.ContentsDetailDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsImageDto;
import com.kitri.hotpicks.contents.model.ContentsTypeDto;
import com.kitri.hotpicks.contents.model.SidoDto;
import com.kitri.hotpicks.contents.model.SigunguDto;

public interface ContentsDao {

	
	
//select contents list process
	List<ContentsDto>contentslist(Map<String,Object> parameter);
	/*<![CDATA[
 	WHERE ROWNUM < 20
 	]]>*/
	
	//select detail	
	//ContentsDetailDto contentsdetail();
	
//Select location process
	List<SidoDto> selectSido();
	
	List<SigunguDto> selectSigungu(int sdCode);
	
//contents update process
	//api 목록 list와 db의 list를 비교하여(where contentId in (list)
	//선 delete 진행 후 insert
	
	//void updateContents(int contentsId);

	//delete contents process
	void deleteContents(int contentsId);
	
	void deleteContentsDetail(int contentsId);
	
	//insert contents process
	void insertContentsCate();
	List<ContentsTypeDto> selectContentsType();
	void insertApiContents(ContentsDto contentsDto);	
	void insertApiContentsDetail(ContentsDetailDto contentsDetailDto);
	void insertApiContentsimage(ContentsImageDto contentsImageDto);
	

	
//Insert Location Process
	//insert sido
	void insertSido(List<SidoDto> sidoData);
	//insert sigungu
	void insertSigunguEx(List<Integer> sdList);
	void insertSigungu(SigunguDto sigunguDto);
	void insertSigunguList(List<SigunguDto> sigunguData);

	
}
