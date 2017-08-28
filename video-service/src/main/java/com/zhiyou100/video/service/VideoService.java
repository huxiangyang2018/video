package com.zhiyou100.video.service;


import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Video;

public interface VideoService {

	@SuppressWarnings("rawtypes")
	Page findVideos(Video v);

	void deleteVideo(Integer id);

	void addVideo(Video v);

	Video findVideoById(Integer id);

	void updateVideo(Video v);


}
