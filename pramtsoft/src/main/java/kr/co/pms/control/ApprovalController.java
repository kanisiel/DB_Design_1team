package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.pms.model.UserInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("userInfo")
public class ApprovalController extends CController {
	
//	@Autowired
//	ApprovalService approvalService;
//	
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
		session.setAttribute("userInfo2", userInfo);
		modelAndView.addObject("userInfo", userInfo);
		modelAndView.setViewName("template");
		return modelAndView;
	}

}
