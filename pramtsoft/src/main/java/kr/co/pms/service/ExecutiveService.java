package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.UserDao;
import kr.co.pms.model.Pagination;
import kr.co.pms.model.UserInfo;
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
	public UserList getUserList() throws SQLException {
		return userDao.getUserList();
	}
	public UserList getLevelList(String levels) throws SQLException {
		return userDao.getLevelList(levels);
	}
	public UserList getUserListP(Pagination pagination) throws SQLException {
		return userDao.userListP(pagination);
	}
	public int getAllRownum() throws SQLException {
		return userDao.getAllRownum();
	}
	/*
	 * for Encrypt password
	 */
	public boolean encryptSha512(UserInfo userInfo) throws SQLException {
		return userDao.encryptPassword(userInfo);
	}
}
