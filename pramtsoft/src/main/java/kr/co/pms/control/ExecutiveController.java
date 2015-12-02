package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.pms.conf.Configuration.ErrorCodes;
import kr.co.pms.conf.Sha512Encrypter;
import kr.co.pms.model.*;
import kr.co.pms.service.ExecutiveService;
import kr.co.pms.service.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("userInfo")
public class ExecutiveController extends CController {

	@Autowired
	ExecutiveService executiveService;
	@Autowired
	LoginService loginService;
	
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
	public ModelAndView reqList(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, ModelAndView modelAndView)  throws UnsupportedEncodingException, SQLException {
		if(modelAndView == null){
			modelAndView = new ModelAndView();
		}
		modelAndView.addObject("userInfo", userInfo);
		UserList userList = executiveService.getRegList();
		if(userList.getErrorCode().equals("Success")){
			DepartmentList depList = loginService.getDepartmentList();
			SectionList secList = loginService.getSectionList();
			Map<String, String> depMap = new HashMap<String, String>();
			Map<String, String> secMap = new HashMap<String, String>();
			if(depList.getErrorCode().equals(ErrorCodes.Success.getCodeName())&&secList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				for(Department d : depList.getDepList()){
					depMap.put(d.getDidx(),d.getNameOther());
				}
				session.setAttribute("depMap", depMap);
				for(Section s : secList.getSecList()){
					secMap.put(s.getSidx(),s.getNameOther());
				}
				session.setAttribute("secMap", secMap);
			}
			flushSessionAttribute(session);
			session.setAttribute("userList", userList);
//			modelAndView.addObject("userList", userList);
			modelAndView.addObject("url", "executive/regApprove.jsp");
			modelAndView.setViewName("template");
			return modelAndView;
		} else {
			ErrorCodes errorCodes = ErrorCodes.valueOf(userList.getErrorCode());
			modelAndView.addObject("errorCode", errorCodes);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/executiveController/approveRegRequest.do", method = RequestMethod.POST)
	public ModelAndView approve(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request, HttpSession session)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView("executive/regApprove");
		String appUidx = request.getParameter("appUidx");
		String mode = request.getParameter("actions");
		System.out.println(appUidx);
		int uidx = Integer.parseInt(appUidx);
		if(mode.equals("approve")){
			if(executiveService.approveReq(uidx)){
				String errorCode = ErrorCodes.Success.getSubtitleKor();
				modelAndView.addObject("errorCode", errorCode);
				return reqList(userInfo, session, modelAndView);
			}
		} else if(mode.equals("delete")){
			if(executiveService.deleteReq(uidx)){
				String errorCode = ErrorCodes.Success.getSubtitleKor();
				modelAndView.addObject("errorCode", errorCode);
				return reqList(userInfo, session, modelAndView);
			}
		}
		String errorCode = ErrorCodes.ER0001.getSubtitleKor();
		modelAndView.addObject("errorCode", errorCode);
		return reqList(userInfo, session, modelAndView);
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
	public ModelAndView memberList(@ModelAttribute("userInfo") UserInfo userInfo, HttpServletRequest request, HttpSession session)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		String p = request.getParameter("p");
		int page;
		modelAndView.addObject("userInfo", userInfo);
		if(p != null){
			page = Integer.parseInt(p);	
		} else {
			page = 1;
		}
		Pagination pagination = new Pagination(((page-1)*10)+1, page*10);
		int max = executiveService.getAllRownum();
		Double md = (double) (max);
		int maxpage = 1;
		if(max < 0){
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		} else {
			Double d = Math.ceil(md/10);
			maxpage = d.intValue();
		}
		UserList userList = executiveService.getUserListP(pagination);
		if(userList.getErrorCode().equals("Success")){
			flushSessionAttribute(session);
			session.setAttribute("max",maxpage);
			session.setAttribute("page",page);
			session.setAttribute("userList", userList.getReqList());
			modelAndView.addObject("url", "executive/userList.jsp");
			modelAndView.setViewName("template");
			return modelAndView;
		} else {
			ErrorCodes errorCodes = ErrorCodes.valueOf(userList.getErrorCode());
			modelAndView.addObject("errorCode", errorCodes);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}	
	@RequestMapping(value = "/executiveController/project", method = RequestMethod.GET)
	public ModelAndView projectview(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, ModelAndView modelAndView, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		if(modelAndView == null){
			modelAndView = new ModelAndView();
		}
		String pid = request.getParameter("pid");
		if(pid != null){
			Project projectInfo = executiveService.getProject(pid);
			if(projectInfo.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				session.setAttribute("projectInfo", projectInfo);
				ProjectHistoryList phList = executiveService.getEnteredMembers(pid);
				if(phList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
					session.setAttribute("enteredList", phList);
				} else {
					String errorCode = ErrorCodes.ER9999.getCodeName();
					modelAndView.addObject("errorCode", errorCode);
					modelAndView.setViewName("error/500");
					return modelAndView;
				}
			} else {
				String errorCode = ErrorCodes.ER9999.getCodeName();
				modelAndView.addObject("errorCode", errorCode);
				modelAndView.setViewName("error/500");
				return modelAndView;
			}
		}
		ProjectList progressList = executiveService.getProgressProject();
		if(progressList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
			session.setAttribute("progressList", progressList);
			ProjectList endList = executiveService.getEndProject();
			if(endList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				session.setAttribute("endList", endList);
				ProjectList allList = executiveService.getAllProject();
				if(allList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
					session.setAttribute("allList", allList);
				} else {
					ErrorCodes errorCodes = ErrorCodes.valueOf(allList.getErrorCode());
					modelAndView.addObject("errorCode", errorCodes);
					modelAndView.setViewName("error/500");
					return modelAndView;
				}
			} else {
				ErrorCodes errorCodes = ErrorCodes.valueOf(endList.getErrorCode());
				modelAndView.addObject("errorCode", errorCodes);
				modelAndView.setViewName("error/500");
				return modelAndView;
			}
		} else {
			ErrorCodes errorCodes = ErrorCodes.valueOf(progressList.getErrorCode());
			modelAndView.addObject("errorCode", errorCodes);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
		session.setAttribute("userInfo", userInfo);
		modelAndView.addObject("url", "projectHis.jsp");
		modelAndView.setViewName("template");
		return modelAndView;
	}
}
