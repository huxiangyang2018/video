package com.zhiyou100.video.service;

import java.util.List;

import com.zhiyou100.video.dao.model.Page;
import com.zhiyou100.video.dao.model.Speaker;

public interface SpeakerService {

	List<Speaker> findSpeakers();

	@SuppressWarnings("rawtypes")
	Page findSpeakers(Speaker s);

	void addSpeaker(Speaker s);

	void deleteSpeakerById(Integer id);

	Speaker findSpeakerById(Integer id);

	void updateSpeaker(Speaker s);

}
