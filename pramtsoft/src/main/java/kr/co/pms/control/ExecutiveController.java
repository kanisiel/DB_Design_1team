package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import kr.co.pms.conf.Sha512Encrypter;
import kr.co.pms.conf.Configuration.*;
import kr.co.pms.model.Pagination;
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
	
	/*
	 * for Encrypt passwords.
	 * if necessary for encrypt another column, change encryption funtion's parameter.
	 */
	@RequestMapping(value = "/executiveController/encryption.do", method = RequestMethod.GET)
	public ModelAndView encryption(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		Sha512Encrypter encrypter = new Sha512Encrypter();
		UserList userList = executiveService.getUserList();
		for(UserInfo userData : userList.getReqList()){
			try{
				encrypter.encryption(userData.getPassword());
				userData.setPassword(encrypter.getPassword());
				//System.out.println(userData.getName()+"'s Password : "+userData.getPassword());
				if(executiveService.encryptSha512(userData)){
					
				}
			} catch (Exception e) {
				String errorCode = ErrorCodes.ER0001.getSubtitleKor();
				modelAndView.addObject("errorCode", errorCode);
				modelAndView.setViewName("error/500");
				return modelAndView;
			}
		}
		return modelAndView;
	}
	@RequestMapping(value = "/executiveController/memberList", method = RequestMethod.GET)
	public ModelAndView memberList(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		String p = request.getParameter("p");
		int page;
		modelAndView.addObject("userInfo", userInfo);
		if(p != null){
			page = Integer.parseInt(p);	
		} else {
			page = 1;
		}
		modelAndView.addObject("page", page);
		Pagination pagination = new Pagination((page-1)*10, page*10);
		int max = executiveService.getAllRownum();
		if(max < 0){
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		} else {
			modelAndView.addObject("max", Math.ceil(max/10));
		}
		UserList userList = executiveService.getUserListP(pagination);
		if(userList.getErrorCode().equals("Success")){
			modelAndView.addObject("userList", userList);
			modelAndView.setViewName("executive/userList");
			return modelAndView;
		} else {
			ErrorCodes errorCodes = ErrorCodes.valueOf(userList.getErrorCode());
			modelAndView.addObject("errorCode", errorCodes);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}	
}
