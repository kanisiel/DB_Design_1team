package kr.co.pms.mapper;

import java.sql.SQLException;
import java.util.List;

import kr.co.pms.model.ApprovalHistory;
import kr.co.pms.model.Company;
import kr.co.pms.model.Document;
import kr.co.pms.model.Project;

public interface ProjectMapper {
	public List<Company> getCompanyList() throws SQLException;
	public Boolean addCompany(Company company) throws SQLException;
	public int getProSequence() throws SQLException;
	public int getDocSequence() throws SQLException;
	public Boolean addProject(Project project) throws SQLException;
	public Boolean addApproval(Document document) throws SQLException;
	public Boolean addApprovalHistory(Document document) throws SQLException;
	public List<Project> getProjectList(String pid) throws SQLException;
	public Project getProject(String pid) throws SQLException;
	public List<Document> getDocumentExe(int superior) throws SQLException;
	public List<Document> getDocumentEmp(int drafter) throws SQLException;
	public ApprovalHistory getApprovalHistory(String did) throws SQLException;
}
