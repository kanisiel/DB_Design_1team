package kr.co.pms.dao;
import java.sql.SQLException;
import java.util.List;

import kr.co.pms.conf.Configuration;
import kr.co.pms.mapper.ProjectMapper;
import kr.co.pms.model.Company;
import kr.co.pms.model.CompanyList;
import kr.co.pms.model.Document;
import kr.co.pms.model.Project;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDao implements Dao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CompanyList getCompanyList() throws SQLException{
		CompanyList companyList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			List<Company> comList = projectMapper.getCompanyList();
			if(comList == null){
				companyList = new CompanyList();
				companyList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				companyList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return companyList;
			} else {
				companyList = new CompanyList();
				companyList.setComList(comList);
				companyList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				companyList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return companyList;
			}
		} else {
			companyList = new CompanyList();
			companyList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			companyList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return companyList;
		}
	}
	public boolean addCompany(Company company) {
		
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				projectMapper.addCompany(company);
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
	public int getDocSequence(){
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				int seq = projectMapper.getDocSequence();
				return seq;
			}catch(Exception e){
				return -999;
			}
		}
		return -999;
	}
	public int getProSequence(){
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				int seq = projectMapper.getProSequence();
				return seq;
			}catch(Exception e){
				return -999;
			}
		}
		return -999;
	}
	public boolean addApproval(Document document) {
		
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				projectMapper.addApproval(document);
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
	public boolean addProject(Project project) {
		
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				projectMapper.addProject(project);
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
}
