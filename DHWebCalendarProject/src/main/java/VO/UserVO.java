package VO;

import java.time.LocalDate;

public class UserVO {
	private String id;
	private String password;
	private String nickname;
	private LocalDate bdLD;
	private char gender;
	private String callNum;
	
	public UserVO(String id, String password, String nickname, LocalDate bdLD, char gender, String callNum) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.bdLD = bdLD;
		this.gender = gender;
		this.callNum = callNum;
	}
	
	public static void main(String[] args) {
		
	}
}