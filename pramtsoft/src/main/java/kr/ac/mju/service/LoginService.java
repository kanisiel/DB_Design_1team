package kr.ac.mju.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.ac.mju.Dao.CollegeDao;
import kr.ac.mju.Dao.DepartmentDao;
import kr.ac.mju.Dao.UserDao;
import kr.ac.mju.model.CollegeInfo;
import kr.ac.mju.model.DepartmentInfo;
import kr.ac.mju.model.LoginInfo;
import kr.ac.mju.model.UserInfo;

import org.springframework.stereotype.Service;

@Service
public class LoginService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	
	@Resource(name="departmentDao")
	private DepartmentDao departmentDao;
	
	@Resource(name="collegeDao")
	private CollegeDao collegeDao;
	
	public UserInfo login(LoginInfo loginInfo) throws SQLException{
		return userDao.login(loginInfo);
	}
	
	public DepartmentInfo getDList() throws SQLException {
		return departmentDao.getList();
	}
	
	public CollegeInfo getCList() throws SQLException {
		return collegeDao.getList();
	}
	public boolean createAccount(UserInfo userInfo) throws SQLException {
		return userDao.createAccount(userInfo);
	}
}
