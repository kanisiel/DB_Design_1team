package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	//private static final org.slf4j.Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		//logger.info("userinfo", userinfo);
//		UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
//		if(userInfo != null){
//			if(userInfo.getName() != null){
//				return "template";
//			}
//		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//UserInfo userInfo = (UserInfo) request.getSession().getAttribute("userInfo");
		request.getSession().setAttribute("userInfo", request);
		
		return "home";
	}
	
	@RequestMapping(value = "/logged", method = RequestMethod.GET)
	public String logged() throws UnsupportedEncodingException {
		return "logged";
	}
	
	
}
