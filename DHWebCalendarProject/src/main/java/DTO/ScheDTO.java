package DTO;

import java.time.LocalDate;

public class ScheDTO {
	private String id;
	private String title;
	private LocalDate sDate;
	private LocalDate eDate;
	
	public ScheDTO(String id, String title, LocalDate sDate, LocalDate eDate) {
		this.id = id;
		this.title = title;
		this.sDate = sDate;
		this.eDate = eDate;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public LocalDate getSDate() {
		return sDate;
	}
	
	public void setSDate(LocalDate sDate) {
		this.sDate = sDate;
	}
	
	public LocalDate getEDate() {
		return eDate;
	}
	
	public void setEDate(LocalDate eDate) {
		this.eDate = eDate;
	}
}