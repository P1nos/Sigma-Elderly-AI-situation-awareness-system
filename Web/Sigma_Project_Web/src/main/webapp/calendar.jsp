<%-- 

<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.test.calendarDAO, com.image.ImageLoader, java.util.ArrayList, java.util.List, java.util.regex.*, java.util.Base64"%>

<%
calendarDAO calendarDAO = new calendarDAO();
ImageLoader imageLoader = new ImageLoader();

String userId = "sinwook"; // 쿠키 또는 세션에서 사용자 ID를 가져오는 코드를 추가해야 합니다.

ArrayList<String> filetimeList = calendarDAO.select_days(userId);
List<byte[]> imageList = imageLoader.loadImagesByUserId(userId);

int checknum = 0;

Pattern pattern = Pattern.compile("(\\d{4})(\\d{2})(\\d{2})");

// JSON 데이터 문자열을 저장할 StringBuilder 생성
StringBuilder jsonDataBuilder = new StringBuilder();
jsonDataBuilder.append("[");

for (String fileName : filetimeList) {
	// 파일 이름에서 패턴 매칭 수행
	Matcher matcher = pattern.matcher(fileName);

	if (matcher.find()) {
		// 매칭된 그룹들 가져오기 (년, 월, 일)
		String year = matcher.group(1);
		String month = matcher.group(2);
		String day = matcher.group(3);

		// 날짜 데이터에서 앞의 0 제거
		if (day.startsWith("0")) {
	day = day.substring(1); // 앞의 0 제거
		}

		// 이미지 데이터를 Base64로 인코딩
		String imageDataBase64 = Base64.getEncoder().encodeToString(imageList.get(checknum));

		// JSON 데이터 문자열에 날짜와 이미지 데이터 추가
		if (checknum > 0) {
	jsonDataBuilder.append(",");
		}
		jsonDataBuilder
		.append("{\"date\": \"" + day + "\", \"image\": \"" + imageDataBase64 + "\", \"color\": \"#E08D8D\"}");
		checknum++;
	}
}

jsonDataBuilder.append("]");

// 결과 JSON 데이터 문자열
String jsonData = jsonDataBuilder.toString();

response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(jsonData);
%>
 --%>