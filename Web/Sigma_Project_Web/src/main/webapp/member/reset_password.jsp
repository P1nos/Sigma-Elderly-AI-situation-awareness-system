<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*, java.util.*, com.test.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<%
	String id = (String) session.getAttribute("pw_checkId");
	String resetPW1 = request.getParameter("resetPW1");
	String resetPW2 = request.getParameter("resetPW2");
	memberDAO member = new memberDAO(); // 객체 생성
	
	if(!resetPW1.equals(resetPW2)) {
		
%>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
</script>
<%
	} else {
		member.update_password(id, resetPW1);
%>

<script>
	alert("비밀번호 변경에 성공하였습니다.");
	window.location.href = '../login.html';
</script>
<%
	session.removeAttribute(id);
	}
%>

<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>

</body>
</html>