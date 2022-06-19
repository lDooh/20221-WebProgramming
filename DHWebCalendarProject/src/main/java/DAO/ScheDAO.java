package DAO;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import DTO.ScheDTO;
import DTO.UserDTO;

import java.sql.*;

public class ScheDAO {
	// 싱글톤 패턴
	private static ScheDAO instance;
	
	private static String driverName;
	private static String url;
	private static String userName;
	private static String password;
	
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet resultSet = null;
	
	// 객체 생성을 막기 위해 생성자 private
	private ScheDAO() {
		String path = System.getProperty("user.dir") + "/local.properties";
		// System.out.println(path);
		
		Properties prop = new Properties();
		
		try {
			FileInputStream stream = new FileInputStream(path);
			prop.load(new BufferedInputStream(stream));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		driverName = prop.getProperty("drivername");
		url = prop.getProperty("url");
		userName = prop.getProperty("username");
		password = prop.getProperty("password");
	}
	
	public static ScheDAO getInstance() {
		if (instance == null)
			instance = new ScheDAO();
		
		return instance;
	}
	
	private void connect() {
		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			System.out.println("connect  sql 에러");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("connect  class 에러");
			e.printStackTrace();
		}
	}
	
	private void connectionClose() {
		try {
			if (resultSet != null)
				resultSet.close();
			if (statement != null)
				statement.close();
			if (connection != null)
				connection.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// max scheduleID 반환
	public int getScheduleNumber(String id) {
		String sql = "SELECT MAX(scheduleID) FROM schedule WHERE id = ?";
		
		connect();
		String max = null;
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			resultSet = statement.executeQuery();
			
			if (resultSet.next())
			{
				max = resultSet.getString("max(scheduleID)");
				if (max == null || max.equals("NULL") || max.equals("null"))
					max = "0";
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return Integer.parseInt(max);
	}
	
	// 일정 등록
	public boolean addSchedule(ScheDTO scheDTO) {
		String sql = "INSERT INTO schedule VALUES (?, ?, ?, ?, ?)";
		int count = 0;
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1,  scheDTO.getId());
			statement.setInt(2,  scheDTO.getScheduleID());
			statement.setString(3,  scheDTO.getTitle());
			statement.setString(4,  scheDTO.getScheduleDate());
			statement.setString(5,  scheDTO.getContent());
			
			count = statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("일정등록 SQL 오류");
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		if (count == 1)
		{
			//System.out.println("일정 등록 성공");
			return true;
		}
		
		return false;
	}
	
	// 일정 반환
	public ScheDTO getScheduleDTO(String id, String scheduleID) {
		String sql = "SELECT * FROM schedule WHERE ID = ? AND scheduleID = ?";
		ScheDTO scheDTO = null;
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			statement.setString(2, scheduleID);
			resultSet = statement.executeQuery();
			resultSet.next();
			
			scheDTO = new ScheDTO(resultSet.getString("ID"),
					resultSet.getInt("scheduleID"),
					resultSet.getString("title"),
					resultSet.getString("scheduleDate"),
					resultSet.getString("content"));
			
			return scheDTO;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return scheDTO;
	}
	
	// 일정 목록 반환
	public ScheDTO[] getSchedule(String id) {
		String sql = "SELECT * FROM schedule WHERE ID = ? ORDER BY scheduleDate";
		ScheDTO[] scheDTO = null;
		
		connect();
		
		try {
			statement = connection.prepareStatement("SELECT count(scheduleID) FROM schedule WHERE ID = ?");
			statement.setString(1, id);
			resultSet = statement.executeQuery();
			resultSet.next();
			int rows = Integer.parseInt(resultSet.getString("count(scheduleID)"));
			scheDTO = new ScheDTO[rows];
			
			statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			resultSet = statement.executeQuery();
			
			ScheDTO tmpscheDTO = null;
			resultSet.next();
			for (int i = 0; i < rows; i++)
			{				
				tmpscheDTO = new ScheDTO(resultSet.getString("ID"),
										resultSet.getInt("scheduleID"),
										resultSet.getString("title"),
										resultSet.getString("scheduleDate"),
										resultSet.getString("content"));
				scheDTO[i] = tmpscheDTO;
				resultSet.next();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return scheDTO;
	}
	
	// 일정 수정
	public int modifySche(ScheDTO scheDTO) {
		String sql = "UPDATE schedule SET title = ?, scheduleDate = ?, content = ? WHERE id = ? AND scheduleID = ?";
		int count = 0;
		connect();

		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, scheDTO.getTitle());
			statement.setString(2, scheDTO.getScheduleDate());
			statement.setString(3, scheDTO.getContent());
			statement.setString(4, scheDTO.getId());
			statement.setInt(5, scheDTO.getScheduleID());
			
			count = statement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return count;
	}
	
	// 일정 삭제
	public int deleteSche(String id, String scheduleID) {
		String sql = "DELETE FROM schedule WHERE id = ? AND scheduleID = ?";
		int count = 0;
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, id);
			statement.setString(2, scheduleID);
			count = statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return count;
	}

	public static void main(String[] args) {
		ScheDAO scheDAO = ScheDAO.getInstance();
		scheDAO.connect();
		scheDAO.connectionClose();
		
		System.out.println("driverName: " + driverName
				+ "\nurl: " + url
				+ "\nuserName: " + userName
				+ "\npassword: " + password);
	}
}