package kr.ac.mju.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.ac.mju.Dao.UserDao;
import kr.ac.mju.model.LoginInfo;
import kr.ac.mju.model.UserInfo;

import org.springframework.stereotype.Service;

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
}
