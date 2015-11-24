package kr.co.pms.mapper;

import java.sql.SQLException;
import java.util.List;

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
}
