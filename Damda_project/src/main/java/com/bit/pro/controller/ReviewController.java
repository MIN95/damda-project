package com.bit.pro.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.pro.service.ItemService;
import com.bit.pro.service.ReviewService;
import com.bit.pro.vo.AllItemVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	String dir = "bestReview";
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Resource
	private ReviewService reviewService ;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String bestReview(Model model, HttpServletRequest request) throws SQLException {		

		reviewService.bestReviewImg(model);
		
		return dir+"/bestReview";
	}
	
	@RequestMapping(value = "/custom", method = RequestMethod.GET)
	public String reviewCustom(Model model, HttpServletRequest request) throws SQLException {		
		
		reviewService.customReview(model, "reviewnum", 0);
		
		return dir+"/customReview";
	}

	@RequestMapping(value = "/customlist", method = RequestMethod.GET)
	public String reviewCustomList(Model model, HttpServletRequest request, @RequestParam(value="select", defaultValue = "reviewnum") String select, @RequestParam(value="p", defaultValue = "0") int p) throws SQLException {		
		
		reviewService.customReview(model, select, p);
		
		return dir+"/customReviewList";
	}
}
