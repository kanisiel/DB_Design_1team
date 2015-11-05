package service;

import java.sql.SQLException;

import javax.annotation.Resource;

import model.LoginInfo;
import model.UserInfo;

import org.springframework.stereotype.Service;

import dao.UserDao;

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
