package kr.co.pms.model;

public class Pagination implements CEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int start;
	private int end;
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public Pagination(int start, int end) {
		super();
		this.start = start;
		this.end = end;
	}
	
}
