package com.zhiyou100.video.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhiyou100.video.dao.model.Analysis;
import com.zhiyou100.video.service.AnalysisService;


@Controller
@RequestMapping("/analysis")
public class AnalysisController {
	
	@Autowired
	AnalysisService as;
	
	@RequestMapping(value="/analysis.action",method=RequestMethod.GET)
	public String jumpEcharts(){
		return "/analysis/analysis";
	}
	
	@RequestMapping(value="/analysis.action",method=RequestMethod.POST)
	@ResponseBody
	public String echarts() throws JsonProcessingException{
		
		List<Analysis> list = as.analysis();
		
		ObjectMapper mapper = new ObjectMapper();    
		String json = mapper.writeValueAsString(list); 
		
        return json;
	}
}
