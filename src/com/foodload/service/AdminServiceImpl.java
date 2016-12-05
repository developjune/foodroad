package com.foodload.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.foodload.domain.Admin;
import com.foodload.persistence.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminMapper adminMapper;

	@Override
	public Admin login(Admin admin) throws Exception {
		return adminMapper.select(admin);
	}
}
