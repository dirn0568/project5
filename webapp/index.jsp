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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		var lastID = 0;
		function submitFunction() {
			console.log("이게실행이되고있긴 한가");
			var chatName = $('#chatName').val();
			var chatContent = $('#chatContent').val();
			$.ajax({
				type:"POST",
				url: "./chatSubvlet",
				data: {
					chatName : chatName,
					chatContent : chatContent
				},
				success: function(result) {
					alert('비밀번호가 맞습니다.');
				}
			});
		}
		
		function chatListFunction(){
			$.ajax({
				type:"POST",
				url: "./chatListServlet",
				data: {},
				success: function(hello) {
					console.log("여기까지오긴하나????222222");
					var parsed = JSON.parse(hello);
					console.log(parsed);
					var result = parsed.result;
					for(var i = 0; i < result.length; i++) {
						addChat(result[i][1].value, result[i][2].value, result[i][3].value);
						lastID = result[i][0].value;
					}
				}
			});
		}
		
		function chatLast() {
			console.log("무한반복 실행중");
			$.ajax({
				type:"POST",
				url: "./chatListServlet",
				data: {
					lastID : lastID
				},
				success: function(hello) {
					console.log("여기까지오긴하나????222222");
					var parsed = JSON.parse(hello);
					console.log(parsed);
					var result = parsed.result;
					for(var i = 0; i < result.length; i++) {
						addChat(result[i][1].value, result[i][2].value, result[i][3].value);
						lastID = result[i][0].value;
					}
				}
			});
		}
		
		function addChat(chatName, chatContent, chatTime) {
			$('#chatList').append('<div class="row">' + 
						'<div class="col-lg-12">' + 
						'<div class="media">' +
						'<div class="media-body">' +
						'<h4 class="media-heading">' +
						chatName +
						'<span class="small pull-right">' +
						chatTime +
						'</span>' +
						'</h4>' +
						'<p>' +
						chatContent +
						'</p>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'<hr>');
		}
	</script>
</head>
<body>
	<div class="chat_wrap">
	    <div class="header">
	        CHAT
	    </div>
	    <div id="chatList" class="chat">
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
    	<input type="text" id="chatName" value="blue">
	    <div class="input-div">
	        <textarea id="chatContent" placeholder="Press Enter for send message."></textarea>
	    </div>
	    <button type="button" onclick="submitFunction();">자바스크립트 button</button>
	    <button type="button" onclick="chatListFunction();">추가</button>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		setInterval(function() {
			chatLast();
		}, 500)
	})
</script>
</script>
</body>
</html>