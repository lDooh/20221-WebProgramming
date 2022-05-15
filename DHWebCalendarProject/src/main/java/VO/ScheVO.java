package VO;

import java.time.LocalDate;

public class ScheVO {
	private String id;
	private String title;
	private LocalDate sDate;
	private LocalDate eDate;
	
	public ScheVO(String id, String title, LocalDate sDate, LocalDate eDate) {
		this.id = id;
		this.title = title;
		this.sDate = sDate;
		this.eDate = eDate;
	}

	public static void main(String[] args) {

	}
}