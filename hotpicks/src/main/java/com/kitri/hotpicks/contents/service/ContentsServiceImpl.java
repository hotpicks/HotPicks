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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kitri.hotpicks.contents.controller.ContentsController;
import com.kitri.hotpicks.contents.dao.ContentsDao;
import com.kitri.hotpicks.contents.model.ContentsDetailDto;
import com.kitri.hotpicks.contents.model.ContentsDto;
import com.kitri.hotpicks.contents.model.ContentsImageDto;
import com.kitri.hotpicks.contents.model.ContentsTypeDto;
import com.kitri.hotpicks.contents.model.SidoDto;
import com.kitri.hotpicks.contents.model.SigunguDto;
import com.kitri.hotpicks.util.CafeConstance;

@Service
public class ContentsServiceImpl implements ContentsService {

	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);
	@Autowired
	private SqlSession sqlSession;

	//조원 api키
		String takapikey = "qldeV%2BL5Ff%2BFi%2BJisZxRFyc1KDitxcPmNkhuwOjk6c7xQDVITEe0oDrh3XFd98iqnW89ky8RMDhQkQIb48h3%2BQ%3D%3D";
		String shzyapikey = "V4CdZIa4lvepCWdXBIawOOghJwjrvjCI5fHDGnlILqJR4oVDLlEj8KRQYj19EM6l72okVEcfDPBbAtFdkokM4Q%3D%3D";
		String pshapikey = "YE3kxGJ%2FLwnnhz1ZCffuLBsyh1RuRshI6USdUAbCfggj5%2B8AwdEt7WV8MW%2FhbUDrRWOEGXHW53TeOiZggnqCNw%3D%3D";
		String lsdapikey = "W%2BjXnjTFTna8E3xfLQFWfoM5qwBKjUVr8lOiM5snThqHGHwxJas1l1hoZXADRDRD4smrfWhiBtFxfORMgAyYxg%3D%3D";
	
	@Override
	public void insertApiProcess(String urlStr) {
		System.out.println("service contents insert process");
		// 삽입할때 공연/행사를 한번에 불러와서 catcode를 가지고 뒷부분 짤라서 행사는 종류가 적으니
		// if(code ==행사코드)로 디비에 나눠저장. catType cateCode

		// 축제공연행사만 검색하는 url이 따로 있음 추후 기본list뽑는 url 대신 활용가능할수도..
		//String FestivalUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";

//		String ee = "&cat1=A02&" + "&cat2=A0207" + "&cat3=A02070100";

		
		// Insert Contents process
		List<ContentsTypeDto> typeList = new ArrayList<ContentsTypeDto>();
		typeList = sqlSession.getMapper(ContentsDao.class).selectContentsType();
		//System.out.println("typeListSize : " + typeList.size());

		List<Integer> contentsIdList = insertApiContents(urlStr, typeList);
		//System.out.println("contentsIdListSize : " + contentsIdList.size());
		logger.info("insert contents complete");
		insertApiContentsDetail(contentsIdList);
		logger.info("insert contentsdetail complete");

	}

	@Override
	public List<Integer> insertApiContents(String urlStr, List<ContentsTypeDto> typeList) {

		
		BufferedReader br = null;
		List<Integer> contentsIdList = new ArrayList<Integer>();;
		ContentsDto contentsDto = null;
		URL url;
		for (int a = 0; a < typeList.size(); a++) {
			String contentsUrlStr = urlStr + "&" + typeList.get(a).getCatType() + "=" + typeList.get(a).getCatCode();
			//System.out.println(contentsUrlStr);
			try {
				url = new URL(contentsUrlStr);
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				urlConnection.setRequestMethod("GET");
				br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
				String data = "";
				String line;
				while ((line = br.readLine()) != null) {
					data = data.concat(line);
				}

				// 받은 데이터확인
				// System.out.println("data : " + data);
				// 문자열데이터 객체화
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(data);
				// System.out.println("obj : " + obj);
				// top레벨의 response 키로 데이터 파싱
				JSONObject parse_response = (JSONObject) obj.get("response");
				JSONObject parse_body = (JSONObject) parse_response.get("body");
				if (Integer.valueOf(parse_body.get("totalCount").toString()) == 0) {
					continue;
				}
				// System.out.println("body : " + parse_body);
				JSONObject parse_items = (JSONObject) parse_body.get("items");
				JSONArray parse_itemlist = (JSONArray) parse_items.get("item");
				JSONObject item = null;

				
				for (int i = 0; i < parse_itemlist.size(); i++) {
					item = (JSONObject) parse_itemlist.get(i);
					contentsDto = new ContentsDto();
					int contentsId = Integer.valueOf(item.get("contentid").toString());
					contentsDto.setContentsId(contentsId);
					contentsIdList.add(contentsId);
					contentsDto.setTitle(item.get("title").toString());
					contentsDto.setCatId(typeList.get(a).getCatId());
					contentsDto.setCatCode(typeList.get(a).getCatCode().toString());
					contentsDto.setSdCode(Integer.valueOf(
							(item.get("areacode") == null || item.get("sigungucode") == null ? 0 : item.get("areacode"))
									.toString()));
					contentsDto.setSggCode(
							Integer.valueOf((item.get("areacode") == null || item.get("sigungucode") == null ? 0
									: item.get("sigungucode")).toString()));
					contentsDto.setImage1((item.get("firstimage1") == null || item.get("firstimage1").equals("") ? "-1"
							: item.get("firstimage1").toString().replace("\\", "")));
					contentsDto.setImage2(
							(item.get("firstimage2") == null || item.get("firstimage2").equals("") ? "noImage_list.png"
									: item.get("firstimage2").toString().replace("\\", "")));
					contentsDto.setHit(0);

					 sqlSession.getMapper(ContentsDao.class).insertApiContents(contentsDto);

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
		return contentsIdList;

	}

	@Override
	public void insertApiContentsDetail(List<Integer> contentsIdList) {
		List<Integer> existContents = sqlSession.getMapper(ContentsDao.class).existContentsList();
		//System.out.println(existContents.size());
		BufferedReader br;
		ContentsDetailDto cdtDto;
		URL url;
		String detailUrlStr;
		ContentsImageDto imageDto;

		// String contentsUrlStr = urlStr + "&cat2=" + typeList.get(0).getCatCode();

		List<String> detailUrlList = new ArrayList<String>();

		String detailCommonUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"
				+ "MobileOS=ETC&" + "MobileApp=AppTest&" + "_type=json&" + "defaultYN=Y&" + "addrinfoYN=Y&"
				+ "mapinfoYN=Y&" + "contentTypeId=15&" + "ServiceKey=" + takapikey + "&"; // conid

		String detailIntroUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?"
				+ "MobileOS=ETC&" + "MobileApp=AppTest&" + "_type=json&" + "contentTypeId=15&" + "ServiceKey="
				+ takapikey + "&"; // "conid,typeid"

		String detailInfoUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?"
				+ "MobileOS=ETC&" + "MobileApp=AppTest&" + "_type=json&" + "contentTypeId=15&" + "ServiceKey="
				+ takapikey + "&"; // "conid,typeid"

		String detailImageUrlStr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?"
				+ "MobileOS=ETC&" + "MobileApp=AppTest&" + "_type=json&" + "imageYN=Y&" + "subImageYN=Y&"
				+ "ServiceKey=" + takapikey + "&"; // "conid";

		detailUrlList.add(detailCommonUrlStr);
		detailUrlList.add(detailIntroUrlStr);
		detailUrlList.add(detailInfoUrlStr);
		detailUrlList.add(detailImageUrlStr);

		int lenCL = contentsIdList.size();
		int lenDL = detailUrlList.size();

		for (int i = 877; i < lenCL; i++) {
			System.out.println("index : " + i);
			cdtDto = new ContentsDetailDto();
			cdtDto.setContentsId(contentsIdList.get(i));
			br = null;

			for (int j = 0; j < lenDL; j++) {

				detailUrlStr = detailUrlList.get(j) + "contentId=" + contentsIdList.get(i);

				try {
					url = new URL(detailUrlStr);
					HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
					urlConnection.setRequestMethod("GET");
					br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

					String data = "";
					String line;
					while ((line = br.readLine()) != null) {
						data = data.concat(line);
					}

					// 받은 데이터확인
					// System.out.println("ddata : " + data);
					// 문자열데이터 객체화
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(data);
					// System.out.println("obj : " + obj);
					// top레벨의 response 키로 데이터 파싱
					JSONObject parse_response = (JSONObject) obj.get("response");
					//System.out.println(j +"/" + contentsIdList.get(i) + "/detailresponse : " + parse_response);
					JSONObject parse_body = (JSONObject) parse_response.get("body");
					//System.out.println(j +"/" + contentsIdList.get(i) + "/detailbody : " + parse_body);
					if (Integer.valueOf(parse_body.get("totalCount").toString()) == 0) {
						//System.out.println("break");
						break;
					}
					JSONObject parse_items = (JSONObject) parse_body.get("items");
					JSONObject item = null;
					switch (j) {

					case 0:
						item = (JSONObject) parse_items.get("item");
						// 0)detailCommonUrlStr
						cdtDto.setHomePage((item.get("homepage") == null || item.get("homepage").equals("") ? "-1"
								: item.get("homepage").toString().replace("\\", "")));
						cdtDto.setTel((item.get("tel") == null || item.get("tel").equals("") ? "-1"
								: item.get("tel").toString()));
						cdtDto.setTelName((item.get("telname") == null || item.get("telname").equals("") ? "-1"
								: item.get("telname").toString()));
						cdtDto.setAddr1((item.get("addr1") == null || item.get("addr1").equals("") ? "-1"
								: item.get("addr1").toString()));
						cdtDto.setAddr2((item.get("addr2") == null || item.get("addr2").equals("") ? "-1"
								: item.get("addr2").toString()));
						cdtDto.setZipCode((item.get("zipcode") == null || item.get("zipcode").equals("") ? "-1"
								: item.get("zipcode").toString()));
						cdtDto.setxPoint(
								Double.parseDouble((item.get("mapx") == null || item.get("mapx").equals("") ? "-1"
										: item.get("mapx").toString())));
						cdtDto.setyPoint(
								Double.parseDouble((item.get("mapy") == null || item.get("mapy").equals("") ? "-1"
										: item.get("mapy").toString())));
						break;

					case 1:
						item = (JSONObject) parse_items.get("item");
						// 1)detailIntroUrlStr
						cdtDto.setAgeLimit((item.get("agelimit") == null || item.get("agelimit").equals("") ? "-1"
								: item.get("agelimit").toString()));
						cdtDto.setBookingPlace(
								(item.get("bookingplace") == null || item.get("bookingplace").equals("") ? "-1"
										: item.get("bookingplace").toString()));
						cdtDto.setDiscountInfo(
								(item.get("discountinfofestival") == null || item.get("discountinfofestival").equals("")
										? "-1"
										: item.get("discountinfofestival").toString()));
						cdtDto.setEventStartDate(
								(item.get("eventstartdate") == null || item.get("eventstartdate").equals("") ? "-1"
										: item.get("eventstartdate").toString()));
						cdtDto.setEventEndDate(
								(item.get("eventenddate") == null || item.get("eventenddate").equals("") ? "-1"
										: item.get("eventenddate").toString()));
						cdtDto.setPlaceInfo((item.get("placeinfo") == null || item.get("placeinfo").equals("") ? "-1"
								: item.get("placeinfo").toString()));
						cdtDto.setPlaytime((item.get("playtime") == null || item.get("playtime").equals("") ? "-1"
								: item.get("playtime").toString().replace("\\", "")));
						cdtDto.setProgram((item.get("program") == null || item.get("program").equals("") ? "-1"
								: item.get("program").toString()));
						cdtDto.setSpendtime(
								(item.get("spendtimefestival") == null || item.get("spendtimefestival").equals("")
										? "-1"
										: item.get("spendtimefestival").toString()));
						// 이거 이용요금인데 이름 이래도 괜찮음?
						cdtDto.setUsetime(
								(item.get("usetimefetival") == null || item.get("usetimefetival").equals("") ? "-1"
										: item.get("usetimefetival").toString()));
						break;

					case 2:
						boolean flag;
						int condition1 = (Integer.valueOf(parse_body.get("totalCount").toString()));
						if (condition1 > 1) {
							JSONArray infoItemList = (JSONArray) parse_items.get("item");
							JSONObject sogaeItem = (JSONObject) infoItemList.get(0);
							JSONObject naeyongItem = (JSONObject) infoItemList.get(1);
							// 3)detailInfoUrlStr
							cdtDto.setInfoSogae(
									(sogaeItem.get("infotext") == null || sogaeItem.get("infotext").equals("") ? "-1"
											: sogaeItem.get("infotext").toString().replace("\\", "")));
							cdtDto.setInfoNaeyong(
									(naeyongItem.get("infotext") == null || naeyongItem.get("infotext").equals("")
											? "-1"
											: naeyongItem.get("infotext").toString().replace("\\", "")));

							//System.out.println("con>1 id : "+cdtDto.getContentsId()+" /c :"+cdtDto.toString());
							
							flag = true;
							for(int k = 0 ; k<existContents.size() ; k++) {
								if(existContents.get(k) == cdtDto.getContentsId()) {
									// update
									//System.out.println("update detail");
									sqlSession.getMapper(ContentsDao.class).updateApiContentsDetail(cdtDto);
									flag = false;
									break;
								}else {
									
								}
							}
							//System.out.println(flag);
							if(flag == true) {
								// insert
								//System.out.println("insert detail");
								sqlSession.getMapper(ContentsDao.class).insertApiContentsDetail(cdtDto);
							}
						} else {
							JSONObject infoItem = (JSONObject) parse_items.get("item");

							// 3)detailInfoUrlStr
							cdtDto.setInfoSogae(
									(infoItem.get("infotext") == null || infoItem.get("infotext").equals("") ? "-1"
											: infoItem.get("infotext").toString().replace("\\", "")));
							cdtDto.setInfoNaeyong("-1");

							//System.out.println("con < 1 id : " + cdtDto.getContentsId() + " /c :" + cdtDto.toString());
							flag = true;
							for(int k = 0 ; k<existContents.size() ; k++) {
								if(existContents.get(k) == cdtDto.getContentsId()) {
									// update
									//System.out.println("update detail");
									sqlSession.getMapper(ContentsDao.class).updateApiContentsDetail(cdtDto);
									flag = false;
									break;
								}else {
								}
							}
							//System.out.println(flag);
							if(flag == true) {
								// insert
								//System.out.println("insert detail");
								sqlSession.getMapper(ContentsDao.class).insertApiContentsDetail(cdtDto);
							}
						}
						break;

					case 3:
						// contentsid set해줘야함

						int condition2 = (Integer.valueOf(parse_body.get("totalCount").toString()));
						if (Integer.valueOf(parse_body.get("totalCount").toString()) == 0) {
							System.out.println("이미지가 0인게 말이돼?");
							return;
						}
						if (condition2 > 1) {

							JSONArray imageItemList = (JSONArray) parse_items.get("item");
							for (int k = 0; k < imageItemList.size(); k++) {
								JSONObject imageItem = (JSONObject) imageItemList.get(k);
								imageDto = new ContentsImageDto();
								// 3)detailImageUrlStr
								imageDto.setContentsId(contentsIdList.get(i));
								imageDto.setImgName(
										(imageItem.get("imgname") == null || imageItem.get("imgname").equals("") ? "-1"
												: imageItem.get("imgname").toString()));
								imageDto.setOriginImgurl((imageItem.get("originimgurl") == null
										|| imageItem.get("originimgurl").equals("") ? "-1"
												: imageItem.get("originimgurl").toString().replace("\\", "")));
								imageDto.setSerialNum(
										(imageItem.get("serialnum") == null || imageItem.get("serialnum").equals("")
												? "-1"
												: imageItem.get("serialnum").toString()));
								imageDto.setSmallImageUrl((imageItem.get("smallimageurl") == null
										|| imageItem.get("smallimageurl").equals("") ? "-1"
												: imageItem.get("smallimageurl").toString().replace("\\", "")));

								// insert
								sqlSession.getMapper(ContentsDao.class).insertApiContentsimage(imageDto);
								
							}
						} else {
							JSONObject imageItem = (JSONObject) parse_items.get("item");
							// imageList = new ArrayList<ContentsImageDto>();
							imageDto = new ContentsImageDto();
							// 3)detailImageUrlStr
							imageDto.setContentsId(contentsIdList.get(i));
							imageDto.setImgName(
									(imageItem.get("imgname") == null || imageItem.get("imgname").equals("") ? "-1"
											: imageItem.get("imgname").toString()));
							imageDto.setOriginImgurl(
									(imageItem.get("originimgurl") == null || imageItem.get("originimgurl").equals("")
											? "-1"
											: imageItem.get("originimgurl").toString().replace("\\", "")));
							imageDto.setSerialNum(
									(imageItem.get("serialnum") == null || imageItem.get("serialnum").equals("") ? "-1"
											: imageItem.get("serialnum").toString()));
							imageDto.setSmallImageUrl(
									(imageItem.get("smallimageurl") == null || imageItem.get("smallimageurl").equals("")
											? "-1"
											: imageItem.get("smallimageurl").toString().replace("\\", "")));

							// insert
							sqlSession.getMapper(ContentsDao.class).insertApiContentsimage(imageDto);
							
							//System.out.println("img : " + imageDto.toString());
						}

						break;

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
			//System.out.println(i + "/cdt : " + cdtDto.toString());
		}
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
				map.put("addr1", (item.get("addr1") != null || item.get("addr1").equals("") ? "-1"
						: item.get("addr1").toString()));
				map.put("firstimage1", (item.get("firstimage1") != null || item.get("firstimage1").equals("") ? "-1"
						: item.get("firstimage1").toString().replace("\\", "")));
				map.put("firstimage2", (item.get("firstimage2") != null || item.get("firstimage2").equals("") ? "-1"
						: item.get("firstimage2").toString().replace("\\", "")));
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
		System.out.println("service Location insert process");
		/*
		 * 로케이션 추가 프로세스 setsido() : 시도 process(primary key 때문에 선 시도 후 시군구 해야함) 
		 * 0. basicdata insert or sido sigungu data insert 때 전체지역명시용 data 함께 insert
		 * 1. api 시도자료 get 및 list에 담기 
		 * 2. 코드는 리스트에 추가 및 DB에 list.size() 만큼 insert(1,2번을 한 process로 for문 사용)
		 *  (1,2)에서 만든 리스트의 contentid 들을 인자값으로
		 *  3. api 군구자료 get하고 detailDto에 담기 
		 * 4. DB에 list.size() 만큼 insert(3,4번을 한 process로 for문)
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
			sdList.add(0);
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
		
		sqlSession.getMapper(ContentsDao.class).insertSigunguEx(sdList);
		
		int len = sdList.size();
		for (int i = 0; i < len-1; i++) {
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
	public List<SigunguDto> selectSigungu(int sdCode) {

		return sqlSession.getMapper(ContentsDao.class).selectSigungu(sdCode);
	}

	@Override
	public List<ContentsDto> selectContentsList(char keyword, Map<String,Object> parameter) {
		if(parameter != null) {
			switch(keyword) {
			case 's':
				String word = parameter.get("search").toString();
				String[] splitedWord = word.trim().split(" ");
				int len = splitedWord.length;
				List<String> wordList = new ArrayList<String>();
				for(int i=0;i<len;i++) {
					wordList.add(splitedWord[i]);
				}
				//System.out.println("before clear"+parameter);
				parameter.clear();
				//System.out.println("after clear"+parameter);
				
				parameter.put("wordList", wordList);
					
				//System.out.println("splitparameter"+parameter.get("wordList"));
				return sqlSession.getMapper(ContentsDao.class).contentslist(parameter);
			
			
			
			case 'l':
				System.out.println("location검색");
				System.out.println(parameter.get("cPage"));
//				cpage
				
				int	bePage = Integer.valueOf(parameter.get("cPage").toString());
//				21 ~ 40
				int endSeq = bePage*CafeConstance.ARTICLE_SIZE;
				int startSeq = endSeq-CafeConstance.ARTICLE_SIZE;
				System.out.println(startSeq + "///" + endSeq);
				parameter.put("startSeq", startSeq);
				parameter.put("endSeq", endSeq);
				System.out.println("parameter : " + parameter);
				return sqlSession.getMapper(ContentsDao.class).contentslist(parameter);
			
				
				//'m' :main첫화면(parameter가 null)
			default : 
				System.out.println("paramnotnullnomal검색");
				
				parameter.put("startSeq", 0);
				parameter.put("endSeq", CafeConstance.ARTICLE_SIZE);
				return sqlSession.getMapper(ContentsDao.class).contentslist(parameter);
			}
		}else {
			//parameter가 null일 예외상황
			System.out.println("paramnullnomal검색");
			Map<String,Object> param = new HashMap<String, Object>();
			param.put("startSeq", 0);
			param.put("endSeq", CafeConstance.ARTICLE_SIZE);
			return sqlSession.getMapper(ContentsDao.class).contentslist(param);			
		}
	}

	@Override
	public void insertContentsCate() {
		sqlSession.getMapper(ContentsDao.class).insertContentsCate();
	}


	@Override
	public Map<String,Object> selectRContentsList(Map<String, Object> parameter) {
		String tag = sqlSession.getMapper(ContentsDao.class).selectMyHashTag(parameter);
		System.out.println("1) : " + tag);
		if(tag == null) {
			tag =  sqlSession.getMapper(ContentsDao.class).rContentslistTrend(parameter);
			System.out.println("2) : " + tag);
		}		
		System.out.println("3) : " + tag);
		List<ContentsDto> contentsList =  
				sqlSession.getMapper(ContentsDao.class).rContentslistByTag(tag);
		Map<String, Object> rContents = new HashMap<String, Object>();
		rContents.put("rTag", tag);
		rContents.put("rContentsList", contentsList);
		return rContents;
		
	}

}
