package kr.co.pms.model;

import java.util.List;
import java.util.Vector;

public class ProjectList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Project> proList;
	private String errorCode;
	private String subscribe_kor;
	
	public List<Project> getComList() {
		return proList;
	}
	public void setComList(List<Project> proList) {
		this.proList = proList;
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
	public ProjectList() {
		super();
		setErrorCode(null);
		setSubscribe_kor(null);
		proList = new Vector<Project>();
		// TODO Auto-generated constructor stub
	}

}
