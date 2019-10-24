package com.bit.pro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.pro.service.MateService;
import com.bit.pro.vo.MateVo;

@Controller
@RequestMapping("/custom")
public class CustomController {
	
	String dir = "custom";
	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);
	
	@Resource
	private MateService mateService; 
	
	//custom select list
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String eventList(Model model) throws Exception {
		List<MateVo> customSelect = mateService.customSelectThnumb();
		System.out.println("customSelect:"+customSelect);
		
		model.addAttribute("customSelect", customSelect);
		
		return dir+"/custom";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public String eventListPost(@RequestParam(value="matenum") int matenum,Model model) throws Exception {
		MateVo customDetail = mateService.customSelectDetail(matenum);
		System.out.println("customDetail:"+customDetail);
		String customPath = customDetail.getPhotoPath();
		System.out.println("customPath:"+customPath);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("customDetail", customDetail);
		
		return customPath;
	}
	
	@RequestMapping(value = "/2", method = RequestMethod.GET)
	public String eventList2() {
		
		return dir+"/Custom2";
	}
	
}
