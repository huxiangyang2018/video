package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.dao.mapper.CourseMapper;
import com.zhiyou100.video.dao.model.Course;
import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.service.CourseService;
@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	CourseMapper cm;

	@Override
	public List<Course> findCourses() {
		return cm.selectByExample(null);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Page loadPage(Course c) {
		Page page = new Page();
		
		page.setPage(c.getCp());
		
		c.setCp((c.getCp()-1)*5);
		page.setRows(cm.selectCourses(c));
		
		page.setTotal(cm.countByExample(null));
		
		page.setSize(5);
		
		return page;
	}

	@Override
	public void deleteCourseById(Integer id) {
		cm.deleteByPrimaryKey(id);
	}

	@Override
	public Course findCourseById(Integer id) {
		return cm.selectById(id);
	}

	@Override
	public void updateCourse(Course c) {
		cm.updateByPrimaryKeySelective(c);
	}

	@Override
	public void addCourse(Course c) {
		cm.insert(c);
	}
}
