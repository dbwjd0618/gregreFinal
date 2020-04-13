package kh.mclass.Igre.api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/api")
public class ApiController {

	@GetMapping("/weather.api")
	@ResponseBody
	public void weather(HttpServletResponse response) {
		LocalDate date = LocalDate.now();
		String yyyyMMdd = ""+date.getYear()+(date.getMonthValue()<10?"0":"")+date.getMonthValue()+(date.getDayOfMonth()<10?"0":"")+date.getDayOfMonth();
		log.debug("날짜 : " + yyyyMMdd);
		
		LocalTime time = LocalTime.now();
		String hhmm = "";
		if(time.getHour()<2) {
			hhmm = "2300";
		} else if (time.getHour()<5) {
			hhmm = "0200";
		} else if(time.getHour()<8) {
			hhmm = "0500";
		} else if(time.getHour()<11) {
			hhmm = "0800";
		} else if(time.getHour()<14) {
			hhmm = "1100";
		} else if(time.getHour()<17) {
			hhmm = "1400";
		} else if(time.getHour()<20) {
			hhmm = "1700";
		} else if(time.getHour()<23) {
			hhmm = "2000";
		} else {
			hhmm = "2300";
		}
 		
		//날씨
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=AB7ypAy1v6VldsoBOUnn2rR5MR0vMg49%2FZ58a4wOKmq1DsRPrhsp%2BSOPYG28WYggqc4%2FZOjOsZTusNDJ8CJR2Q%3D%3D&numOfRows=100&pageNo=1&base_date="+yyyyMMdd+"&base_time="+hhmm+"&nx=61&ny=125";
		HttpURLConnection urlconnection = null;
		BufferedReader br = null;
		String result = "";
		try{
            URL urll = new URL(url);
            urlconnection = (HttpURLConnection)urll.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String line = "";
            while((line = br.readLine()) != null) {
                result += line + "\n";
                System.out.println(line);
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
        	try {
        		urlconnection.disconnect();
				br.close();
				
				System.out.println(result);
				response.setContentType("text/xml; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
	}
	
	@GetMapping("/dust.api")
	@ResponseBody
	public void dust(HttpServletResponse response) {
		String url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?sidoName=서울&pageNo=28&numOfRows=1&ServiceKey=AB7ypAy1v6VldsoBOUnn2rR5MR0vMg49%2FZ58a4wOKmq1DsRPrhsp%2BSOPYG28WYggqc4%2FZOjOsZTusNDJ8CJR2Q%3D%3D&ver=1.3";
		HttpURLConnection urlconnection = null;
		BufferedReader br = null;
		String result = "";
		try{
            URL urll = new URL(url);
            urlconnection = (HttpURLConnection)urll.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String line = "";
            while((line = br.readLine()) != null) {
                result += line + "\n";
                System.out.println(line);
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
        	try {
        		urlconnection.disconnect();
				br.close();
				
				System.out.println(result);
				response.setContentType("text/xml; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
	}
}
