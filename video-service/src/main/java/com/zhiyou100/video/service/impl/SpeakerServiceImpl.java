package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.dao.mapper.SpeakerMapper;
import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Speaker;
import com.zhiyou100.video.service.SpeakerService;
@Service
public class SpeakerServiceImpl implements SpeakerService {

	@Autowired
	SpeakerMapper sm;
	@Override
	public List<Speaker> findSpeakers() {
		// TODO Auto-generated method stub
		return sm.selectByExample(null);
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Page findSpeakers(Speaker s) {
		Page page = new Page();
		
		page.setTotal(sm.count(s));
		
		page.setPage(s.getCp());
		
		s.setCp((s.getCp()-1)*5);
		
		page.setRows(sm.speakers(s));
		
		page.setSize(5);
		
		return page;
	}
	@Override
	public void addSpeaker(Speaker s) {
		sm.insert(s);
	}
	@Override
	public void deleteSpeakerById(Integer id) {
		// TODO Auto-generated method stub
		sm.deleteByPrimaryKey(id);
	}
	@Override
	public Speaker findSpeakerById(Integer id) {
		
		return sm.selectByPrimaryKey(id);
	}
	@Override
	public void updateSpeaker(Speaker s) {
		// TODO Auto-generated method stub
		sm.updateByPrimaryKeySelective(s);
	}

}
