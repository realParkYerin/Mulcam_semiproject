package a.util;
import java.util.UUID;

public class BbsUtil {
	public static String getNewFileName(String filename) {
	    String newfilename = "";
	    String fpost = "";

	    // 확장자명이 있음
	    if(filename.indexOf('.') >= 0) {
	        fpost = filename.substring(filename.indexOf('.'));    // .txt, .png ...
	    } else { // 확장자명이 없음
	        // 확장자명을 임의로 붙여줌 여기서는 .pic이라고 붙임
	        fpost = ".pic";     
	    }

	    newfilename = UUID.randomUUID().toString() + fpost;

	    return newfilename;
	}
}
