package kr.co.pms.dao;
import java.sql.SQLException;
import java.util.List;

import kr.co.pms.conf.Configuration;
import kr.co.pms.mapper.ProjectMapper;
import kr.co.pms.model.ApprovalHistory;
import kr.co.pms.model.Company;
import kr.co.pms.model.CompanyList;
import kr.co.pms.model.Document;
import kr.co.pms.model.DocumentList;
import kr.co.pms.model.Project;
import kr.co.pms.model.ProjectList;

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
				projectMapper.addApprovalHistory(document);
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
	public DocumentList getDocumentsEmp(int uidx) throws SQLException {
		DocumentList documentList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			List<Document> docList = projectMapper.getDocumentEmp(uidx);
			if(docList == null){
				documentList = new DocumentList();
				documentList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				documentList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return documentList;
			} else {
				documentList = new DocumentList();
				documentList.setDocList(docList);
				documentList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				documentList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return documentList;
			}
		} else {
			documentList = new DocumentList();
			documentList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			documentList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return documentList;
		}
	}
	public DocumentList getDocumentsExe(int uidx) throws SQLException {
		DocumentList documentList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			List<Document> docList = projectMapper.getDocumentExe(uidx);
			if(docList == null){
				documentList = new DocumentList();
				documentList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				documentList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return documentList;
			} else {
				documentList = new DocumentList();
				documentList.setDocList(docList);
				documentList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				documentList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return documentList;
			}
		} else {
			documentList = new DocumentList();
			documentList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			documentList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return documentList;
		}
	}
	public ProjectList getProjectList(String pid) throws SQLException {
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			List<Project> proList = projectMapper.getProjectList(pid);
			if(proList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(proList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}
	public Project getProject(String pid) throws SQLException {
		Project project;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			project = projectMapper.getProject(pid);
			if(project == null){
				project = new Project();
				project.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				project.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return project;
			} else {
				project.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				project.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return project;
			}
		} else {
			project = new Project();
			project.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			project.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return project;
		}
	}
	public ApprovalHistory getApprovalHistory(String did) throws SQLException {
		ApprovalHistory history;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			history = projectMapper.getApprovalHistory(did);
			if(history==null){
				history = new ApprovalHistory();
				history.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				history.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return history;
			} else {
				history.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				history.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return history;
			}
		} else {
			history = new ApprovalHistory();
			history.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			history.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return history;
		}
	}
	public ProjectList getAllProjects() throws SQLException{
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<Project> pList = projectMapper.getAllProject();
			if(pList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(pList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}
	public ProjectList getProgressProjects() throws SQLException{
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<Project> pList = projectMapper.getProgressProjects();
			if(pList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(pList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}
	public ProjectList getEndProjects() throws SQLException{
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<Project> pList = projectMapper.getEndProject();
			if(pList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(pList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}

	public ProjectList getProjectsPM(int uidx) throws SQLException{
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<Project> pList = projectMapper.getProjectsPM(uidx);
			if(pList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(pList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}
	public ProjectList getProgressProjectsPM(int uidx) throws SQLException{
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<Project> pList = projectMapper.getProgressProjectsPM(uidx);
			if(pList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(pList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}
	public ProjectList getEndProjectsPM(int uidx) throws SQLException{
		ProjectList projectList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<Project> pList = projectMapper.getEndProjectPM(uidx);
			if(pList == null){
				projectList = new ProjectList();
				projectList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectList;
			} else {
				projectList = new ProjectList();
				projectList.setProList(pList);
				projectList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectList;
			}
		} else {
			projectList = new ProjectList();
			projectList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectList;
		}
	}
}
