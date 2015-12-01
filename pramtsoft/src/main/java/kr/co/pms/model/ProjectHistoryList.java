package kr.co.pms.model;

import java.util.List;

public class ProjectHistoryList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<ProjectHistory> phList;
	private String errorCode;
	private String subscribe_kor;
	
	public List<ProjectHistory> getPhList() {
		return phList;
	}
	public void setPhList(List<ProjectHistory> phList) {
		this.phList = phList;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getSubscribe_kor() {
		return subscribe_kor;
	}
	public void setSubscribe_kor(String subscribe_kor) {
		this.subscribe_kor = subscribe_kor;
	}
	
	public ProjectHistoryList() {
		super();
	}
	
}
