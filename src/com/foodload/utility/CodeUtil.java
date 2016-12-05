package com.foodload.utility;

import java.util.ArrayList;
import java.util.List;

import com.foodload.domain.Code;

public class CodeUtil {
	public static List<Code> getCodes() {
		List<Code> codes = new ArrayList<Code>();
		
		codes.add(new Code("1", "한식"));
		codes.add(new Code("2", "중식"));
		codes.add(new Code("3", "일식"));
		codes.add(new Code("4", "치킨"));
		codes.add(new Code("5", "피자"));
		codes.add(new Code("6", "햄버거"));
		codes.add(new Code("7", "분식"));
		codes.add(new Code("8", "기타"));
        
		return codes;
	}
}
