package kh.mclass.Igre.child.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/child")
public class ChildController {

	
	@GetMapping("/childInfo.do")
	public ModelAndView childInfo(@RequestParam(value = "value",defaultValue = "030102010000") String url) {
		ModelAndView mav = new ModelAndView();
		
		//1. jsoup url connect
				String crawlingURL = "http://www.childcare.go.kr/cpin/contents/"+url+".jsp";
				Document doc;
				try {
					doc = Jsoup.connect(crawlingURL).get();
					// 2. business logic connect in elements
					// 크롤링 할 영역
					Elements elements = doc.select("div.m_03");
					
					// 이미지 영역 제거
					elements.select("p.mar_t20").remove();
					
					//modelAndView에 저장
					mav.addObject("element",elements);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				mav.addObject("url",url);
				mav.setViewName("child/childInfo");
		
		return mav;
	}
	
	
	
	@GetMapping("/childCare")
	@ResponseBody
	public ModelAndView childCare(@RequestParam(value = "h_area1", defaultValue = "0") String sido, @RequestParam(value = "h_area2", defaultValue = "0") String gungu ) throws IOException
	{

		ModelAndView mav = new ModelAndView();
		
		System.out.println(sido);
		System.out.println(gungu);
		
		//스쿨존 API 실행
	    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552061/schoolzoneChild/getRestSchoolzoneChild"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=igOhdppcftectqSSgqumS465oHsYbu8ZNzLN2akiCCDXyk4mSe9K5VemoB1DdKpWR2ChBCwr%2FKeBJZZn7K%2FzFw%3D%3D"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("igOhdppcftectqSSgqumS465oHsYbu8ZNzLN2akiCCDXyk4mSe9K5VemoB1DdKpWR2ChBCwr%2FKeBJZZn7K%2FzFw%3D%3D ", "UTF-8")); /*공공데이터포털에서 발급받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("searchYearCd","UTF-8") + "=" + URLEncoder.encode("2018", "UTF-8")); /*조회하고자 하는 연도값 입력(값 없을 시 공백리턴)*/
        urlBuilder.append("&" + URLEncoder.encode("siDo","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*코드종류 코드값전체 공백시 전체 선택서울특별시 11부산광역시 26대구광역시 27인천광역시 28광주광역시 29대전광역시 30울산광역시 31세종특별자치시 36경기도 41강원도 42충청북도 43충청남도 44전라북도 45전라남도 46경상북도 47경상남도 48제주특별자치도 50*/
        urlBuilder.append("&" + URLEncoder.encode("guGun","UTF-8") + "=" + URLEncoder.encode(gungu, "UTF-8")); /*시도 코드종류 코드값서울특별시 강남구 680 강동구 740 강북구 305 강서구 500 관악구 620 광진구 215 구로구 530 금천구 545 노원구 350 도봉구 320 동대문구 230 동작구 590 마포구 440 서대문구 410 서초구 650 성동구 200 성북구 290 송파구 710 양천구 470 영등포구 560 용산구 170 은평구 380 종로구 110 중구 140 중랑구 260부산광역시 강서구 4*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml/json)*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*검색건수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        
        System.out.println(urlBuilder.toString());
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        mav.addObject("result", sb);
		return mav;
	}

}

