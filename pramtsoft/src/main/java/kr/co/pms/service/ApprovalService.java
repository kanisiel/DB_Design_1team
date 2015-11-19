package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.UserDao;
import kr.co.pms.model.UserInfo2;
import kr.co.pms.model.UserList;

import org.springframework.stereotype.Service;

@Service
public class ApprovalService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	public UserInfo2 getUser(int uidx) throws SQLException{
		return userDao.getUser(uidx);
	}
	public UserList getLevelList(String levels) throws SQLException {
		return userDao.getLevelList(levels);
	}
}
