package com.zhiyou100.video.service;

import java.util.List;

import com.zhiyou100.video.dao.model.Course;
import com.zhiyou100.video.dao.model.Page;

public interface CourseService {

	List<Course> findCourses();

	@SuppressWarnings("rawtypes")
	Page loadPage(Course c);

	void deleteCourseById(Integer id);

	Course findCourseById(Integer id);

	void updateCourse(Course c);

	void addCourse(Course c);


}
