package DTO;

import java.time.LocalDate;

public class UserDTO {
	private String id;
	private String password;
	private String nickname;
	private String bd;
	private String gender;
	private String callNum;
	private boolean manager = false;
	
	public UserDTO(String id, String password, String nickname, String bd, String gender, String callNum) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
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
		String[] str = bd.split("-");
		/*LocalDate ld = LocalDate.of(Integer.parseInt(str[0])
				, Integer.parseInt(str[1]), Integer.parseInt(str[2]));*/
		// TODO: 하이픈 포함으로 반환, UserDAO도 같이 수정
		return str[0] + str[1] + str[2];
		
		/*LocalDate ld = LocalDate.of(Integer.parseInt(bd.substring(0, 4)),
				Integer.parseInt(bd.substring(4, 6)),
				Integer.parseInt(bd.substring(6, 8)));*/
		
		//return ld.toString();
		//return bd;
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
