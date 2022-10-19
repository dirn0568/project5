<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="chat.chatDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="chat" class="chat.chat" scope="page" />
<jsp:setProperty name="chat" property="chatName" /> 
<jsp:setProperty name="chat" property="chatContent" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		chatDAO chatsubmit = new chatDAO();
		int result = chatsubmit.chatSubmit(chat.getChatName(), chat.getChatContent());
		if ( result == 1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 맞습니다.')");
			script.println("location.href = 'test.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>