package kr.co.pms.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import kr.co.pms.dao.ProjectDao;
import kr.co.pms.dao.UserDao;
import kr.co.pms.model.Company;
import kr.co.pms.model.CompanyList;
import kr.co.pms.model.Document;
import kr.co.pms.model.Project;
import kr.co.pms.model.UserInfo2;
import kr.co.pms.model.UserList;

import org.springframework.stereotype.Service;

@Service
public class ApprovalService {
	
	@Resource(name="userDao")
	private UserDao userDao;
	@Resource(name="projectDao")
	private ProjectDao projectDao;
	
	public UserInfo2 getUser(int uidx) throws SQLException{
		return userDao.getUser(uidx);
	}
	public UserList getLevelList(String levels) throws SQLException {
		return userDao.getLevelList(levels);
	}
	public CompanyList getCompanyList() throws SQLException {
		return projectDao.getCompanyList();
	}
	public Boolean addCompany(Company company) throws SQLException {
		return projectDao.addCompany(company);
	}
	public int getDocSequence() throws SQLException {
		return projectDao.getDocSequence();
	}
	public int getProSequence() throws SQLException {
		return projectDao.getProSequence();
	}
	public Boolean addApproval(Document document) throws SQLException {
		return projectDao.addApproval(document);
	}
	public Boolean addProject(Project project) throws SQLException {
		return projectDao.addProject(project);
	}
}
