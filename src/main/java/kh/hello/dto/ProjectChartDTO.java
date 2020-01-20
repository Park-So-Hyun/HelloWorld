package kh.hello.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ProjectChartDTO {
	private int seq;
	private String title;
	private String location1;
	private String location2;
	private int capacity;
	private Date startDate;
	private Date endDate;
	private String languages;
	private String writer;
	private String id;
	private Timestamp writeDate;
	private String state;
	private int scrap;
	private Timestamp changeDate;
	private long width;
	private long distance;
	
	public ProjectChartDTO() {
		super();
	}
	public ProjectChartDTO(int seq, String title, String location1, String location2, int capacity, Date startDate,
			Date endDate, String languages, String writer, String id, Timestamp writeDate, String state, int scrap,
			Timestamp changeDate, long width, long distance) {
		super();
		this.seq = seq;
		this.title = title;
		this.location1 = location1;
		this.location2 = location2;
		this.capacity = capacity;
		this.startDate = startDate;
		this.endDate = endDate;
		this.languages = languages;
		this.writer = writer;
		this.id = id;
		this.writeDate = writeDate;
		this.state = state;
		this.scrap = scrap;
		this.changeDate = changeDate;
		this.width = width;
		this.distance = distance;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getScrap() {
		return scrap;
	}
	public void setScrap(int scrap) {
		this.scrap = scrap;
	}
	public Timestamp getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Timestamp changeDate) {
		this.changeDate = changeDate;
	}
	public long getWidth() {
		return width;
	}
	public void setWidth(long width) {
		this.width = width;
	}
	public long getDistance() {
		return distance;
	}
	public void setDistance(long distance) {
		this.distance = distance;
	}
	
	
	public String getStateInKor() {
		String state = this.state;
		if(state.contentEquals("N")) {
			state = "모집중";
		}else if(state.contentEquals("Y")) {
			state = "마감";
		}
		return state;
	}
	public String getFormedAllDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		return sdf.format(this.startDate)+" ~ "+sdf.format(this.endDate);
	}	
}
