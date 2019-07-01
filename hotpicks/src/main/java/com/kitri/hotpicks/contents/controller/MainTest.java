package com.kitri.hotpicks.contents.controller;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/contents")
public class MainTest {

	private static final Logger logger = LoggerFactory.getLogger(MainTest.class);

	@RequestMapping(value = "/enter", method = RequestMethod.GET)
	public String enter(Model model) {
		System.out.println("entered");
		String takapikey = "qldeV%2BL5Ff%2BFi%2BJisZxRFyc1KDitxcPmNkhuwOjk6c7xQDVITEe0oDrh3XFd98iqnW89ky8RMDhQkQIb48h3%2BQ%3D%3D";

		String periodurlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
				+ "numOfRows=10&" + "pageNo=1&" + "MobileOS=ETC&" + "MobileApp=AppTest&" + "listYN=Y&" + "arrange=A&"
				+ "contentTypeId=15&" + "cat1=A02&" + "cat2=A0207&" + "cat3=A02070100&"
				+ "_type=json&" + "ServiceKey=" + takapikey;

//		String categoryurlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?"
//
//				+ "MobileOS=ETC&" + "MobileApp=AppTest&" + "contentTypeId=15&" + "cat1=A02&" + "cat2=A0208&"
//				+ "cat3=A02080300&" + "_type=json&" + "ServiceKey=" + takapikey;

		logger.info("----------------------------------");
		List<Map<String, String>> list = apiexc(periodurlStr);
		model.addAttribute("json", list);

		return "contents/result";

	}

	public List<Map<String, String>> apiexc(String urlStr) {
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
				data += data.concat(line);
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
				// map.put("firstimage1", (item.get("firstimage1") != null ?
				// item.get("firstimage1").toString() : "x" ));
				// map.put("firstimage2", (item.get("firstimage2") != null ?
				// item.get("firstimage1").toString() : "x" ));
				// System.out.println(map.get("firstimage1") + map.get("firstimage2"));
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

}
