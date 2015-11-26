package kr.co.pms.model;

import java.util.List;

public class SectionList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Section> secList;
	private String errorCode;
	private String subscribe_kor;
	
	public SectionList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<Section> getSecList() {
		return secList;
	}

	public void setSecList(List<Section> secList) {
		this.secList = secList;
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
