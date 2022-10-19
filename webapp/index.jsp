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
<link rel="stylesheet" href="css/custom.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script type="text/javascript">
	function submitChat(){
		alert('자바스크립트 button를 클릭하셨습니다.');
	}
</script>
<body>
	<div class="chat_wrap">
	    <div class="header">
	        CHAT
	    </div>
	    <div class="chat">
	        <ul>
	        	<li class="left">
			            <% 
							chatDAO chat = new chatDAO();
							ArrayList<chat> chat_array = chat.chatList();
							for (int i = 0; i < chat_array.size(); i++) {
						%>
							<div class="sender">
								<span><%= chat_array.get(i).getChatName() %></span>
								<span><%= chat_array.get(i).getChatContent()%></span>
							</div>
						<%
							}
						%>
				</li>
	        </ul>
	    </div>
	    <form method="post" action="submitChat.jsp">
	    	<input type="text" name="chatName" value="blue">
		    <div class="input-div">
		        <textarea name="chatContent" placeholder="Press Enter for send message."></textarea>
		    </div>
		 	
		    <!-- format -->
		 	
		    <div class="chat format">
		        <ul>
		            <li>
		                <div class="sender">
		                    <span></span>
		                </div>
		                <div class="message">
		                    <span></span>
		                </div>
		            </li>
		        </ul>
		    </div>
		    <input type="submit" onclick="submitChat()">자바스크립트 button</submit>
	    </from>
	</div>
</body>
</html>