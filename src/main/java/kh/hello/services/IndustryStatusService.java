package kh.hello.services;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;

import com.google.gson.Gson;

import kh.hello.configuration.Configuration;
import kh.hello.dao.IndustryStatusDAO;
import kh.hello.dto.IndustryStatusCoDTO;
import kh.hello.dto.IndustryStatusDTO;

@Service
public class IndustryStatusService {
	@Autowired
	private IndustryStatusDAO dao;

	//업계현황 게시판 글
	@Transactional("txManager")
	public IndustryStatusDTO industryStatusDetailView(int seq) {
		dao.updateIndustryStatusViewCount(seq);
		return dao.getIndustryStatusDetailView(seq);
	}

	public int industryStatusModifyConfirm(IndustryStatusDTO dto, String path)throws Exception {
		//1. bamSeq 받아오기
		//int bamSeq = dao.getBambooSeq();
		//dto.setSeq(bamSeq);
		//2. 이미지 저장하고 주소 변환
		String content = imgUpload(path, dto.getSeq(), dto.getContent());
		System.out.println(content);
		dto.setContent(content);
		//3. 글 수정

		return dao.updateIndustryStatus(dto);
	}

	@Transactional("txManager")
	public int industryStatusDeleteConfirm(int seq) {
		dao.deleteIndustryStatusAllCo(seq);
		return dao.deleteIndustryStatus(seq);
	}


	// 페이지네비

	public List<IndustryStatusDTO> industryListByPage(int start, int end) {// 10개씩
		return dao.industryListByPage(start, end);
	}
	public List<String> getIndustryListPageNavi (int currentPage) {
		int recordTotalCount = dao.recordIndustryListTotalCount();
		int pageTotalCount = 0;

		if(recordTotalCount% Configuration.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
		int endNavi = startNavi + (Configuration.naviCountPerPage - 1);

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		if(startNavi == 1) {
			needPrev = false;
		}
		boolean needNext = true;
		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		List<String> pages = new ArrayList<>();
		if(needPrev) pages.add("<li class=\"page-item\"><a class=page-link href='industryStatusList.do?cpage=" + (startNavi - 1) + "'>< </a></li>");

		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<li class=\"page-item\"><a class=page-link href='industryStatusList.do?cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a></li>");
			pages.add(sb.toString());
		}

		if(needNext) pages.add("<li class=\"page-item\"><a class=page-link href='industryStatusList.do?cpage=" + (endNavi + 1) + "'>> </a></li>");

