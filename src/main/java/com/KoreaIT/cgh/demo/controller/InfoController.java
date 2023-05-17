package com.KoreaIT.cgh.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KoreaIT.cgh.demo.vo.Rq;

@Controller
public class InfoController {
	
	private Rq rq;
	
	public InfoController(Rq rq) {
		this.rq = rq;
	}
	

	@RequestMapping("/usr/info/info")
	public String showInfo() {
		rq.run();
		return "usr/info/info";
	}
	@RequestMapping("/usr/info/info2")
	public String showInfo2() {
		rq.run();
		return "usr/info/info2";
	}
	@RequestMapping("/usr/info/info3")
	public String showInfo3() {
		rq.run();
		return "usr/info/info3";
	}
	@RequestMapping("/usr/info/info4")
	public String showInfo4() {
		rq.run();
		return "usr/info/info4";
	}


}