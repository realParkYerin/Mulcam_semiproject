package a.util;

import java.util.Date;

public class PdsUtil {
	
	// 원본 파일명	->	업로드 파일명
	// myfile.txt	->	789123456.txt
	public static String getNewFileName(String filename) {
		String newfilename = "";
		String fpost = "";
		
		// 확장자명이 있음
		if(filename.indexOf('.') >= 0) {
			fpost = filename.substring(filename.indexOf('.'));	// .txt, .png ...
			newfilename = new Date().getTime() + fpost;			// 789123456.txt
		} else { // 확장자명이 없음
			// 확장자명을 임의로 붙여줌 여기서는 .pic이라고 붙임
			newfilename = new Date().getTime() + ".pic";		
		}
		return newfilename;
		
	}

}
