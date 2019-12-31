package kh.hello.dto;

public class ProjectMyListDTO {
	private int seq;
	private int projectSeq;
	private String id;
	
	public ProjectMyListDTO() {
		super();
	}
	public ProjectMyListDTO(int seq, int projectSeq, String id) {
		super();
		this.seq = seq;
		this.projectSeq = projectSeq;
		this.id = id;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}	
}
