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
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kh.hello.configuration.Configuration;
import kh.hello.dao.BambooDAO;
import kh.hello.dto.BambooCoDTO;
import kh.hello.dto.BambooDTO;
import kh.hello.dto.ProjectCoDTO;

@Service
public class BambooService {
	@Autowired
	private BambooDAO dao;

	//대나무숲 게시판 글


	@Transactional("txManager")
	public BambooDTO bambooDetailView(int seq) {
		dao.updateBambooViewCount(seq);
		return dao.getBambooDetailView(seq);
	}


	public int bambooModifyConfirm(BambooDTO dto, String path)throws Exception {
		
		//1. bamSeq 받아오기
				//int bamSeq = dao.getBambooSeq();
				//dto.setSeq(bamSeq);
				//2. 이미지 저장하고 주소 변환
				String content = imgUpload(path, dto.getSeq(), dto.getContent());
				System.out.println(content);
				dto.setContent(content);
				//3. 글 수정
				
		
		
		
		return dao.updateBamboo(dto);
	}

	@Transactional("txManager")
	public int bambooDeleteConfirm(int seq) {
		dao.deleteBambooAllCo(seq);
		return dao.deleteBamboo(seq);
	}


	//대나무숲 페이지네비

	public List<BambooDTO> bambooListByPage(int start, int end) {//대나무숲 10개씩
		return dao.bambooListByPage(start, end);
	}
	public List<String> getBambooListPageNavi (int currentPage) {
		int recordTotalCount = dao.recordBambooListTotalCount();
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
		if(needPrev) pages.add("<li class=\"page-item\"><a class=page-link href='bambooList.do?cpage=" + (startNavi - 1) + "'>< </a></li>");

		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<li class=\"page-item\"><a class=page-link href='bambooList.do?cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a></li>");
			pages.add(sb.toString());
		}

		if(needNext) pages.add("<li class=\"page-item\"><a class=page-link href='bambooList.do?cpage=" + (endNavi + 1) + "'>> </a></li>");

		return pages;
	}

	//대나무숲 댓글

	public List<BambooCoDTO> commentList(int bamSeq) {
		return dao.getCoList(bamSeq);
	}

	@Transactional("txManager")
	public String commentWriteConfirm(BambooCoDTO dto) {
		dao.insertBambooCo(dto);
		Gson gson = new Gson();
		List<BambooCoDTO> result = dao.getCoList(dto.getBamSeq());
		
		return gson.toJson(result);
//		BambooCoDTO comment = dao.getComment(dto.getBamSeq());
//		JsonObject jobj = new JsonObject();
//		jobj.addProperty("seq", comment.getSeq());
//		jobj.addProperty("bamSeq", comment.getBamSeq());
//		jobj.addProperty("writer", comment.getWriter());
//		jobj.addProperty("content", comment.getContent());
//		jobj.addProperty("writeDate", comment.getWriteDate().toString());
//
//		return jobj.toString();
	}

	@Transactional("txManager")
	public String commentModifyConfirm(BambooCoDTO dto) {
		dao.updateBambooCo(dto);
		Gson gson = new Gson();
		List<BambooCoDTO> result = dao.getCoList(dto.getBamSeq());
		
		return gson.toJson(result);
//		return array.toString();
//		System.out.println(dto.getBamSeq());
//		BambooCoDTO comment = dao.getComment(dto.getBamSeq());
//		System.out.println("서비스"+comment.getContent());
//		JsonObject jobj = new JsonObject();
//		jobj.addProperty("seq", comment.getSeq());
//		jobj.addProperty("bamSeq", comment.getBamSeq());
//		jobj.addProperty("writer", comment.getWriter());
//		jobj.addProperty("content", comment.getContent());
//		jobj.addProperty("writeDate", comment.getWriteDate().toString());
//
//		return jobj.toString();
	}

	public String commentDeleteConfirm(BambooCoDTO dto) {
		dao.deleteBambooCo(dto);
		Gson gson = new Gson();
		List<BambooCoDTO> result = dao.getCoList(dto.getBamSeq());
		
		return gson.toJson(result);
	}

	public int commentsDeleteConfirm(int bamSeq) {
		return dao.deleteBambooAllCo(bamSeq);
	}

	//조건별 게시판목록 검색
	public List<BambooDTO> bambooSearchListByPage(int start, int end,String value, String search) {//대나무숲 10개씩
		System.out.println(dao.bambooSearchListByPage(Integer.toString(start), Integer.toString(end),value,search).toString());
		return dao.bambooSearchListByPage(Integer.toString(start), Integer.toString(end),value,search);
	}
	public List<String> getBambooSearchListPageNavi (int currentPage,String value, String search) {
		int recordTotalCount = dao.bambooSearchTotalCount(value,search);
		System.out.println("서비스에서"+recordTotalCount);
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
		if(needPrev) pages.add("<li class=\"page-item\"><a class=page-link href='bambooSearch.do?search="+search+"&value="+value+"&cpage=" + (startNavi - 1) + "' >< </a></li>");

		for(int i = startNavi; i <= endNavi; i++) {
			StringBuilder sb = new StringBuilder();
			sb.append("<li class=\"page-item\"><a class=page-link href='bambooSearch.do?search="+search+"&value="+value+"&cpage="+ i +"'>");
			sb.append(i + " ");
			sb.append("</a></li>");
			pages.add(sb.toString());
		}

		if(needNext) pages.add("<li class=\"page-item\"><a class=page-link href='bambooSearch.do?search="+search+"&value="+value+"&cpage=" + (endNavi + 1) + "'>> </a></li>");

		return pages;
	}

	//이미지 업로드
	private String imgUpload(String path, int bamSeq, String content) throws Exception{
		File imgPath = new File(path + "/bamboo");
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
				int result = dao.insertImg(bamSeq, sysName);
				if(result > 0) {
					content = content.replaceFirst(Pattern.quote(m.group(1)), "/attached/bamboo/"+sysName);
				}
			}
		}
		return content;
	}
	@Transactional("txManager")
	public int writeBamboo(String path, BambooDTO dto) throws Exception{
		//1. bamSeq 받아오기
		int bamSeq = dao.getBambooSeq();
		dto.setSeq(bamSeq);
		//2. 이미지 저장하고 주소 변환
		String content = imgUpload(path, bamSeq, dto.getContent());
		System.out.println(content);
		dto.setContent(content);
		//3. 글 업로드
		return dao.insertBamboo(dto);
	}
}
