package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.ItnewsCoDTO;
import kh.hello.dto.ItnewsDTO;

@Repository
public class ItnewsDAO {
	
	@Autowired 
	private SqlSessionTemplate jdbc;
	
	public List<ItnewsDTO> getItnewsList(){
		return jdbc.selectList("Itnews.getList");
	}
	
	public ItnewsDTO getItnewsDTO(int seq){
		return jdbc.selectOne("Itnews.getDTO", seq);
	}
	
	public String getPageNavi(int cpage){
		return "";
	}
	
	public List<ItnewsDTO> selectByPage(int start, int end){
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Itnews.selectByPage", param);
	}

	public int getItnewsTotal(){
		return jdbc.selectOne("Itnews.getTotal");
	}
	
	public int getItnewsSeq() {
		return jdbc.selectOne("Itnews.getItnewsSeq");
	}
	
	public int writeItnews(ItnewsDTO dto) {
		return jdbc.insert("Itnews.writeItnews", dto);
	}
	
	public int removeItnews(int seq) {
		return jdbc.delete("Itnews.remove", seq);
	}
	
	public int coWrite(ItnewsCoDTO dto) {
		return jdbc.insert("Itnews.insertComment", dto);
	}
	
	public List<ItnewsCoDTO> commentList(int seq){
		return jdbc.selectList("Itnews.coList", seq);
	}
	
	public int removeItnewsCo(int itSeq, int seq) {
		Map<String, Integer> param = new HashMap<>(); 
		param.put("itSeq", itSeq);
		param.put("seq", seq);
		return jdbc.delete("Itnews.coRemove", param);
	}
	
}
