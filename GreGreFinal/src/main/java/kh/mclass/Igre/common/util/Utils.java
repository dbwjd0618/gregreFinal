package kh.mclass.Igre.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {

	public static String getRenamedFileName(String originalFileName) {
		
		//파일명 생성코드
		String ext = "";
		int dotIndex = originalFileName.lastIndexOf(".");
		if(dotIndex > -1) {
			ext = originalFileName.substring(dotIndex);
		}
		String renamedFileName = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(new Date())
						+ "_" + (int)(Math.random()*1000) + ext;
		
		return renamedFileName;
	}

}
