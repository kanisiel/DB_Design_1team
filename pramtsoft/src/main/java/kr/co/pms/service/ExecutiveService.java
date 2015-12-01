package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.ProjectDao;
import kr.co.pms.dao.UserDao;
import kr.co.pms.model.*;

import org.springframework.stereotype.Service;

@Service
public class ExecutiveService {
	@Resource(name="userDao")
	private UserDao userDao;
	@Resource(name="projectDao")
	private ProjectDao projectDao;
	
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
	public ProjectList getAllProject() throws SQLException {
		return projectDao.getAllProjects();
	}
	public ProjectList getEndProject() throws SQLException {
		return projectDao.getEndProjects();
	}
	public ProjectList getProgressProject() throws SQLException {
		return projectDao.getProgressProjects();
	}
	public Project getProject(String pid) throws SQLException {
		return projectDao.getProject(pid);
	}
}
