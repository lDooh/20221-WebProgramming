package DAO;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import DTO.UserDTO;
import java.sql.*;

public class UserDAO {
	// 싱글톤 패턴
	private static UserDAO instance;
	
	private static String driverName;
	private static String url;
	private static String userName;
	private static String password;
	
	private static Connection connection = null;
	private static PreparedStatement statement = null;
	private static ResultSet resultSet = null;
	
	// 객체 생성을 막기 위해 생성자 private
	private UserDAO() {
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
	
	public static UserDAO getInstance() {
		if (instance == null)
			instance = new UserDAO();
		
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
	
	public boolean signUp(UserDTO userDTO) {
		String sql = "INSERT INTO userinfo VALUES (?, ?, ?, ?, ?, ?, DEFAULT)";
		int count = 0;
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, userDTO.getId());
			statement.setString(2, userDTO.getPassword());
			statement.setString(3, userDTO.getNickname());
			statement.setString(4, userDTO.getbd());
			statement.setString(5, userDTO.getGender());
			statement.setString(6, userDTO.getCallNum());
			
			count = statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("회원가입 SQL 오류");
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		if (count == 1)
		{
			//System.out.println("회원 가입 성공");
			return true;
		}
		
		return false;
	}
	
	// -2: SQL 오류, -1: ID 없음, 0: 비밀번호 틀림, 1: 로그인 성공
	public int signIn(String id, String password) {
		String sql = "SELECT password FROM userinfo WHERE id = '" + id + "'";
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			
			if (resultSet.next())
			{
				if (resultSet.getString("password").equals(password))
					return 1;
				else
					return 0;
			}
			else
			{
				//System.out.println("없는 ID");
				return -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		return -2;
	}
	
	public UserDTO[] getUsers() {
		String sql = "SELECT * FROM userinfo";
		UserDTO[] userDTO = null;
		
		connect();
		
		try {
			statement = connection.prepareStatement("SELECT count(id) FROM userinfo;");
			resultSet = statement.executeQuery("SELECT count(id) FROM userinfo;");
			resultSet.next();
			int rows = Integer.parseInt(resultSet.getString("count(id)"));
			userDTO = new UserDTO[rows];
			
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			
			UserDTO tmpUserDTO = null;
			resultSet.next();
			for (int i = 0; i < rows; i++)
			{				
				tmpUserDTO = new UserDTO(resultSet.getString("id"),
										resultSet.getString("password"),
										resultSet.getString("nickname"),
										resultSet.getString("birthday"),
										resultSet.getString("gender"),
										resultSet.getString("callNum"));
				tmpUserDTO.setManager(resultSet.getBoolean("manager"));
				userDTO[i] = tmpUserDTO;
				resultSet.next();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return userDTO;
	}
	
	public UserDTO getUserDTO(String id) {
		UserDTO userDTO;
		String sql = "SELECT * FROM userinfo WHERE id = '" + id + "'";
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			
			resultSet.next();
			userDTO = new UserDTO(resultSet.getString("id"),
					resultSet.getString("password"),
					resultSet.getString("nickname"),
					resultSet.getString("birthday"),
					resultSet.getString("gender"),
					resultSet.getString("callNum"));
			userDTO.setManager(resultSet.getBoolean("manager"));
			
			return userDTO;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return null;
	}
	
	public UserDTO[] getUsersByNick(String nick) {
		String sql = "SELECT * FROM userinfo WHERE id LIKE '%" + nick + "%';";
		UserDTO[] userDTO = null;
		
		connect();
		
		try {
			statement = connection.prepareStatement("SELECT count(id) FROM userinfo WHERE id LIKE '%" + nick + "%';");
			resultSet = statement.executeQuery("SELECT count(id) FROM userinfo WHERE id LIKE '%" + nick + "%';");
			resultSet.next();
			int rows = Integer.parseInt(resultSet.getString("count(id)"));
			userDTO = new UserDTO[rows];
			
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			
			UserDTO tmpUserDTO = null;
			resultSet.next();
			for (int i = 0; i < rows; i++)
			{
				System.out.println(i);
				tmpUserDTO = new UserDTO(resultSet.getString("id"),
										resultSet.getString("password"),
										resultSet.getString("nickname"),
										resultSet.getString("birthday"),
										resultSet.getString("gender"),
										resultSet.getString("callNum"));
				tmpUserDTO.setManager(resultSet.getBoolean("manager"));
				userDTO[i] = tmpUserDTO;
				resultSet.next();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			connectionClose();
		}
		
		return userDTO;
	}
	
	public void modifyUser(UserDTO userDTO) {
		String sql = "UPDATE userinfo SET password = ?, nickname = ?, birthday = ?, manager = ? WHERE id = ?";
		
		connect();

		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, userDTO.getPassword());
			statement.setString(2, userDTO.getNickname());
			statement.setString(3, userDTO.getbd());
			statement.setBoolean(4, userDTO.getManager());
			statement.setString(5, userDTO.getId());
			
			statement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}
	
	public void deleteUser(String id) {
		String sql = "DELETE FROM userinfo WHERE id = ?";
		
		connect();
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1,  id);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectionClose();
		}
	}

	public static void main(String[] args) {
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.connect();
		userDAO.connectionClose();
		
		System.out.println("driverName: " + driverName
				+ "\nurl: " + url
				+ "\nuserName: " + userName
				+ "\npassword: " + password);
	}
}