package kh.hello.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.hello.configuration.Configuration;
import kh.hello.dao.AdBoardDAO;
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;
import kh.hello.dto.ProjectCoDTO;
import kh.hello.dto.ProjectDTO;

@Service
public class AdBoardService {
	
	@Autowired
	private AdBoardDAO bdao;
	
	/*
	 *  프로젝트
	 */
	
	public List<ProjectDTO> projectListperPage(int start, int end){
		return bdao.getProjectListPerPage(start, end);
	}
	
	public List<String> getProjectPageNavi(int currentPage){
		int recordTotalCount = bdao.getProjectTotal();
		int pageTotalCount = 0;		
		if(recordTotalCount % Configuration.recordCountPerPage>0) {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage+1;
		}else {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage+1;
		int endNavi = startNavi+(Configuration.naviCountPerPage-1);		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();

		if(needPrev) {
			pages.add("<a class=page-link href='../adBoard/projectList?page=" + (startNavi - 1) + "'>< </a>");		
		}
		for(int i=startNavi;i<=endNavi;i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='../adBoard/projectList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			pages.add(sb.toString());		
		}
		if(needNext) {
			pages.add("<a class=page-link href='../adBoard/projectList?page=\" + (endNavi + 1) + \"'>> </a>");
		}
		return pages;
	}
	
	@Transactional("txManager")
	public int delProject(int seq) {
		bdao.delProjectAllCo(seq);
		return bdao.delProject(seq);
	}
	
	public ProjectDTO detailViewProject(int seq) {
		return bdao.detailViewProject(seq);
	}
	
	public List<ProjectCoDTO> getProjectCo(int projectSeq){
		return bdao.getProjectCo(projectSeq);
	}
	
	public int delProjectCo(int seq) {
		return bdao.delProjectCo(seq);
	}
	
	/* 
	 * 대나무숲
	 */
	
	public List<BambooDTO> bambooListByPage(int start, int end){
		return bdao.bambooListByPage(start, end);
	}
	
	public List<String> getBambooPageNavi(int currentPage){
		int recordTotalCount = bdao.getBambooTotal();
		int pageTotalCount = 0;		
		if(recordTotalCount % Configuration.recordCountPerPage>0) {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage+1;
		}else {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage+1;
		int endNavi = startNavi+(Configuration.naviCountPerPage-1);		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();

		if(needPrev) {
			pages.add("<a class=page-link href='../adBoard/bambooList?page=" + (startNavi - 1) + "'>< </a>");		
		}
		for(int i=startNavi;i<=endNavi;i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='../adBoard/bambooList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			pages.add(sb.toString());		
		}
		if(needNext) {
			pages.add("<a class=page-link href='../adBoard/bambooList?page=" + (endNavi + 1) + "'>> </a>");
		}
		return pages;
	}
	
	@Transactional("txManager")
	public int delBamboo(int seq) {
		bdao.delBambooAllCo(seq);
		return bdao.delBamboo(seq);
	}
	
	public BambooDTO detailViewBamboo(int seq) {
		return bdao.detailViewBamboo(seq);
	}
	
	public List<BambooCoDTO> getBambooCo(int seq){
		return bdao.getBambooCo(seq);
	}
	
	public int delBambooCo(int seq) {
		return bdao.delBambooCo(seq);
	}
	
	/* 
	 * 업계현황
	 */
	
	public List<IndustryStatusDTO> industryListByPage(int start, int end){
		return bdao.industryListByPage(start, end);
	}
	
	public List<String> getIndustryPageNavi(int currentPage){
		int recordTotalCount = bdao.getIndustryTotal();
		int pageTotalCount = 0;		
		if(recordTotalCount % Configuration.recordCountPerPage>0) {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage+1;
		}else {
			pageTotalCount = recordTotalCount/Configuration.recordCountPerPage;
		}
		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int startNavi = (currentPage-1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage+1;
		int endNavi = startNavi+(Configuration.naviCountPerPage-1);		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi==1) {
			needPrev = false;
		}
		if(endNavi==pageTotalCount) {
			needNext = false;
		}
		
		List<String> pages = new ArrayList<>();

		if(needPrev) {
			pages.add("<a class=page-link href='../adBoard/industryList?page=" + (startNavi - 1) + "'>< </a>");		
		}
		for(int i=startNavi;i<=endNavi;i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<a class=page-link href='../adBoard/industryList?page="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a>");
			pages.add(sb.toString());		
		}
		if(needNext) {
			pages.add("<a class=page-link href='../adBoard/industryList?page=" + (endNavi + 1) + "'>> </a>");
		}
		return pages;		
	}
	
	@Transactional("txManager")
	public int delIndustry(int seq) {
		bdao.delIndustryAllCo(seq);
		return bdao.delIndustry(seq);
	}
	
	public IndustryStatusDTO detailViewIndustry(int seq) {
		return bdao.detailViewIndustry(seq);
	}
	
	public List<IndustryStatusCoDTO> getIndustryCo(int seq) {
		return bdao.getIndustryCo(seq);
	}

	public int delIndustryCo(int seq) {
		return bdao.delIndustryCo(seq);
	}
}







