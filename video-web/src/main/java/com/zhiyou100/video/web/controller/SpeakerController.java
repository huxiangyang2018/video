package com.zhiyou100.video.web.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhiyou100.video.dao.mapper.SpeakerMapper;
import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Speaker;
import com.zhiyou100.video.service.SpeakerService;

@Controller
@RequestMapping("/speaker")
public class SpeakerController {
	@Autowired
	SpeakerService ss;
	@Autowired
	SpeakerMapper sm;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/speakerList.action")
	public String SpeakerList(@RequestParam(defaultValue="1") Integer page,Model md,Speaker s){
		s.setCp(page);
		Page p = ss.findSpeakers(s);
		md.addAttribute("speakerName", s.getSpeakerName());
		md.addAttribute("speakerJob", s.getSpeakerJob());
		md.addAttribute("page", p);
		return "speaker/speakerList";
	}
	
	@RequestMapping(value="/addSpeaker.action",method=RequestMethod.GET)
	public String SpeakerList(){
		
		return "speaker/addSpeaker";
	}
	
	@RequestMapping(value="/addSpeaker.action",method=RequestMethod.POST)
	public String SpeakerList(Speaker s){
		s.setInsertTime(new Timestamp(System.currentTimeMillis()));
		s.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		ss.addSpeaker(s);
		return "redirect:/speaker/speakerList.action";
	}
	
	@RequestMapping("/deleteSpeaker.action")
	public String deleteSpeaker(Integer id){
		ss.deleteSpeakerById(id);
		return "forward:/speaker/speakerList.action";
	}
	
	
	@RequestMapping(value="/editSpeaker.action",method=RequestMethod.GET)
	public String editSpeaker(Integer id,Model md){
		Speaker speaker = ss.findSpeakerById(id);
		md.addAttribute("s", speaker);
		return "speaker/editSpeaker";
	}
	
	
	@RequestMapping(value="/editSpeaker.action",method=RequestMethod.POST)
	public String editSpeaker(Speaker s){
		s.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		System.out.println(s);
		ss.updateSpeaker(s);
		return "redirect:/speaker/speakerList.action";
	}
	
}
