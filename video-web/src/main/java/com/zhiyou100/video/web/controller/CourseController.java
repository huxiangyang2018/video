package com.zhiyou100.video.web.controller;


import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhiyou100.video.dao.mapper.SubjectMapper;
import com.zhiyou100.video.dao.model.Course;
import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Subject;
import com.zhiyou100.video.service.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	CourseService cs;
	@Autowired
	SubjectMapper sm;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping("/courseList.action")
	public String courseList(@RequestParam(defaultValue="1") Integer page,Model md,Course c){
		c.setCp(page);
		Page p = cs.loadPage(c);
		md.addAttribute("page", p);
		return "course/courseList";
	}
	
	@RequestMapping(value="/editCourse.action",method=RequestMethod.GET)
	public String editCourse(Integer id,Model md){
		List<Subject> slist = sm.selectByExample(null);
		Course course = cs.findCourseById(id);
		md.addAttribute("sList", slist);
		md.addAttribute("course", course);
		return "course/editCourse";
	}
	
	@RequestMapping(value="/editCourse.action",method=RequestMethod.POST)
	public String editCourse(Course c){
		c.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		cs.updateCourse(c);
		return "forward:/course/courseList.action";
	}
	
	
	@RequestMapping(value="/addCourse.action",method=RequestMethod.GET)
	public String addCourse(Model md){
		List<Subject> slist = sm.selectByExample(null);
		md.addAttribute("sList", slist);
		return "course/addCourse";
	}
	//添加课程
	@RequestMapping(value="/addCourse.action",method=RequestMethod.POST)
	public String addCourse(Course c){
		c.setInsertTime(new Timestamp(System.currentTimeMillis()));
		c.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		cs.addCourse(c);
		return "forward:/course/courseList.action";
	}
	
	@RequestMapping(value="/deleteCourse.action",method=RequestMethod.GET)
	public String deleteCourse(Integer id){
		cs.deleteCourseById(id);
		return "forward:/course/courseList.action";
	}

}
