package kh.hello.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hello.dto.CodeCommentsDTO;
import kh.hello.dto.CodeQuestionDTO;
import kh.hello.dto.CodeReplyDTO;
import kh.hello.dto.MemberDTO;

@Repository
public class CodeDAO {

	@Autowired
	private SqlSessionTemplate jdbc;
	
	//글쓰기
	public int insert(CodeQuestionDTO dto) {
		return jdbc.insert("Code.insert",dto);
	}
	
	//게시판전체(답글수)
//	public List<CodeQuestionDTO> selectAll() throws Exception{
//		return jdbc.selectList("Code.selectAll");
//	}
	
	//게시판전체(페이징)
	public List<CodeQuestionDTO> selectQuestionAll(int start,int end) {
		Map<String, Integer> param = new HashMap<>();
		param.put("start", start);
		param.put("end", end);
		return jdbc.selectList("Code.selectQuestionAll",param);
	}
	
	public int codeQuestionCount() {//총 게시글 수
		return jdbc.selectOne("Code.codeQuestionCount");
	}

	//가장 최신 글 번호 찾기
	public int selectSeq(String writer) {
		return jdbc.selectOne("Code.selectSeq",writer);
	}
	
	//디테일
	public CodeQuestionDTO detailQuestion(int seq) {
		return jdbc.selectOne("Code.detailQuestion",seq);
	}
	
	//조회수 증가
	public int incrementViewCount(int seq) {
		return jdbc.update("Code.incrementViewCount",seq);
	}
	
	//게시판 삭제
	public int delete(int seq) {
		return jdbc.delete("Code.delete",seq);
	}
	
	public void modify(CodeQuestionDTO dto) {
		jdbc.update("Code.modify", dto);
	}
	
	//포인트
	public void writePoint(String id) {
		jdbc.update("Code.writePoint", id);
	}
	
	public void deleteWritePoint(String id) {
		jdbc.update("Code.deleteWritePoint", id);
	}
	
	//답글 ( CodeReply ) 
	public int insertR(CodeReplyDTO dto) {
		return jdbc.insert("CodeR.insert",dto);
	}
	
	public List<CodeReplyDTO> selectReplyAll() {
		return jdbc.selectList("CodeR.selectReplyAll");
	}
	
	public List<CodeReplyDTO> detailReply(int queSeq) {
		return jdbc.selectList("CodeR.detailReply",queSeq);
	}
	
	public int deleteR(int seq) {
		return jdbc.delete("CodeR.deleteR",seq);
	}
	
	public int replyOneCount(int queSeq,String writer) {
		Map<String,Object> map = new HashMap<>();
		map.put("queSeq", queSeq);
		map.put("writer", writer);
		return jdbc.selectOne("CodeR.replyOneCount",map);
	}
	
	public CodeReplyDTO selectOneDetail(int seq) {
		return jdbc.selectOne("CodeR.selectOneDetail",seq);
	}
	
	public void modifyR(CodeReplyDTO dto) {
		jdbc.update("CodeR.modifyR", dto);
	}
	
	//CodeComment

	public int insertComment(CodeCommentsDTO dto) {
		return jdbc.insert("CodeC.insertComment", dto);
	}
	public List<CodeCommentsDTO> commentsList(int repSeq){
		return jdbc.selectList("CodeC.commentsList", repSeq);
	}
	public int updateComment(CodeCommentsDTO dto) {
		return jdbc.update("CodeC.updateComment", dto);
	}	
	public int deleteComment(int seq) {
		return jdbc.delete("CodeC.deleteComment", seq);
	}
	
}
