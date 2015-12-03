package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.pms.conf.Configuration.ErrorCodes;
import kr.co.pms.model.Evaluation;
import kr.co.pms.model.EvaluationProjectList;
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
		session.removeAttribute("evaluationInfo");
		String pid = request.getParameter("pid");
		String uidxs = request.getParameter("uid");
		String type1s = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		if(pid != null && uidxs != null && type1s != null && type2 != null){
			int uidx = Integer.parseInt(uidxs);
			Project p = employeeService.getProject(pid);
			UserInfo u = employeeService.getUserInfo(uidx);
			String type1 = "PE";
			switch(type1s){
			case "pm":
				type1 = "PE";
				break;
			case "coleague":
				type1 = "CGE";
				break;
			case "customer":
				type1 = "CE";
				break;
			}
			Evaluation evaluationInfo = new Evaluation(pid, uidx, type1, type2);
			evaluationInfo.setpName(p.getName());
			evaluationInfo.setuName(u.getName());
			Evaluation evalInfo = employeeService.getEval(evaluationInfo);
			if(evalInfo.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				session.setAttribute("evaluationInfo", evalInfo);
			} else {
				session.setAttribute("evaluationInfo", evaluationInfo);
			}
			String type2Name = "";
			switch(type2){
			case "BPE":
				type2Name = "업무수행평가";
				break;
			case "CSE":
				type2Name = "커뮤니케이션능력평가";
				break;
			}
			session.setAttribute("type2Name", type2Name);
		}
		List<EvaluationProjectList> epLists = new Vector<EvaluationProjectList>();
		ProjectList pLists = employeeService.getEndProjectPM(userInfo.getUidx());
		if(pLists.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
			for(Project project : pLists.getProList()){
				EvaluationProjectList epList = new EvaluationProjectList();
				epList.setPid(project.getPid());
				epList.setpName(project.getName());
				ProjectHistoryList phList = employeeService.getEnteredHistory(project.getPid());
				if(phList.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
					epList.seteList(phList.getPhList());
					epLists.add(epList);
				} else {
					String errorCode = ErrorCodes.ER9999.getCodeName();
					modelAndView.addObject("errorCode", errorCode);
					modelAndView.setViewName("error/500");
					return modelAndView;
				}
			}
			session.setAttribute("epLists", epLists);
			modelAndView.addObject("url", "rating.jsp");
			modelAndView.setViewName("template");
			return modelAndView;
		} else {
			String errorCode = ErrorCodes.ER9999.getCodeName();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/employeeController/rating.do", method = RequestMethod.POST)
	public ModelAndView addRating(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, ModelAndView modelAndView, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		String pid = request.getParameter("pid");
		String uidxs = request.getParameter("uid");
		String type1s = request.getParameter("type1");
		String type2 = request.getParameter("type2");
		String number = request.getParameter("rating");
		String description = request.getParameter("description");
		if(pid != null && uidxs != null && type1s != null && type2 != null && number != null && description != null){
			String type1 = "PE";
			int uidx = Integer.parseInt(uidxs);
			float rating = Float.parseFloat(number);
			switch(type1s){
			case "pm":
				type1 = "PE";
				break;
			case "coleague":
				type1 = "CGE";
				break;
			case "customer":
				type1 = "CE";
				break;
			}
			Evaluation eval = new Evaluation(pid, uidx, type1, type2);
			eval.setRating(rating);
			eval.setDescription(description);
			eval.setValuer(userInfo.getUidx());

			Evaluation evalInfo = employeeService.getEval(eval);
			if(evalInfo.getErrorCode().equals(ErrorCodes.Success.getCodeName())){
				if(employeeService.updateEvaluation(eval) == false){
					String errorCode = ErrorCodes.ER9999.getCodeName();
					modelAndView.addObject("errorCode", errorCode);
					modelAndView.setViewName("error/500");
					return modelAndView;
				}
			} else {
				if(employeeService.addEvaluation(eval) == false){
					String errorCode = ErrorCodes.ER9999.getCodeName();
					modelAndView.addObject("errorCode", errorCode);
					modelAndView.setViewName("error/500");
					return modelAndView;
				} else {
					String parameters = "?pid="+pid+"&uid="+uidxs+"&type1="+type1s+"&type2="+type2;
					modelAndView.setViewName("redirect://employeeController/rating"+parameters);
				}
			}
		}
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

}
