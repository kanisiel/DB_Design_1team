package kr.ac.mju.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.ac.mju.Conf.Configuration;
import kr.ac.mju.model.CollegeInfo;
import kr.ac.mju.model.DepartmentInfo;
import kr.ac.mju.model.LoginInfo;
import kr.ac.mju.model.UserInfo;
import kr.ac.mju.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes("userInfo")
public class LoginController {
	//private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@ModelAttribute("loginInfo")
	LoginInfo loginInfo(){
		return new LoginInfo();
	}
	
	
	ModelAndView modelAndView;
	
	@RequestMapping(value = "/loginController/createAccount.do", method = RequestMethod.POST)
	public ModelAndView createAccount( HttpServletRequest request) throws UnsupportedEncodingException, ClassNotFoundException, SQLException {
		this.modelAndView = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		int uIdx = Integer.parseInt(request.getParameter("UIDX"));
		String userID = request.getParameter("USERID");
		String userPassword = request.getParameter("USERPASSWORD");
		String userName = request.getParameter("USERNAME");
		String ut = request.getParameter("USERTYPE");
		String dt = request.getParameter("DEPT");
		String col = request.getParameter("COLLEGE");
		int userType = Integer.parseInt(ut);
		int dept = Integer.parseInt(dt);
		int college = Integer.parseInt(col);
		UserInfo userInfo = new UserInfo(uIdx, userID, userPassword, userName, userType, dept, college);
		if(loginService.createAccount(userInfo)==false){
			userInfo = new UserInfo();
			userInfo.setErrorCode(Configuration.ErrorCodes.ER8000.getCodeName());
			userInfo.setSubscribe_kor(Configuration.ErrorCodes.ER8000.getSubtitleKor());
			modelAndView.addObject("userInfo", userInfo);
			modelAndView.setViewName("redirect:/");
			return modelAndView;
		}else {
			userInfo.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
			userInfo.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
			modelAndView.setViewName("redirect:/");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/loginController/registerAccount", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("loginInfo") LoginInfo loginInfo, HttpServletRequest request) throws UnsupportedEncodingException, ClassNotFoundException, SQLException {
		modelAndView = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		loginInfo.setUserId(userID);
		loginInfo.setUserPassword(userPassword);
		DepartmentInfo departmentInfo = loginService.getDList();
		CollegeInfo collegeInfo = loginService.getCList();
		modelAndView.addObject("loginInfo", loginInfo);
		modelAndView.addObject("departments", departmentInfo);
		modelAndView.addObject("colleges", collegeInfo);
		modelAndView.setViewName("registerAccount");
		return modelAndView;
	}
	
	@RequestMapping(value = "/loginController/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("loginInfo") LoginInfo loginInfo, HttpServletRequest request, RedirectAttributes redir) throws UnsupportedEncodingException, ClassNotFoundException, SQLException {
		UserInfo userInfo = null;
		modelAndView = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		
		loginInfo.setUserId(userID);
		loginInfo.setUserPassword(userPassword);
		userInfo = this.loginService.login(loginInfo);
		modelAndView.addObject("userInfo", userInfo);
		
		if(userInfo.getErrorCode().equals("Success")){
			modelAndView.setViewName("logged");
		} else {
			return register(loginInfo, request);
		}
		return modelAndView;
	}
	@RequestMapping(value = "/loginController/logout", method = RequestMethod.GET)
	public String logout( RedirectAttributes redir ) throws UnsupportedEncodingException {
		redir.addFlashAttribute("userInfo", null);
		return "redirect:/";
	}
	
}
