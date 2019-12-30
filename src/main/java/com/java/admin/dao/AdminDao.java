package com.java.admin.dao;

import org.springframework.stereotype.Component;

@Component
public interface AdminDao {

	int loginCheck(String adminId, String adminPwd);

}
