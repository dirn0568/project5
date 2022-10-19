<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="chat.chatDAO" %>
<%@ page import="chat.chat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		chatDAO chat = new chatDAO();
		ArrayList<chat> chat_array = chat.chatList();
		for (int i = 0; i < chat_array.size(); i++) {
	%>
		<tr>
			<td><%= chat_array.get(i).getChatID() %></td>
			<td><%= chat_array.get(i).getChatName() %></td>
			<td><%= chat_array.get(i).getChatContent()%></td>
			<td><%= chat_array.get(i).getChatTime()%></td>
		</tr>
		<p></p>
	<%
		}
	%>
</body>
</html>