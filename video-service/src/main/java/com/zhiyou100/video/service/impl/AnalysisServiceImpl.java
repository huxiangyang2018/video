package com.zhiyou100.video.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.dao.mapper.AnalysisMapper;
import com.zhiyou100.video.dao.model.Analysis;
import com.zhiyou100.video.service.AnalysisService;
@Service
public class AnalysisServiceImpl implements AnalysisService {

	@Autowired
	AnalysisMapper am;
	@Override
	public List<Analysis> analysis() {
		
		return am.ana();
	}

}
