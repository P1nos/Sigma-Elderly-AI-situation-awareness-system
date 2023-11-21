<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*, java.util.*, com.test.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<%
	// login.html id, password 입력한거 받아오기
	// form 태크 입력해서 불러와야됨
	String id = request.getParameter("pw_checkId");
	
	memberDAO member = new memberDAO(); // 객체 생성
	int check = member.select_id(id);
	
	System.out.println("check : "+check);
	
	if(check == 1){
		session.setAttribute("pw_checkId", id);
%>
<script>
	alert("아이디가 일치합니다. 비밀번호 변경 사이트로 이동합니다");
	window.location.href = '../reset_password.html';
	//window.location.href = '../test.jsp'
</script>
<%
	}else{
%>
<script>
alert("회원이 일치하지 않습니다.");
history.back();
</script>
<%
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