		return pages;
	}
	//업계현황 댓글

	public List<IndustryStatusCoDTO> commentList(int indSeq) {
		System.out.println(indSeq);
		return dao.getCoList(indSeq);
	}

	@Transactional("txManager")
	public String commentWriteConfirm(IndustryStatusCoDTO dto) {
		dao.insertIndustryStatusCo(dto);
		Gson gson = new Gson();
		List<IndustryStatusCoDTO> result = dao.getCoList(dto.getIndSeq());
		return gson.toJson(result);
	}

	@Transactional("txManager")
	public String commentModifyConfirm(IndustryStatusCoDTO dto) {
		dao.updateIndustryStatusCo(dto);
		Gson gson = new Gson();
		List<IndustryStatusCoDTO> result = dao.getCoList(dto.getIndSeq());
		return gson.toJson(result);
	}

	public String commentDeleteConfirm(IndustryStatusCoDTO dto) {
		dao.deleteIndustryStatusCo(dto.getSeq());
		Gson gson = new Gson();
		List<IndustryStatusCoDTO> result = dao.getCoList(dto.getIndSeq());
		return gson.toJson(result);
	}

	public int commentsDeleteConfirm(int indSeq) {
		return dao.deleteIndustryStatusAllCo(indSeq);
	}

	//조건별 게시판목록 검색
	//		public List<BambooDTO> industrySearchListByPage(int start, int end,String value, String search) {//대나무숲 10개씩
	//			System.out.println(dao.industrySearchListByPage(Integer.toString(start), Integer.toString(end),value,search).toString());
	//			return dao.industrySearchListByPage(Integer.toString(start), Integer.toString(end),value,search);
	//		}
	//		public List<String> industrySearchListPageNavi (int currentPage,String value, String search) {
	//			int recordTotalCount = dao.industrySearchTotalCount(value,search);
	//			int pageTotalCount = 0;
	//
	//			if(recordTotalCount% Configuration.recordCountPerPage > 0) {
	//				pageTotalCount = recordTotalCount / Configuration.recordCountPerPage + 1;
	//			}else {
	//				pageTotalCount = recordTotalCount / Configuration.recordCountPerPage;
	//			}
	//
	//			if(currentPage < 1) {
	//				currentPage = 1;
	//			}else if(currentPage > pageTotalCount) {
	//				currentPage = pageTotalCount;
	//			}
	//
	//			int startNavi = (currentPage - 1) / Configuration.naviCountPerPage * Configuration.naviCountPerPage + 1;
	//			int endNavi = startNavi + (Configuration.naviCountPerPage - 1);
	//
	//			if(endNavi > pageTotalCount) {
	//				endNavi = pageTotalCount;
	//			}
	//
	//			boolean needPrev = true;
	//			if(startNavi == 1) {
	//				needPrev = false;
	//			}
	//			boolean needNext = true;
	//			if(endNavi == pageTotalCount) {
	//				needNext = false;
	//			}
	//
	//			List<String> pages = new ArrayList<>();
	//			if(needPrev) pages.add("<li class=\"page-item\"><a class=page-link href='bambooSearch.do?search="+search+"&value="+value+"&cpage=" + (startNavi - 1) + "' >< </a></li>");
	//
	//			for(int i = startNavi; i <= endNavi; i++) {
	//				StringBuilder sb = new StringBuilder();
	//				sb.append("<li class=\"page-item\"><a class=page-link href='bambooSearch.do?search="+search+"&value="+value+"&cpage="+ i +"'>");
	//				sb.append(i + " ");
	//				sb.append("</a></li>");
	//				pages.add(sb.toString());
	//			}
	//
	//			if(needNext) pages.add("<li class=\"page-item\"><a class=page-link href='bambooSearch.do?search="+search+"&value="+value+"&cpage=" + (endNavi + 1) + "'>> </a></li>");
	//
	//			return pages;
	//		}

	//이미지 업로드
	private String imgUpload(String path, int indSeq, String content) throws Exception{
		File imgPath = new File(path + "/industry");
		if(!imgPath.exists()) {
			imgPath.mkdirs();
		}

		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(content);

		while(m.find()) {
			String oriName = m.group(2);
			String sysName = System.currentTimeMillis() + "_" + oriName;

			int need = m.group(1).split(",").length;

			if(need > 1) {
				String imgString = m.group(1).split(",")[1];
				byte[] imgByte = Base64Utils.decodeFromString(imgString);

				FileOutputStream fos = new FileOutputStream(new File(imgPath + "/" + sysName));
				DataOutputStream dos = new DataOutputStream(fos);

				dos.write(imgByte);
				dos.flush();
				dos.close();

				//DB에 이미지 목록 저장하기
				int result = dao.insertImg(indSeq, sysName);
				if(result > 0) {
					content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/industry/"+sysName);
				}
			}
		}
		return content;
	}
	@Transactional("txManager")
	public int writeIndustry(String path, IndustryStatusDTO dto) throws Exception{
		//1. bamSeq 받아오기
		int indSeq = dao.getIndustrySeq();
		dto.setSeq(indSeq);
		//2. 이미지 저장하고 주소 변환
		String content = imgUpload(path, indSeq, dto.getContent());
		System.out.println(content);
		dto.setContent(content);
		//3. 글 업로드
		return dao.insertIndustryStatus(dto);
	}
}
