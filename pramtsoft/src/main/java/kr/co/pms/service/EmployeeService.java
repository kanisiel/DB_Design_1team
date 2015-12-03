package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.ProjectDao;
import kr.co.pms.dao.UserDao;
import kr.co.pms.model.Evaluation;
import kr.co.pms.model.Project;
import kr.co.pms.model.ProjectHistoryList;
import kr.co.pms.model.ProjectList;
import kr.co.pms.model.UserInfo;

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
	public ProjectHistoryList getEnteredHistory(String pid) throws SQLException {
		return projectDao.getEnteredHistory(pid);
	}
	public UserInfo getUserInfo(int uidx) throws SQLException {
		return projectDao.getUserInfo(uidx);
	}
	public Boolean addEvaluation(Evaluation eval) throws SQLException {
		return projectDao.addEvaluation(eval);
	}
	public Evaluation getEval(Evaluation eval) throws SQLException {
		return projectDao.getEval(eval);
	}
	public Boolean updateEvaluation(Evaluation eval) throws SQLException {
		return projectDao.updateEvaluation(eval);
	}
}
