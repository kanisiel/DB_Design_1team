package kr.co.pms.mapper;

import java.sql.SQLException;
import java.util.List;

import kr.co.pms.model.ApprovalHistory;
import kr.co.pms.model.Company;
import kr.co.pms.model.Document;
import kr.co.pms.model.Project;
import kr.co.pms.model.ProjectHistory;
import kr.co.pms.model.UserInfo;

public interface ProjectMapper {
	public List<Company> getCompanyList() throws SQLException;
	public Boolean addCompany(Company company) throws SQLException;
	public int getProSequence() throws SQLException;
	public int getDocSequence() throws SQLException;
	public Boolean addProject(Project project) throws SQLException;
	public Boolean addApproval(Document document) throws SQLException;
	public Boolean addApprovalHistory(Document document) throws SQLException;
	public Boolean setStatusApproval(ApprovalHistory aHistory) throws SQLException;
	public Boolean setStatusProject(Project project) throws SQLException;
	public Boolean putEmp(ProjectHistory pHistory) throws SQLException;
	public List<Project> getProjectList(String pid) throws SQLException;
	public Project getProject(String pid) throws SQLException;
	public List<Document> getDocumentExe(int superior) throws SQLException;
	public List<Document> getDocumentEmp(int drafter) throws SQLException;
	public ApprovalHistory getApprovalHistory(String did) throws SQLException;
	public Document getDocument(String did) throws SQLException;
	 public List<Project> getProgressProjects() throws SQLException;
	 public List<Project> getEndProject() throws SQLException;
	 public List<Project> getAllProject() throws SQLException;
	 public List<Project> getProjectsPM(int uidx) throws SQLException;
	 public List<Project> getProgressProjectsPM(int uidx) throws SQLException;
	 public List<Project> getEndProjectPM(int uidx) throws SQLException;
	 public List<ProjectHistory> getEnteredMembers(String pid) throws SQLException;
	 public List<UserInfo> getfreeMembers() throws SQLException;
}
