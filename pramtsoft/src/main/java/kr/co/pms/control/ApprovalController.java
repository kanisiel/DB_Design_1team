package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.pms.model.UserInfo;
import kr.co.pms.service.ApprovalService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ApprovalController {
	
//	@Autowired
//	ApprovalService approvalService;
//	
//	@ModelAttribute("userInfo")  
//    public UserInfo userInfo() {  
//        return new UserInfo();  
//    } 
	
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
//	@RequestMapping(value = "/approvalController/request.do", method = RequestMethod.POST)
//	public ModelAndView request(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
//		modelAndView = new ModelAndView();
//		modelAndView.addObject("userInfo", userInfo);
//		modelAndView.setViewName("approval/request");
//		return modelAndView;
//	}

}
