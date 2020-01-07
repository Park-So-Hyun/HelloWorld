package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.ProjectApplyDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;
import kh.hello.services.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ProjectService svc;
	
	/*
	 * 프로젝트 모집
	 */
	
	@RequestMapping("/list")
	public String projectMainList(String page, Model m) {
//		session.setAttribute("loginInfo", "sooin");
//		session.setAttribute("loginInfo", "sophie");
//		session.setAttribute("loginInfo", "eunwoo");
//		session.setAttribute("loginInfo", "jennie");
		
		int currentPage = 1;
		if(page!=null) {
			currentPage = Integer.parseInt(page);
		}
		int start = currentPage * (Configuration.recordCountPerPage)-(Configuration.recordCountPerPage-1);
		int end = currentPage * (Configuration.recordCountPerPage);
		List<ProjectDTO> result = svc.projectListPerPage(start, end);
		m.addAttribute("projectList", result);
		String pageNavi = svc.getPageNavi(currentPage);
		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("currentPage", currentPage);
		return "/project/projectList";
	}
	
	@RequestMapping("/chart")
	public String projectChart(Model m) {
		List<ProjectDTO> result = svc.projectList();
		m.addAttribute("projectList", result);
		return "/project/projectChart";
	}
	
	@RequestMapping("/map")
	public String projectMap(Model m) {
		List<ProjectDTO> result = svc.projectList();
		m.addAttribute("projectList", result);
		return "/project/projectMap";
	}
	
	@RequestMapping("/detailView")
	public String projectDetailView(int seq, Model m) {
		ProjectDTO result = svc.projectDetailView(seq);
		List<ProjectCoDTO> coResult = svc.commentList(seq); 
		String data = svc.projectWrite();
		m.addAttribute("data", data);
		m.addAttribute("pPage", result);
		m.addAttribute("comments", coResult);
		return "/project/detailView";
	}
	
	@RequestMapping("/write")
	public String projectWrite(Model m) {
		String data = svc.projectWrite();
		m.addAttribute("data", data);
		return "/project/write";
	}
	
	@RequestMapping("/writeProc")
	public String projectWriteConfirm(ProjectDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		String path = session.getServletContext().getRealPath("attached/project");
		int seq = 0;
		try {
			seq = svc.projectWriteConfirm(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/modify")
	public String projectModify(int seq, Model m) {
		String data = svc.projectWrite();
		ProjectDTO result = svc.projectDetailView(seq);
		m.addAttribute("data", data);
		m.addAttribute("pPage", result);
		return "/project/modify";
	}
	
	@RequestMapping("/modifyProc")
	public String projectModifyConfirm(ProjectDTO dto) {
		svc.projectModifyConfirm(dto);
		int seq = dto.getSeq();
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/deleteProc")
	public String projectDeleteConfirm(int seq) {
		String id = (String)session.getAttribute("loginInfo");
		svc.projectDeleteConfirm(seq, id);
		return "redirect:/project/list";
	}
	
	@RequestMapping("/closeProject")
	public String projectClose(int seq) {
		svc.projectClose(seq);
		return "redirect:/project/detailView?seq="+seq;
	}
	
	@RequestMapping("/applyCheck")
	public String projectApplyCheck(int projectSeq, Model m) {
		List<ProjectApplyDTO> result = svc.projectApplyList(projectSeq);
		m.addAttribute("applyList", result);
		return "/project/applyList";
	}
	
	
	
	
	/*
	 * 댓글 
	 */
	
	@ResponseBody
	@RequestMapping(value="/comment/writeProc",produces="text/html;charset=utf8")
	public String commentWriteConfirm(ProjectCoDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		return svc.commentWriteConfirm(dto);		
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/modifyProc",produces="text/html;charset=utf8")
	public String commentModifyConfirm(ProjectCoDTO dto) {
		return svc.commentModifyConfirm(dto);
	}
	
	@ResponseBody
	@RequestMapping(value="/comment/deleteProc",produces="text/html;charset=utf8")
	public String commentDeleteConfirm(int seq, int projectSeq) {
		String id = (String)session.getAttribute("loginInfo");
		return svc.commentDeleteConfirm(seq, projectSeq, id);		
	}
	
	
	
	/*
	 * 프로젝트 지원(신청)
	 */
	
	@ResponseBody
	@RequestMapping(value="/apply/writeProc",produces="text/html;charset=utf8")
	public String projectApplyWriteProc(ProjectApplyDTO dto) {
		dto.setWriter((String)session.getAttribute("loginInfo"));
		return svc.projectApplyWriteProc(dto);
	}
	
	@RequestMapping("/apply/list")
	public String projectApplyList(int projectSeq, Model m) {
		List<ProjectApplyDTO> result = svc.projectApplyList(projectSeq);
		m.addAttribute("projectApplyList", result);
		return "/project/projectApplyList";
	}
	
	@RequestMapping("/apply/detailView")
	public String projectApplyDetailView(int seq, Model m) {
		ProjectApplyDTO result = svc.projectApplyDetailView(seq);
		m.addAttribute("projectApplyPage", result);
		return "/project/applyDetailView";	
	}
	
	@RequestMapping("/apply/deleteProc")
	public void projectApplyDeleteConfirm(int seq) {
		svc.projectApplyDeleteConfirm(seq);
	}
}
