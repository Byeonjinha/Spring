package test;

import java.util.*;
import java.util.stream.IntStream;
import java.util.stream.Stream; 
import java.util.Arrays;
import java.util.List;
import java.util.Map.Entry;
import java.util.ArrayList;
import java.util.stream.Collectors;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Queue;

class Main {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);	
		while (1==1) {
		String str = sc.next();
		if (str.equals("0")) {
			break;
		}
		StringBuffer sb = new StringBuffer(str);
		String reversedStr = sb.reverse().toString(); 
	
		if (str.equals(reversedStr)) {
			System.out.println("yes");
		}
		else {
			System.out.println("no");
		}
	}
	}
}