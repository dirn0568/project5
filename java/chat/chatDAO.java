package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class chatDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public chatDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/chatanonymous";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<chat> chatList() {
		ArrayList<chat> chatdata = null;
		String SQL = "select * from chat";
		try {
			chatdata = new ArrayList<chat>();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				chat chat = new chat();
				chat.setChatID(rs.getInt("chatID"));
				chat.setChatName(rs.getString("chatname"));
				chat.setChatContent(rs.getString("chatcontent"));
				chat.setChatTime(rs.getString("chattime"));
				chatdata.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} return chatdata;
	}
	
	public ArrayList<chat> chatLastList(int lastChatID) {
		ArrayList<chat> chatdata = null;
		String SQL = "select * from chat where chatID > ?";
		try {
			chatdata = new ArrayList<chat>();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, lastChatID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				chat chat = new chat();
				chat.setChatID(rs.getInt("chatID"));
				chat.setChatName(rs.getString("chatname"));
				chat.setChatContent(rs.getString("chatcontent"));
				chat.setChatTime(rs.getString("chattime"));
				chatdata.add(chat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} return chatdata;
	}
	
	public int chatSubmit(String chatName, String chatContent) {
		String SQL = "INSERT INTO chat values(?, ?, ?, now())";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, 13);
			pstmt.setString(2, chatName);
			pstmt.setString(3, chatContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} return -1;
	}
}
