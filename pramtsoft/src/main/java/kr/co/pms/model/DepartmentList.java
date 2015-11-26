package kr.co.pms.model;

import java.util.List;

public class DepartmentList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Department> depList;
	private String errorCode;
	private String subscribe_kor;
	
	public DepartmentList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<Department> getDepList() {
		return depList;
	}

	public void setDepList(List<Department> depList) {
		this.depList = depList;
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
	
	

}
