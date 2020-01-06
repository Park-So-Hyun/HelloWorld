package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CodeQuestionDTO {
	private int seq;
	private String division;
	private String title;
	private String content;
	private String writer;
	private int point;
	private int viewCount;
	private Timestamp writeDate;
	private int replyCount;
	
	public CodeQuestionDTO() {
		super();
	}

	public CodeQuestionDTO(int seq, String division, String title, String content, String writer, int point,
			int viewCount, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.division = division;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.point = point;
		this.viewCount = viewCount;
		this.writeDate = writeDate;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getFormedDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		return sdf.format(writeDate);
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int repCount) {
		this.replyCount = repCount;
	}
}
