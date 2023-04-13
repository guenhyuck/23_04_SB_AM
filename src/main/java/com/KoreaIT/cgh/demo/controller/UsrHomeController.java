package com.KoreaIT.cgh.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrHomeController {
	private int count;

	public UsrHomeController() {
		count = 0;
	}

	@RequestMapping("/usr/home/getCount")
	@ResponseBody
	public int getCount() {

		return count++;
	}
	@RequestMapping("/usr/home/setCount")
	@ResponseBody
	public String setCount(int count) {
		this.count = count;
		return "count의 값이"+ this.count +"초기화 됨";
	}
}