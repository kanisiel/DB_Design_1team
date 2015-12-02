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
import kr.co.pms.model.ProjectHistory;
import kr.co.pms.model.ProjectHistoryList;
import kr.co.pms.model.ProjectList;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserList;

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
	public ProjectHistoryList getEnteredMembers(String pid) throws SQLException{
		ProjectHistoryList projectHistoryList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<ProjectHistory> phList = projectMapper.getEnteredMembers(pid);
			if(phList == null){
				projectHistoryList = new ProjectHistoryList();
				projectHistoryList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				projectHistoryList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return projectHistoryList;
			} else {
				projectHistoryList = new ProjectHistoryList();
				projectHistoryList.setPhList(phList);
				projectHistoryList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				projectHistoryList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return projectHistoryList;
			}
		} else {
			projectHistoryList = new ProjectHistoryList();
			projectHistoryList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			projectHistoryList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return projectHistoryList;
		}
	}
	public UserList getFreeMembers() throws SQLException{
		UserList uList;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			List<UserInfo> reqList = projectMapper.getfreeMembers();
			if(reqList == null){
				uList = new UserList();
				uList.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				uList.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return uList;
			} else {
				uList = new UserList();
				uList.setReqList(reqList);
				uList.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				uList.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return uList;
			}
		} else {
			uList = new UserList();
			uList.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			uList.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return uList;
		}
	}
	public Document getDocument(String did) throws SQLException {
		Document document;
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper != null){
			document = projectMapper.getDocument(did);
			if(document == null){
				document = new Document();
				document.setErrorCode(Configuration.ErrorCodes.ER1001.getCodeName());
				document.setSubscribe_kor(Configuration.ErrorCodes.ER1001.getSubtitleKor());
				return document;
			} else {
				document.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				document.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				return document;
			}
		} else {
			document = new Document();
			document.setErrorCode(Configuration.ErrorCodes.ER0000.getCodeName());
			document.setSubscribe_kor(Configuration.ErrorCodes.ER0000.getSubtitleKor());
			return document;
		}
	}
	public boolean setStatusApproval(ApprovalHistory aHistory) {
		
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				projectMapper.setStatusApproval(aHistory);
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
	public boolean setStatusProject(Project project) {
		
		ProjectMapper projectMapper = sqlSession.getMapper(ProjectMapper.class);
		if(projectMapper!=null){
			try{
				projectMapper.setStatusProject(project);
				return true;
			}catch(Exception e){
				return false;
			}
		}
		return false;
	}
}
