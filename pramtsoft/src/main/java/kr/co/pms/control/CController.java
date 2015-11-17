package kr.co.pms.control;

import javax.servlet.http.HttpSession;

public class CController {
	public void flushSessionAttribute(HttpSession session){
		session.removeAttribute("max");
		session.removeAttribute("page");
		session.removeAttribute("userList");
	}
}
