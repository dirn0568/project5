package chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기까지오긴하냐333333");
		request.setCharacterEncoding("UTF-8");
		String lastID = request.getParameter("lastID");
		response.setContentType("text/html;charset=UTF-8");
		if (lastID == null || lastID.equals("")) {
			response.getWriter().write(doList());
		} else {
			response.getWriter().write(lastChat(lastID));
		}
	}
	
	public String doList() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		chatDAO chatDAO = new chatDAO();
		ArrayList<chat> chatList = chatDAO.chatList();
		System.out.println("여여여여여어어어어기느는느느느느요????");
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if (i != chatList.size() - 1) result.append(",");
		}
		result.append("]}");
		return result.toString();
	}
	
	public String lastChat(String lastID) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		chatDAO chatDAO = new chatDAO();
		int lastChatID = Integer.parseInt(lastID);
		ArrayList<chat> chatList = chatDAO.chatLastList(lastChatID);
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if (i != chatList.size() - 1) result.append(",");
		}
		result.append("]}");
		return result.toString();
	}

}
