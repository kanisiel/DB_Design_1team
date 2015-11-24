package kr.co.pms.model;

import java.util.List;
import java.util.Vector;

public class CompanyList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Company> comList;
	private String errorCode;
	private String subscribe_kor;
	
	public List<Company> getComList() {
		return comList;
	}
	public void setComList(List<Company> comList) {
		this.comList = comList;
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
	public CompanyList() {
		super();
		setErrorCode(null);
		setSubscribe_kor(null);
		comList = new Vector<Company>();
		// TODO Auto-generated constructor stub
	}
}
