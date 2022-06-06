package DTO;

public class ScheDTO {
	private String id;
	private int scheduleID;
	private String title;
	private String scheduleDate;		// yyyymmss 8자리 형식으로 저장
	private String content;
	
	public ScheDTO(String id, int scheduleID, String title, String scheduleDate, String content) {
		this.id = id;
		this.scheduleID = scheduleID;
		this.title = title;
		if (scheduleDate.length() == 10)
		{
			String[] str = scheduleDate.split("-");
			this.scheduleDate = str[0] + str[1] + str[2];
		}
		else
			this.scheduleDate = scheduleDate;
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public int getScheduleID() {
		return scheduleID;
	}

	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getScheduleDate() {
		return scheduleDate;
	}
	
	public void setScheduleDate(String scheduleDate) {
		if (scheduleDate.length() == 10)
		{
			String[] str = scheduleDate.split("-");
			this.scheduleDate = str[0] + str[1] + str[2];
		}
		else
			this.scheduleDate = scheduleDate;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
}