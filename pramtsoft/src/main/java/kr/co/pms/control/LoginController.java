package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.pms.conf.Configuration;
import kr.co.pms.model.LoginInfo;
import kr.co.pms.model.UserInfo;
import kr.co.pms.service.LoginService;
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
	//private static final Log LOG = LogFactory.getLog(LoginController.class);
	
	@Autowired
	LoginService loginService;
	
	@ModelAttribute("loginInfo")
	LoginInfo loginInfo(){
		return new LoginInfo();
	}
	
	
	ModelAndView modelAndView;
	
	@RequestMapping(value = "/loginController/createAccount.do", method = RequestMethod.POST)
	public ModelAndView createAccount(HttpServletRequest request) throws UnsupportedEncodingException, ClassNotFoundException, SQLException {
		this.modelAndView = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		String birthDate = request.getParameter("birthDate");
		int serialNum = Integer.parseInt(request.getParameter("serialNum"));
		String schooling = request.getParameter("schooling");
		int levels = Integer.parseInt(request.getParameter("levels"));
		String level;
		String entryDate = request.getParameter("entryDate")+" 00:00:00.000000";
		switch(levels){
		case 1:
			level = "EMPLOYEE";
			break;
		case 6:
			level = "EXECUTIVE";
		default:
			level = "EMPLOYEE";
		}
		UserInfo userInfo = new UserInfo(userId, userPassword, userName, level, birthDate, serialNum, schooling, entryDate);
		int uidx = Integer.parseInt(Integer.toString(levels)+"0"+request.getParameter("entryDate").substring(2, 4))*10000;
		int seq=loginService.getSequence();
		if(seq>0){
			uidx+=seq;
		}
		userInfo.setUidx(uidx);
		userInfo.setLevels(level);
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
	
	@RequestMapping(value = "/loginController/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("loginInfo") LoginInfo loginInfo, HttpServletRequest request, RedirectAttributes redir) throws UnsupportedEncodingException, ClassNotFoundException, SQLException {
		UserInfo userInfo = null;
		modelAndView = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		
		loginInfo.setUserID(userID);
		loginInfo.setUserPassword(userPassword);
		userInfo = this.loginService.login(loginInfo);
		modelAndView.addObject("userInfo", userInfo);
		
		if(userInfo.getErrorCode().equals("Success")){
			modelAndView.setViewName("logged");
		} else {
			modelAndView.setViewName("home");
		}
		return modelAndView;
	}
	@RequestMapping(value = "/loginController/logout", method = RequestMethod.GET)
	public String logout( RedirectAttributes redir ) throws UnsupportedEncodingException {
		redir.addFlashAttribute("userInfo", null);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/loginController/register.do", method = RequestMethod.GET)
	public ModelAndView register( RedirectAttributes redir ) throws UnsupportedEncodingException {
		modelAndView = new ModelAndView("register");
		return modelAndView;
	}
}
