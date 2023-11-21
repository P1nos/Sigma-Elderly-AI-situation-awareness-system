<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.image.ImageData, com.image.ImageLoader"%>
<%@ page import="java.util.Base64, java.util.List, java.sql.Timestamp, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>DashBoard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="./css/image.css">
<link rel="stylesheet" type="text/css" href="./css/calendar_style.css">
<!-- Font Awesome 6.2.0 라이브러리 로드 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link href='https://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./js/calendar_script.js"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.jsp">Sigma</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li id="loginButton"><a class="dropdown-item"
						href="login.html">Login</a></li>
					<li id="logoutButton" style="display: none;"><a
						class="dropdown-item" href="member/sessionDel.jsp">Logout</a></li>
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>

						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a id="Authentication_loginButton" class="nav-link"
											href="login.html">Login</a> <a class="nav-link"
											href="register.html">Register</a> <a class="nav-link"
											href="password.html">Forgot Password</a>
									</nav>
								</div>
								<!--
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a class="nav-link"
											href="404.html">404 Page</a> <a class="nav-link" href="500.html">500
											Page</a>
									</nav>
								</div>
								-->
							</nav>
						</div>
						<!--<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="calendar.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-calendar"></i>
							</div> Calendar
						</a> <a class="nav-link" href="image.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-image"></i>
							</div> Image
						</a> -->
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">
						Logged in as: </br> <span id="userIdPlaceholder"></span>님 반갑습니다.
					</div>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<body>
					<table>

						<thead>
							<% String imageId = (String) session.getAttribute("userId"); %>
						
						<header class="center-align">
						<%=imageId%> 님의 이미지
						</header>
						<tr>
							<th>번호</th>
							<th>아이디</th>
							<th>날짜</th>
							<th>이미지</th>
						</tr>
						</thead>
						<tbody>
							<%
							List<ImageData> imageList = ImageLoader.loadAllImagesFromDatabase(imageId);
							
							if (!imageList.isEmpty()) {
								int imageCount = imageList.size(); // 이미지 리스트의 크기를 얻습니다.
								
								for (ImageData imageData : imageList) {
									int num = imageCount; // 이미지 리스트의 크기를 num 값으로 사용합니다.
									String filetime_days = imageData.getFiletime_days();
									String filetime_tiems = imageData.getFiletime_times();
									byte[] imageBytes = imageData.getImage();
							%>
							<tr>
								<td class="font_image"><%=num%></td>
								<td class="font_image"><%=imageId%></td>
								<td class="font_image"><%=filetime_days%>&nbsp; <%=filetime_tiems%></td>
								<td class="font_image"><img
									src="data:image/jpeg;base64, <%=new String(Base64.getEncoder().encode(imageBytes))%>"
									alt="Image" /></td>
							</tr>

							<%
							imageCount--; // 이미지 카운트 값을 감소시켜 다음 이미지의 num 값을 줄입니다.
							}
							} else {
							 %>
							 <%
							}
							%>
						</tbody>
						<tfoot>
							<td colspan="5" class="tablefoot"></td>
						</tfoot>
					</table>
				</body>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Sigma Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// 사용자 정보를 확인하고 버튼을 업데이트하는 함수
			function updateButtons() {
				// AJAX를 사용하여 서버에서 세션 값을 가져옵니다.
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "member/getSessionUserId.jsp", true);

				xhr.onload = function() {
					if (xhr.status === 200) {
						var userId = xhr.responseText.trim();
						var loginButton = document
								.getElementById("loginButton");
						var logoutButton = document
								.getElementById("logoutButton");
						var userIdPlaceholder = document
								.getElementById("userIdPlaceholder");

						if (userId) {
							// 사용자 정보가 있는 경우
							loginButton.style.display = "none"; // 로그인 버튼 숨김
							logoutButton.style.display = "block"; // 로그아웃 버튼 표시
							userIdPlaceholder.textContent = userId; // userId를 스팬에 설정
							Authentication_loginButton.style.display = "none"; // Authentication의 로그인 버튼 숨김
						} else {
							// 사용자 정보가 없는 경우
							loginButton.style.display = "block"; // 로그인 버튼 표시
							logoutButton.style.display = "none"; // 로그아웃 버튼 숨김
							userIdPlaceholder.textContent = ""; // userId 스팬 비우기
						}
					}
				};

				xhr.send();
			}

			// 페이지 로드시 버튼 상태 업데이트
			updateButtons();
		});
	</script>


</body>

</html>