package com.kitri.hotpicks.contents.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kitri.hotpicks.contents.dao.ContentsDao;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsTypeDto;
import com.kitri.hotpicks.contents.model.SidoDto;
import com.kitri.hotpicks.contents.model.SigunguDto;

@Service
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private SqlSession sqlSession;

	

	@Override
	public void insertApiProcess(String urlStr) {

//		String ee = "&cat1=A02&" + "&cat2=A0207" + "&cat3=A02070100";

//		int len = sdList.size();
//		for (int i = 0; i < len; i++) {
//			sigunguUrl = sigunguUrlOrigin + "&areaCode=" + sdList.get(i);
//			System.out.println(sdList.get(i));
//		}
	
		List<ContentsTypeDto> typeList = sqlSession.getMapper(ContentsDao.class).selectContentsType();
		System.out.println(typeList.toString());
		
		String contentsUrlStr = urlStr + "&cat2=" + typeList.get(0).getCatCode();

		String data = "";
		BufferedReader br = null;
		//List<ContentsDto> contentslist = null;
		List<Integer> contentsIdList = null;
		ContentsDto contentsDto = null;
		URL url;

		try {
			url = new URL(contentsUrlStr);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

			String line;
			while ((line = br.readLine()) != null) {
				data = data.concat(line);
			}

			// 받은 데이터확인
			//System.out.println("data : " + data);
			// 문자열데이터 객체화
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(data);
			//System.out.println("obj : " + obj);
			// top레벨의 response 키로 데이터 파싱
			JSONObject parse_response = (JSONObject) obj.get("response");
			JSONObject parse_body = (JSONObject) parse_response.get("body");
			System.out.println("body : " + parse_body);
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			JSONArray parse_itemlist = (JSONArray) parse_items.get("item");
			JSONObject item = null;

			//contentslist = new ArrayList<ContentsDto>();
			contentsIdList = new ArrayList<Integer>();
			for (int i = 0; i < parse_itemlist.size(); i++) {
				item = (JSONObject) parse_itemlist.get(i);
				contentsDto = new ContentsDto();
				int contentsId = Integer.valueOf(item.get("contentid").toString());
				contentsDto.setContentsId(contentsId);
				contentsIdList.add(contentsId);
				contentsDto.setTitle(item.get("title").toString());
				contentsDto.setCatId(typeList.get(0).getCatId());
				contentsDto.setCatCode(typeList.get(0).getCatCode().toString());
//				contentsDto.setSdCode(Integer.valueOf(item.get("areacode").toString()));
				contentsDto.setSdCode(Integer.valueOf((item.get("areacode") != null ? item.get("areacode") : 0).toString()));
//				contentsDto.setSggCode(Integer.valueOf(item.get("sigungucode").toString()));
				contentsDto.setSggCode(Integer.valueOf((item.get("sigungucode") != null ? item.get("sigungucode") : 0).toString()));
				contentsDto.setImage1(
						(item.get("firstimage1") != null ? item.get("firstimage1").toString().replace("\\", "") : "x"));
				contentsDto.setImage2(
						(item.get("firstimage2") != null ? item.get("firstimage2").toString().replace("\\", "") : "x"));
				contentsDto.setHit(0);
				
				
				sqlSession.getMapper(ContentsDao.class).insertApiContents(contentsDto);
				
				//contentslist.add(contentsDto);
				//System.out.println(contentsDto.toString());
				//System.out.println("index : " +i + "/ size : " +parse_itemlist.size() +"/id"+contentsDto.getContentsId());
			}
			

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void insertApiContents(List<Integer> contentsTypeList) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertApiContentsDetail(List<Integer> contentsIdList) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Map<String, String>> apiexc(String urlStr) {


//		///////////////////////////////////////////

		System.out.println(urlStr);
		String data = "";
		BufferedReader br = null;
		List<Map<String, String>> list = null;

		URL url;
		try {
			url = new URL(urlStr);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

			String line;
			while ((line = br.readLine()) != null) {
				data = data.concat(line);
			}
			// 받은 데이터확인
			System.out.println("data : " + data);
			// 문자열데이터 객체화
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(data);
			System.out.println("obj : " + obj);
			// top레벨의 response 키로 데이터 파싱
			JSONObject parse_response = (JSONObject) obj.get("response");
			JSONObject parse_body = (JSONObject) parse_response.get("body");
			System.out.println("body : " + parse_body);
			JSONObject parse_items = (JSONObject) parse_body.get("items");
			JSONArray parse_itemlist = (JSONArray) parse_items.get("item");

			JSONObject item = null;
			list = new ArrayList<Map<String, String>>();
			for (int i = 0; i < parse_itemlist.size(); i++) {
				Map<String, String> map = new HashMap<String, String>();
				item = (JSONObject) parse_itemlist.get(i);
				map.put("title", item.get("title").toString());
				map.put("contentid", item.get("contentid").toString());
				map.put("addr1", (item.get("addr1") != null ? item.get("addr1").toString() : "x"));
				map.put("firstimage1",
						(item.get("firstimage1") != null ? item.get("firstimage1").toString().replace("\\", "") : "x"));
				map.put("firstimage2",
						(item.get("firstimage2") != null ? item.get("firstimage2").toString().replace("\\", "") : "x"));
				list.add(map);
			}

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	public String locationProcess(String locationUrl) {
		/*
		 * 로케이션 추가 프로세스 setsido() : 시도 process(primary key 때문에 선 시도 후 시군구 해야함) 1. api
		 * 시도자료 get 및 list에 담기 2. 코드는 리스트에 추가 및 DB에 list.size() 만큼 insert(1,2번을 한
		 * process로 for문 사용) (1,2)에서 만든 리스트의 contentid 들을 인자값으로 3. api 군구자료 get하고
		 * detailDto에 담기 4. DB에 list.size() 만큼 insert(3,4번을 한 process로 for문)
		 */
		List<Integer> sdList = insertSido(locationUrl);
		if (sdList != null) {
			insertSigungu(locationUrl, sdList);
			return "Success to update Location";
		}

		return "Fail to update Location";
	}

	public List<Integer> insertSido(String sidoUrl) {

		String data = "";
		BufferedReader br;
		SidoDto sido;

		URL url;

		try {
			url = new URL(sidoUrl);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

			String line = "";
			while ((line = br.readLine()) != null) {
				data = data.concat(line);
			}

			// System.out.println("Sido : "+data);
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(data);
			JSONObject responseObj = (JSONObject) obj.get("response");
			JSONObject bodyObj = (JSONObject) responseObj.get("body");
			JSONObject itemsObj = (JSONObject) bodyObj.get("items");
			JSONArray itemArr = (JSONArray) itemsObj.get("item");

			List<Integer> sdList = new ArrayList<Integer>();
			List<SidoDto> sidoData = new ArrayList<SidoDto>();
			for (int i = 0; i < itemArr.size(); i++) {
				JSONObject item = (JSONObject) itemArr.get(i);
				sido = new SidoDto();
				int sdCode = Integer.parseInt(item.get("code").toString());
				// sidocode list
				sdList.add(sdCode);

				sido.setSdCode(sdCode);
				sido.setSdName(item.get("name").toString());
				// sidoDto list
				sidoData.add(sido);

				System.out.println("ListCode : " + sdCode + "/DtoCode : " + item.get("code").toString() + "/DtoName : "
						+ item.get("name").toString());

			}
			sqlSession.getMapper(ContentsDao.class).insertSido(sidoData);

			return sdList;

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public void insertSigungu(String sigunguUrlOrigin, List<Integer> sdList) {

		BufferedReader br;
		URL url;
		SigunguDto sigungu;
		String sigunguUrl;

		int len = sdList.size();
		for (int i = 0; i < len; i++) {
			sigunguUrl = sigunguUrlOrigin + "&areaCode=" + sdList.get(i);
			System.out.println(sdList.get(i));

			try {
				url = new URL(sigunguUrl);
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				urlConnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
				String data = "";
				String line = "";
				while ((line = br.readLine()) != null) {
					data = data.concat(line);
				}

				// System.out.println("Sigungu : "+data);

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(data);
				JSONObject responseObj = (JSONObject) obj.get("response");
				JSONObject bodyObj = (JSONObject) responseObj.get("body");
				JSONObject itemsObj = (JSONObject) bodyObj.get("items");
				int condition = (Integer.valueOf(bodyObj.get("totalCount").toString()));
				if (condition > 1) {
					JSONArray itemArr = (JSONArray) itemsObj.get("item");
					System.out.println(condition + itemArr.toString());

					List<SigunguDto> sigunguData = new ArrayList<SigunguDto>();
					for (int j = 0; j < itemArr.size(); j++) {
						JSONObject item = (JSONObject) itemArr.get(j);
						sigungu = new SigunguDto();
						sigungu.setSggCode(Integer.valueOf(item.get("code").toString()));
						sigungu.setSggName(item.get("name").toString());
						sigungu.setSdCode(sdList.get(i));
						sigunguData.add(sigungu);
					}

					sqlSession.getMapper(ContentsDao.class).insertSigunguList(sigunguData);

				} else {
					JSONObject item = (JSONObject) itemsObj.get("item");
					System.out.println(condition + item.toString());
					sigungu = new SigunguDto();
					sigungu.setSggCode(Integer.valueOf(item.get("code").toString()));
					sigungu.setSggName(item.get("name").toString());
					sigungu.setSdCode(sdList.get(i));

					sqlSession.getMapper(ContentsDao.class).insertSigungu(sigungu);
				}

			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} // end for

	}
	

		
		


	@Override
	public List<SidoDto> selectSido() {
		
		return sqlSession.getMapper(ContentsDao.class).selectSido();
		 
	}

	@Override
	public Map<Integer, List<SigunguDto>> selectSigungu(List<SidoDto> sidoList) {
	
		Map<Integer, List<SigunguDto>> sidogunguMap = new HashMap<Integer, List<SigunguDto>>();
		for(int i = 0 ; i<sidoList.size();i++) {
			System.out.println("list"+sidoList.get(i).getSdCode());
		}
		
		for(SidoDto sido : sidoList) {
			System.out.println("code"+sido.getSdCode());
			sidogunguMap.put(sido.getSdCode(), sqlSession.getMapper(ContentsDao.class).selectSigungu(sido.getSdCode())); 
		}
		
		return sidogunguMap;
	}

	
	

}
