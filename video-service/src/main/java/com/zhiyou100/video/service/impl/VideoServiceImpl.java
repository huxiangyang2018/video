package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.dao.mapper.VideoMapper;
import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Video;
import com.zhiyou100.video.service.VideoService;
@Service
public class VideoServiceImpl implements VideoService{

	@Autowired
	VideoMapper vm;
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Page findVideos(Video v) {
		Page page = new Page();
		page.setPage(v.getCp());
		
		page.setTotal(vm.countVideos(v));
		
		v.setCp((v.getCp()-1)*5);
		List<Video> list = vm.videoList(v);
		page.setRows(list);
		
		page.setSize(5);
		
		return page;
	}
	
	@Override
	public void deleteVideo(Integer id) {
		vm.deleteByPrimaryKey(id);
	}

	@Override
	public void addVideo(Video v) {
		vm.insert(v);
	}

	@Override
	public Video findVideoById(Integer id) {
		
		return vm.selectByPrimaryKey(id);
	}

	@Override
	public void updateVideo(Video v) {
		vm.updateByPrimaryKeySelective(v);
	}

}
