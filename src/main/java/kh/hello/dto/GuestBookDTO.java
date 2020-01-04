package kh.hello.dto;

import java.sql.Timestamp;

public class GuestBookDTO {
	private int seq;
	private String owner;
	private String writer;
	private String content;
	private Timestamp writeDate;
	public GuestBookDTO() {
		super();
	}
	public GuestBookDTO(int seq, String owner, String writer, String content, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.owner = owner;
		this.writer = writer;
		this.content = content;
		this.writeDate = writeDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
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
	
}