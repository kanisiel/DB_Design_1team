package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.UserDao;
import kr.co.pms.model.UserList;

import org.springframework.stereotype.Service;

@Service
public class ExecutiveService {
	@Resource(name="userDao")
	private UserDao userDao;
	
	public UserList getRegList() throws SQLException {
		return userDao.getRegList();
	}
	public boolean approveReq(int uidx) throws SQLException {
		return userDao.approveReq(uidx);
	}
	public boolean deleteReq(int uidx) throws SQLException{
		return userDao.deleteReq(uidx);
	}
}
