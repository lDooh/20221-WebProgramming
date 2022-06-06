package DTO;

import java.time.LocalDate;

public class UserDTO {
	private String id;
	private String password;
	private String nickname;
	private String bd;		// yyyymmdd 8자리 형식으로 저장
	private String gender;
	private String callNum;
	private boolean manager = false;
	
	public UserDTO(String id, String password, String nickname, String bd, String gender, String callNum) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		if (bd.length() == 10)
		{
			String[] str = bd.split("-");
			this.bd = str[0] + str[1] + str[2];
		}
		else
			this.bd = bd;
		this.gender = gender;
		this.callNum = callNum;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getbd() {
		return bd;
	}
	
	public void setbd(String bd) {
		this.bd = bd;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getCallNum() {
		return callNum;
	}
	
	public void setCallNum(String callNum) {
		this.callNum = callNum;
	}
	
	public boolean getManager() {
		return manager;
	}
	
	public void setManager(boolean manager) {
		this.manager = manager;
	}
}
