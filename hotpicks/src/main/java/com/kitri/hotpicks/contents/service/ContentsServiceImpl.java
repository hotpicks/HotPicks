package com.kitri.hotpicks.contents.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
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

import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.SidoDto;

@Service
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, String>> apiexc(String urlStr) {
		System.out.println("왜 service에 안들어와지지?");
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
				map.put("addr1", item.get("addr1").toString());
				map.put("firstimage1", (item.get("firstimage1") != null ?
				item.get("firstimage1").toString().replace("\\","") : "x" ));		
				map.put("firstimage2", (item.get("firstimage2") != null ?
				item.get("firstimage2").toString().replace("\\", "") : "x" ));
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

	public void locationProcess(String locationUrl) {
		/*로케이션 추가 프로세스
		 * setsido() : 시도 process(primary key 때문에 선 시도 후 시군구 해야함)
		 * 1. api 시도자료 get 및 list에 담기
		 * 2. 코드는 리스트에 추가 및 DB에 list.size() 만큼 insert(1,2번을 한 process로 for문 사용)
		 * (1,2)에서 만든 리스트의 contentid 들을 인자값으로
		 * 3. api 군구자료 get하고 detailDto에 담기
		 * 4. DB에 list.size() 만큼 insert(3,4번을 한 process로 for문)
		 */
		insertSido(locationUrl);
//		insertSigungu(locationUrl);
		
	}
	
	public List<Integer> insertSido(String sidoUrl) {
	
		String data = "";
		BufferedReader br = null;
		SidoDto sido = null;
		
		URL url;
		
		try {
			url = new URL(sidoUrl);
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			urlConnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
			
			String line = "";
			while((line = br.readLine()) != null) {
				data = data.concat(line);
			}
			
			//System.out.println("Sido : "+data);
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(data);
			JSONObject responseObj = (JSONObject)obj.get("response");
			JSONObject bodyObj = (JSONObject)responseObj.get("body");
			JSONObject itemsObj = (JSONObject)bodyObj.get("items");
			JSONArray itemArr = (JSONArray)itemsObj.get("item");
			
			
			List<Integer> sdList = new ArrayList<Integer>();
			for(int i=0;i<itemArr.size();i++) {
				JSONObject item = (JSONObject)itemArr.get(i);
				sido = new SidoDto();
				int sdCode = Integer.parseInt(item.get("code").toString());
				sdList.add(sdCode);
				sido.setSdCode(sdCode);
				sido.setSdName(item.get("name").toString());
				System.out.println("ListCode : " + sdCode + "/DtoCode : " + 
					item.get("code").toString() +"/DtoName : " + item.get("name").toString());
				
				//sqlSession.getMapper(ContentsDao.class)
			}
			
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
	
	public void insertSigungu(String sigunguUrl) {
	

		String data = "";
		BufferedReader br = null;
		
		URL url;
		
		try {
			url = new URL(sigunguUrl);
			HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
			urlConnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
			
			String line = "";
			while((line = br.readLine()) != null) {
				data = data.concat(line);
			}
			
			//System.out.println("Sigungu : "+data);
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
