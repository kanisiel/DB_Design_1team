package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.pms.conf.Configuration.ErrorCodes;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserList;
import kr.co.pms.service.ApprovalService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("userInfo")
public class ApprovalController extends CController {
	
	@Autowired
	ApprovalService approvalService;
	
	@ModelAttribute("userInfo")  
    public UserInfo userInfo() {  
        return new UserInfo();  
    } 
	
	ModelAndView modelAndView;

	//private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/approvalController/index.do", method = RequestMethod.POST)
//	public ModelAndView index(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
//		String level = userInfo.getLevel();
//		switch(level){
//		case "EMPLOYEE":
//			return request(userInfo, request);
//		default:
//			modelAndView = new ModelAndView("errorpage");
//			modelAndView.addObject("errorcode", "505");
//			return modelAndView;
//		}
//	}
	@RequestMapping(value = "/approvalController/request", method = RequestMethod.GET)
	public ModelAndView request(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		//UserList empList = approvalService.getLevelList("EMPLOYEE");
		UserList exeList = approvalService.getLevelList("EXECUTIVE");
		if(exeList.getErrorCode().equals("Success")){
			flushSessionAttribute(session);
			//session.setAttribute("empList", empList.getReqList());
			session.setAttribute("exeList", exeList.getReqList());
			modelAndView.addObject("url", "employee/request.jsp");
			modelAndView.setViewName("template");
			return modelAndView;
		} else {
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/approvalController/request.do", method = RequestMethod.POST)
	public ModelAndView requestToDB(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		String puttedEmp = request.getParameter("putEmp");
		List<String> items = Arrays.asList(puttedEmp.split(","));
		for(String uidx : items){
			System.out.println(items.indexOf(uidx)+"'s uidx is "+uidx);
		}
		modelAndView.setViewName("template");
		return modelAndView;
	}
}
