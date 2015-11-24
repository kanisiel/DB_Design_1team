package kr.co.pms.mapper;

import java.sql.SQLException;
import java.util.List;

import kr.co.pms.model.Company;

public interface ProjectMapper {
	public List<Company> getCompanyList() throws SQLException;
	public Boolean addCompany(Company company) throws SQLException;
}
