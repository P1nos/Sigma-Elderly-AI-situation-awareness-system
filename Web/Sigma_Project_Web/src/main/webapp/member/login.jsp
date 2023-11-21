<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.sql.*, java.util.*, com.test.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

%>

<%
	// login.html id, password 입력한거 받아오기
	// form 태크 입력해서 불러와야됨
	String id = request.getParameter("inputId");
	String password = request.getParameter("inputPassword");
	
	System.out.println("id : "+id + " pwd : "+password);
	// memberDAO 에서 id, password 검사하는거 연결시키기
	
	memberDAO member = new memberDAO(); // 객체 생성
	int check = member.select_user(id, password);
	
	System.out.println("check : "+check);
	
	if(check == 1){
        session.setAttribute("userId", id); // 사용자 ID를 세션에 저장
        session.setMaxInactiveInterval(6000); // 60분
%>
<script>
	alert("로그인에 성공하였습니다.");
	window.location.href = '../index.jsp';
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