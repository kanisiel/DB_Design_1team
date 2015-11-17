package kr.co.pms.model;

import java.util.List;
import java.util.Vector;

public class UserList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<UserInfo> reqList;
	private int page;
	private int max;
	private String errorCode;
	private String subscribe_kor;
	
	
	public UserList() {
		setErrorCode(null);
		setSubscribe_kor(null);
		reqList = new Vector<UserInfo>();
	}
	public List<UserInfo> getReqList() {
		return reqList;
	}
	public void setReqList(List<UserInfo> reqList) {
		this.reqList = reqList;
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
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	
}
