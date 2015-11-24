package kr.co.pms.model;

import java.util.List;
import java.util.Vector;

public class DocumentList implements CList {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<Document> docList;
	private String errorCode;
	private String subscribe_kor;
	
	public List<Document> getComList() {
		return docList;
	}
	public void setComList(List<Document> docList) {
		this.docList = docList;
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
	public DocumentList() {
		super();
		setErrorCode(null);
		setSubscribe_kor(null);
		docList = new Vector<Document>();
		// TODO Auto-generated constructor stub
	}
}
