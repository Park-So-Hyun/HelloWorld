package kh.hello.dto;

public class ChartWorkDTO {
	private String memLevel;
	private int levelCount;
	public ChartWorkDTO() {
		super();
	}
	public ChartWorkDTO(String memLevel, int levelCount) {
		super();
		this.memLevel = memLevel;
		this.levelCount = levelCount;
	}
	public String getMemLevel() {
		return memLevel;
	}
	public void setMemLevel(String memLevel) {
		this.memLevel = memLevel;
	}

	public int getLevelCount() {
		return levelCount;
	}
	public void setLevelCount(int levelCount) {
		this.levelCount = levelCount;
	}
	
	
}
