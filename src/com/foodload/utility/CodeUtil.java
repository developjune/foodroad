package com.foodload.utility;

import java.util.ArrayList;
import java.util.List;

import com.foodload.domain.Code;

public class CodeUtil {
	public static List<Code> getCodes() {
		List<Code> codes = new ArrayList<Code>();
		
		codes.add(new Code("1", "�ѽ�"));
		codes.add(new Code("2", "�߽�"));
		codes.add(new Code("3", "�Ͻ�"));
		codes.add(new Code("4", "ġŲ"));
		codes.add(new Code("5", "����"));
		codes.add(new Code("6", "�ܹ���"));
		codes.add(new Code("7", "�н�"));
		codes.add(new Code("8", "��Ÿ"));
        
		return codes;
	}
}
