package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.UserDao;
import kr.co.pms.model.LoginInfo;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserInfo2;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoginService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	public UserInfo login(LoginInfo loginInfo) throws SQLException{
		return userDao.login(loginInfo);
	}
	public boolean createAccount(UserInfo userInfo) throws SQLException {
		return userDao.createAccount(userInfo);
	}
	public int getSequence(){
		return userDao.getSequence();
	}
}
