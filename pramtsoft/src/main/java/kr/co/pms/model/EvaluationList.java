package kr.co.pms.model;

import java.util.List;

public class EvaluationList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<EvaluationProjectList> epList;
	private String errorCode;
	private String subscribe_kor;
	
	public List<EvaluationProjectList> getpList() {
		return epList;
	}
	public void setpList(List<EvaluationProjectList> epList) {
		this.epList = epList;
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
	
	public EvaluationList() {
		super();
		// TODO Auto-generated constructor stub
	}

}
