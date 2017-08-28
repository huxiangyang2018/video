package com.zhiyou100.video.service.impl;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.video.dao.mapper.AdminMapper;
import com.zhiyou100.video.dao.model.Admin;
import com.zhiyou100.video.dao.model.AdminExample;
import com.zhiyou100.video.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper am;
	@Override
	public Admin adminLogin(Admin a) {
		String pwd = DigestUtils.md5Hex(a.getLoginPwd());
		AdminExample ae = new AdminExample();
		ae.createCriteria().andLoginNameEqualTo(a.getLoginName()).andLoginPwdEqualTo(pwd);
		List<Admin> list = am.selectByExample(ae);
		Admin admin = null;
		for(Admin li : list){
			if(li != null){
				admin = li;
			}
		}
		return admin;
	}

	

	

}
