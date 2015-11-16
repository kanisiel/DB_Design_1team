package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.pms.conf.Configuration.*;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserList;
import kr.co.pms.service.ExecutiveService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("userInfo")
public class ExecutiveController {

	@Autowired
	ExecutiveService executiveService;
	
	@ModelAttribute("userInfo")  
    public UserInfo userInfo() {  
        return new UserInfo();  
    }
	@ModelAttribute("userList")  
	public UserList userList() {  
		return new UserList();  
	}
	ModelAndView modelAndView;
	
	@RequestMapping(value = "/executiveController/approveRegRequest", method = RequestMethod.GET)
	public ModelAndView reqList(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request, ModelAndView modelAndView)  throws UnsupportedEncodingException, SQLException {
		if(modelAndView == null){
			modelAndView = new ModelAndView("executive/regApprove");
		}
		modelAndView.addObject("userInfo", userInfo);
		UserList userList = executiveService.getRegList();
		if(userList.getErrorCode().equals("Success")){
			modelAndView.addObject("userList", userList);
			modelAndView.setViewName("executive/regApprove");
			return modelAndView;
		} else {
			ErrorCodes errorCodes = ErrorCodes.valueOf(userList.getErrorCode());
			modelAndView.addObject("errorCode", errorCodes);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/executiveController/approveRegRequest.do", method = RequestMethod.POST)
	public ModelAndView approve(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView("executive/regApprove");
		String appUidx = request.getParameter("appUidx");
		String mode = request.getParameter("actions");
		System.out.println(appUidx);
		int uidx = Integer.parseInt(appUidx);
		if(mode.equals("approve")){
			if(executiveService.approveReq(uidx)){
				String errorCode = ErrorCodes.Success.getSubtitleKor();
				modelAndView.addObject("errorCode", errorCode);
				return reqList(userInfo, request, modelAndView);
			}
		} else if(mode.equals("delete")){
			if(executiveService.deleteReq(uidx)){
				String errorCode = ErrorCodes.Success.getSubtitleKor();
				modelAndView.addObject("errorCode", errorCode);
				return reqList(userInfo, request, modelAndView);
			}
		}
		String errorCode = ErrorCodes.ER0001.getSubtitleKor();
		modelAndView.addObject("errorCode", errorCode);
		return reqList(userInfo, request, modelAndView);
	}
}
