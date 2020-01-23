package kh.hello.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class IndustryStatusCoDTO {
	private int seq;
	private int indSeq;
	private String writer;
	private String content;
	private Timestamp writeDate;
	private String id;
	private String profileImg;
	private String formedWriteDate;
	private String modComment;
	
	public String getModComment() {
		this.modComment = this.content.replaceAll("\"","modF'Fdom");
		return this.modComment;
	}

	public void setModComment(String comment) {
		this.modComment = getModComment();
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getFormedWriteDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		this.formedWriteDate = sdf.format(this.writeDate);
		return this.formedWriteDate;
	}

	public void setFormedWriteDate(String formedWriteDate) {
		this.formedWriteDate = getFormedWriteDate();
	}

	public IndustryStatusCoDTO() {
		super();
	}

	public IndustryStatusCoDTO(int seq, int indSeq, String writer, String content, Timestamp writeDate, String id) {
		super();
		this.seq = seq;
		this.indSeq = indSeq;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
		this.id = id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getIndSeq() {
		return indSeq;
	}

	public void setIndSeq(int indSeq) {
		this.indSeq = indSeq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFormedWriteDateForAdmin() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String result = sdf.format(this.writeDate);
		return result;
	}
	
}
