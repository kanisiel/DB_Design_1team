package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.ProjectDao;
import kr.co.pms.dao.UserDao;
import kr.co.pms.model.Project;
import kr.co.pms.model.ProjectHistoryList;
import kr.co.pms.model.ProjectList;
import kr.co.pms.model.UserList;

import org.springframework.stereotype.Service;

@Service
public class EmployeeService {
	@Resource(name="userDao")
	private UserDao userDao;
	@Resource(name="projectDao")
	private ProjectDao projectDao;
	
	public ProjectList getProjectsPM(int uidx) throws SQLException {
		return projectDao.getProjectsPM(uidx);
	}
	public ProjectList getEndProjectPM(int uidx) throws SQLException {
		return projectDao.getEndProjectsPM(uidx);
	}
	public ProjectList getProgressProjectPM(int uidx) throws SQLException {
		return projectDao.getProgressProjectsPM(uidx);
	}
	public Project getProject(String pid) throws SQLException {
		return projectDao.getProject(pid);
	}
	public ProjectHistoryList getEnteredMembers(String pid) throws SQLException {
		return projectDao.getEnteredMembers(pid);
	}
	public UserList getFreeMembers() throws SQLException {
		return projectDao.getFreeMembers();
	}
}
