package kr.co.pms.model;

import java.util.List;

public class EvaluationProjectList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<ProjectHistory> eList;
	private String pid;
	private String pName;
	private String errorCode;
	private String subscribe_kor;
	
	public List<ProjectHistory> geteList() {
		return eList;
	}
	public void seteList(List<ProjectHistory> eList) {
		this.eList = eList;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
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
	
	public EvaluationProjectList() {
		super();
	}

}
