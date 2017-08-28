package com.zhiyou100.video.web.controller;

import java.sql.Timestamp;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhiyou100.video.dao.model.Course;
import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Speaker;
import com.zhiyou100.video.dao.model.Video;
import com.zhiyou100.video.service.CourseService;
import com.zhiyou100.video.service.SpeakerService;
import com.zhiyou100.video.service.VideoService;
@Controller
@RequestMapping("/video")
public class VideoController {

	@Autowired
	VideoService vs;
	@Autowired
	SpeakerService ss;
	@Autowired
	CourseService cs;
	
	@RequestMapping("/video-list.action")
	public String videoList(@RequestParam(defaultValue="1") Integer page, Video v,Model md){
		
		v.setCp(page);
		@SuppressWarnings("rawtypes")
		Page p = vs.findVideos(v);
		
		List<Speaker> sList = ss.findSpeakers();
		List<Course> cList = cs.findCourses();
		md.addAttribute("sList", sList);
		md.addAttribute("cList", cList);
		
		md.addAttribute("sn", v.getSpeakerName());
		md.addAttribute("cn", v.getCourseName());
		md.addAttribute("vt", v.getVideoTitle());
		
		md.addAttribute("page", p);
		return "video/videoList";
	}
	
	
	@RequestMapping(value="/editVideo.action",method=RequestMethod.GET)
	public String edit(Model md,Integer id){
		List<Speaker> sList = ss.findSpeakers();
		List<Course> cList = cs.findCourses();
		md.addAttribute("sList", sList);
		md.addAttribute("cList", cList);
		
		Video v = vs.findVideoById(id);
		md.addAttribute("v", v);
		return "video/editVideo";
	}
	
	
	@RequestMapping(value="/editVideo.action",method=RequestMethod.POST)
	public String edit(Video v){
		
		v.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		vs.updateVideo(v);
		return "redirect:/video/video-list.action";
	}
	
	
	@RequestMapping("/deleteVideo.action")
	public String delete(Video v,Integer id,Model md){
		md.addAttribute("v", v);
		vs.deleteVideo(id);
		return "forward:/video/video-list.action";
	}
	
	
	@RequestMapping("/deleteVideos.action")
	public String deleteVideos(@RequestParam(defaultValue="0")Integer checkbox[]){
		System.out.println("批量删除");
		for(int i:checkbox){
			vs.deleteVideo(i);
		}
		return "forward:/video/video-list.action";
	}
	
	
	@RequestMapping(value="/addVideo.action",method=RequestMethod.GET)
	public String addVideo(Model md){
		List<Speaker> sList = ss.findSpeakers();
		List<Course> cList = cs.findCourses();
		md.addAttribute("sList", sList);
		md.addAttribute("cList", cList);
		return "video/addVideo";
	}
	
	@RequestMapping(value="/addVideo.action",method=RequestMethod.POST)
	public String addVideo(Video v){
		v.setInsertTime(new Timestamp(System.currentTimeMillis()));
		v.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		vs.addVideo(v);
		return "redirect:/video/video-list.action";
	}
	
}
