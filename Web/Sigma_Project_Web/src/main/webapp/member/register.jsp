<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.test.*, java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

if ("".equals(request.getParameter("inputId")) || "".equals(request.getParameter("inputPassword"))
		|| "".equals(request.getParameter("repeatPassword")) || "".equals(request.getParameter("inputName"))
		|| "".equals(request.getParameter("inputPhonenumber")) || "".equals(request.getParameter("inputEmail"))
		|| "".equals(request.getParameter("inputAge")) || "".equals(request.getParameter("inputHeight"))
		|| "".equals(request.getParameter("inputWeight")) || "".equals(request.getParameter("inputBloodtype"))
		|| "".equals(request.getParameter("inputCarrierdisease"))) { // null 확인
%>
<script>
	alert("빈칸 입력해주세요.");
	history.back();
</script>

<%
} else {

String id = request.getParameter("inputId");
String password = request.getParameter("inputPassword");
String repeatpassword = request.getParameter("repeatPassword");
String name = request.getParameter("inputName");
String phone_number = request.getParameter("inputPhonenumber");
String email = request.getParameter("inputEmail");
int age = Integer.parseInt(request.getParameter("inputAge"));
int height = Integer.parseInt(request.getParameter("inputHeight"));
int weight = Integer.parseInt(request.getParameter("inputWeight"));
String bloodtype = request.getParameter("inputBloodtype");
String carrier_disease = request.getParameter("inputCarrierdisease");

System.out.println("passowrd: " + password.equals("repeatpassword"));

memberDAO member = new memberDAO(); // 객체 생성

int checkidnum = member.select_id(id);

System.out.println("password : " + password + ", repeatpassword : " + repeatpassword);
System.out.println("repeatpassword : " + !password.equals(repeatpassword));

// 코드 최적화
if (checkidnum == 1) { // id 중복 확인
%>
<script>
	alert("ID가 중복됩니다.");
	history.back();
</script>
<%
} else {
if (!password.equals(repeatpassword)) { // 비밀번호 확인
%>
<script>
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
</script>
<%
} else { // id 중복 x, 비밀번호 중복 x

member.member_insert(id, password, name, phone_number, email, age, height, weight, bloodtype, carrier_disease); // 회원정보 입력 입력
%>

<script>
	alert("회원가입에 성공하였습니다.");
	window.location.href = '../login.html';
</script>
<%
}
}
}
%>

<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>