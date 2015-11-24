package kr.co.pms.control;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.pms.conf.Configuration;
import kr.co.pms.conf.Configuration.ErrorCodes;
import kr.co.pms.model.Company;
import kr.co.pms.model.CompanyList;
import kr.co.pms.model.Document;
import kr.co.pms.model.Project;
import kr.co.pms.model.UserInfo;
import kr.co.pms.model.UserList;
import kr.co.pms.service.ApprovalService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("userInfo")
public class ApprovalController extends CController {
	
	@Autowired
	ApprovalService approvalService;
	
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
		//UserList empList = approvalService.getLevelList("EMPLOYEE");
		UserList exeList = approvalService.getLevelList("EXECUTIVE");
		if(exeList.getErrorCode().equals("Success")){
			flushSessionAttribute(session);
			//session.setAttribute("empList", empList.getReqList());
			session.setAttribute("exeList", exeList.getReqList());
			modelAndView.addObject("url", "employee/request.jsp");
			modelAndView.setViewName("template");
			return modelAndView;
		} else {
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/approvalController/request.do", method = RequestMethod.POST)
	public ModelAndView requestToDB(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		Date date = new Date();
	    String strDateFormat = "yyyy-MM-dd";
	    DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	    String limits= dateFormat.format(date)+" 00:00:00.000000";
		Project project = new Project(request.getParameter("projectName"), request.getParameter("startDate"), request.getParameter("endDate"), request.getParameter("orderer"), request.getParameter("reqmanning"));
		Document document = new Document(userInfo.getUidx(), Integer.parseInt(request.getParameter("holder")), limits);
		int docSeq = approvalService.getDocSequence();
		int proSeq = approvalService.getProSequence();
		if(docSeq > 0 || proSeq > 0){
			String did = "PRT-"+userInfo.getDepartment()+"-"+userInfo.getSection()+"-"+dateFormat.format(date).replace("-", "")+"-"+String.format("%03d", docSeq);
			String pid = "PRT-"+request.getParameter("orderer")+"-"+dateFormat.format(date).replace("-", "")+"-"+String.format("%03d", proSeq);
			System.out.println(did);
			System.out.println(pid);
			document.setDid(did);
			document.setPid(pid);
			document.setDescription(" ");
			project.setPid(pid);
			project.setManager(userInfo.getUidx());
			project.setStatus("RN");
		} else {
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
		}
		if(approvalService.addProject(project) != false){
			if(approvalService.addApproval(document)!= false){
				userInfo.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
				userInfo.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
				modelAndView.setViewName("template");
				return modelAndView;
			} else {
				String errorCode = ErrorCodes.ER3000.getSubtitleKor();
				modelAndView.addObject("errorCode", errorCode);
				modelAndView.setViewName("error/500");
				return modelAndView;
			}
		} else {
			String errorCode = ErrorCodes.ER2000.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
		
	}
	@RequestMapping(value = "/approvalController/campanyList", method = RequestMethod.GET)
	public ModelAndView getCampanies(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		CompanyList companyList = approvalService.getCompanyList();
		if(companyList.getErrorCode().equals("Success")){
//			for(Company company : companyList.getComList()){
//				System.out.println(company.getcIdx());
//			}
			modelAndView.addObject("companyList",companyList.getComList());
			modelAndView.setViewName("employee/companyList");
			return modelAndView;
		} else {
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}
	}
	@RequestMapping(value = "/approvalController/addCompany.do", method = RequestMethod.POST)
	public ModelAndView addCampany(@ModelAttribute("userInfo") UserInfo userInfo, HttpSession session, HttpServletRequest request)  throws UnsupportedEncodingException, SQLException {
		modelAndView = new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		Company company = new Company(request.getParameter("addCidx"), request.getParameter("addNameEn"), request.getParameter("addNameOther"));
		if(approvalService.addCompany(company)==false){
			String errorCode = ErrorCodes.ER0001.getSubtitleKor();
			modelAndView.addObject("errorCode", errorCode);
			modelAndView.setViewName("error/500");
			return modelAndView;
		}else {
			userInfo.setErrorCode(Configuration.ErrorCodes.Success.getCodeName());
			userInfo.setSubscribe_kor(Configuration.ErrorCodes.Success.getSubtitleKor());
			modelAndView.setViewName("redirect:/approvalController/campanyList");
			return modelAndView;
		}
	}
}
