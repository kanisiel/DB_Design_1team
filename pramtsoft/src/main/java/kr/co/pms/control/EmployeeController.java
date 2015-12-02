package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.pms.conf.Configuration.ErrorCodes;
import kr.co.pms.model.Project;
import kr.co.pms.model.ProjectHistoryList;
import kr.co.pms.model.ProjectList;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserList;
import kr.co.pms.service.EmployeeService;
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
public class EmployeeController extends CController {
	
	@Autowired
	LoginService loginService;
	@Autowired
	EmployeeService employeeService;
	
	@ModelAttribute("userInfo")  
    public UserInfo userInfo() {  
        return new UserInfo();  
    }
	@ModelAttribute("userList")  
	public UserList userList() {  
		return new UserList();  
	}
	ModelAndView modelAndView;
	
	@RequestMapping(value = "/employeeController/rating", method = RequestMethod.GET)
	public ModelAndView rating(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, ModelAndView modelAndView, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		modelAndView.addObject("url", "rating.jsp");
		modelAndView.setViewName("template");
		return modelAndView;
	}
	@RequestMapping(value = "/employeeController/project", method = RequestMethod.GET)
	public ModelAndView projectview(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, ModelAndView modelAndView, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		if(modelAndView == null){
			modelAndView = new ModelAndView();
		}
		String pid = request.getParameter("pid");
		if(pid != null){
			Project projectInfo = employeeService.getProject(pid);
			if(projectInfo.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				session.setAttribute("projectInfo", projectInfo);
				ProjectHistoryList enteredList = employeeService.getEnteredMembers(pid);
				if(enteredList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
					session.setAttribute("enteredList", enteredList);
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
		ProjectList progressList = employeeService.getProgressProjectPM(userInfo.getUidx());
		if(progressList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
			session.setAttribute("progressList", progressList);
			ProjectList endList = employeeService.getEndProjectPM(userInfo.getUidx());
			if(endList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				session.setAttribute("endList", endList);
				ProjectList allList = employeeService.getProjectsPM(userInfo.getUidx());
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

	@RequestMapping(value = "/employeeController/putEmp", method = RequestMethod.GET)
	public ModelAndView putEmp(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, ModelAndView modelAndView, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		String pid = request.getParameter("pid");
		UserList uList = employeeService.getFreeMembers();
		if(uList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
			session.setAttribute("freeList", uList.getReqList());
			ProjectHistoryList enteredList = employeeService.getEnteredMembers(pid);
			if(enteredList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				session.setAttribute("enteredList", enteredList);
			} else {
				String errorCode = ErrorCodes.ER9999.getCodeName();
				modelAndView.addObject("errorCode", errorCode);
				modelAndView.setViewName("error/500");
				return modelAndView;
			}
			session.setAttribute("userInfo", userInfo);
			//modelAndView.addObject("url", "employee/putEmp.jsp");
			modelAndView.setViewName("employee/putEmp");
			return modelAndView;
		} else {
			String errorCode = ErrorCodes.ER9999.getCodeName();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}

}
