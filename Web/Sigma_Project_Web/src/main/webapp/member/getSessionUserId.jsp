<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션에서 userId 값을 가져옵니다.
    String userId = (String) session.getAttribute("userId");

    // userId 값을 응답으로 보냅니다.
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    out.print(userId != null ? userId : "");
%>
