package kh.hello.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hello.configuration.Configuration;
import kh.hello.dto.ItnewsCoDTO;
import kh.hello.dto.ItnewsDTO;
import kh.hello.dto.LoginInfoDTO;
import kh.hello.dto.ReportDTO;
import kh.hello.dto.ScrapDTO;
import kh.hello.services.ItnewsService;

@Controller
@RequestMapping("/itnews")
public class ItnewsController {

	@Autowired
	private ItnewsService is;
	
	@RequestMapping("/itnewsList")
	public String itnewsMainList(Model m, String cpage) {
				int realCpage = 1;
				if(cpage!= null && !cpage.equals("") && !cpage.equals("null")) realCpage = Integer.parseInt(cpage);
				
				if(realCpage > 0 && realCpage <= Configuration.naviCountPerPage) {
					m.addAttribute("currentPage", realCpage);
				}else if(realCpage % Configuration.naviCountPerPage == 0) {
					m.addAttribute("currentPage", Configuration.naviCountPerPage + 1);
				}else {
					m.addAttribute("currentPage", (realCpage % Configuration.naviCountPerPage + 1));
				}
				
				int end = realCpage * Configuration.recordCountPerPage;
				int start = end - (Configuration.recordCountPerPage - 1);	
				
				List<ItnewsDTO> list = is.itnewsListTrim(start, end);
				m.addAttribute("list", list);
					
				String pageNavi = is.getPageNavi(realCpage);
				m.addAttribute("navi", pageNavi);
				
				
				m.addAttribute("page", realCpage);
				
				return "itnews/itnewsList";
	}
	
	@RequestMapping("/searchList")
	public String searchList(Model m, String cpage, String cate, String search) {
		int realCpage = 1;
		if(cpage!= null && !cpage.equals("") && !cpage.equals("null")) realCpage = Integer.parseInt(cpage);
		
		if(realCpage > 0 && realCpage <= Configuration.naviCountPerPage) {
			m.addAttribute("currentPage", realCpage);
		}else if(realCpage % Configuration.naviCountPerPage == 0) {
			m.addAttribute("currentPage", Configuration.naviCountPerPage + 1);
		}else {
			m.addAttribute("currentPage", (realCpage % Configuration.naviCountPerPage + 1));
		}
		
		int end = realCpage * Configuration.recordCountPerPage;
		int start = end - (Configuration.recordCountPerPage - 1);	
		
		List<ItnewsDTO> list = is.itnewsListTrimSrch(start, end, cate, search.replaceAll("'", "''"));
		m.addAttribute("list", list);
		String pageNavi = is.getPageNaviSrch(realCpage, cate, search);
		m.addAttribute("navi", pageNavi);
		
		m.addAttribute("page", realCpage);
		
		return "itnews/itnewsList";
	}
	
	@RequestMapping("/write")
	public String writeForm(String page,Model m) {
		m.addAttribute("page", page);
		return "/itnews/write";
	}
	
	@RequestMapping("/detail")
	public String itnewsDetail(Model m, int seq, String page) {
			is.increViewCount(seq);
			List<ItnewsCoDTO> list = is.commentList(seq);
			ItnewsDTO result = is.itnewsDetail(seq);
			if(result==null) {
				return "/itnews/itnewsView";
			}
			String profileImg = is.getImgByWriter(result.getWriter());
			String ip = Configuration.ip;
			m.addAttribute("profileImg", profileImg);
			m.addAttribute("list", list);
			m.addAttribute("result", result);
			m.addAttribute("page", page);
			m.addAttribute("ip", ip);
			return "/itnews/itnewsView";
	}
	
	@RequestMapping(value="/coWrite",produces="text/html;charset=utf8")
	@ResponseBody
	public String coWriteProc(ItnewsCoDTO dto, HttpSession session, String seq) {
		dto.setId(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
		dto.setWriter(((LoginInfoDTO)session.getAttribute("loginInfo")).getNickName());
		is.coWrite(dto, seq);
		System.out.println( is.coWriteAfter(seq));
		return is.coWriteAfter(seq);
	}
	
	@RequestMapping(value="/coRemove",produces="text/html;charset=utf8")
	@ResponseBody
	public String coDelProc(String itSeq, String seq) {
		is.removeItnewsCo(itSeq, seq);
		return is.coWriteAfter(itSeq);
	}
	
	@RequestMapping(value="/coModify",produces="text/html;charset=utf8")
	@ResponseBody
	public String coMdfProc(ItnewsCoDTO dto) {
		is.modifyItnewsCo(dto);
		return is.coWriteAfter(is.getItSeqBySeq(dto.getSeq()));
	}
	
	@RequestMapping("/writeProc")
	public String writeProc(String page, ItnewsDTO dto, HttpSession session){
		LoginInfoDTO ldto = (LoginInfoDTO)session.getAttribute("loginInfo");
		if(ldto == null) {return "error";}
		String path = session.getServletContext().getRealPath("attached");
		
		dto.setWriter(((LoginInfoDTO)session.getAttribute("loginInfo")).getNickName());
		dto.setId(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
		dto.setKakaoTitle(dto.getTitle());
		
		try {
			int boardSeq = is.writeItnews(path, dto);
			return "redirect:detail?seq="+boardSeq+"&page="+page;
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}
	
	@RequestMapping("/modifyProc")
	public String modifyProc(String page, ItnewsDTO dto, HttpSession session){
		String path = session.getServletContext().getRealPath("attached");
		
		try {
			int boardSeq = is.modifyItnews(path, dto);
			return "redirect:detail?seq="+boardSeq+"&page="+page;
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:../error";
		}
	}
	
	@RequestMapping("/remove")
	public String deleteProc(int seq, String page) {
		is.removeItnews(seq);
		return "redirect:itnewsList?cpage="+page;
	}
	
	@RequestMapping("/modify")
	public String modifyForm(Model m, String page, String seq) {
		m.addAttribute("dto", is.itnewsDetail(Integer.parseInt(seq)));
		m.addAttribute("page", page);
		return "itnews/modify";
	}
	
	@RequestMapping("/scrap")
	@ResponseBody
	public String scrap(ScrapDTO dto, HttpSession session) {
		dto.setId(((LoginInfoDTO)session.getAttribute("loginInfo")).getId());
		return is.scrap(dto);
	}
	
	//신고
	@ResponseBody
	@RequestMapping("/reportDuplCheck")
	public String reportDuplCheck(int seq, HttpSession session) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		String id = sessionValue.getId();
		int result = is.reportDuplCheck(id, seq);
		if(result>0) {
			return "dupl";
		}else {
			return "possible";
		}
	}
	
	@ResponseBody
	@RequestMapping("/report")
	public String reportProject(ReportDTO dto, HttpSession session) {
		LoginInfoDTO sessionValue = (LoginInfoDTO)session.getAttribute("loginInfo");
		dto.setReporterID(sessionValue.getId());
		dto.setReporterNick(sessionValue.getNickName());		
		int result = is.reportProject(dto);
		if(result>0) {
			return "success";
		}else {
			return "redirect:/home/error";
		}
	}
	
}
