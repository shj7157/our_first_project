<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 저장 완료</title>
</head>
<body>
	<h1>학생 정보 저장 완료</h1>
<%
	// 작성한 값 받아오기
	String ID = Integer.getParameter("userid");
	String psw = request.getParameter("password");
	String user_name = request.getParameter("username");
    String addr = request.getParameter("addr");
    String birth = request.getParameter("birth");
    String phone = request.getParameter("phone");
	
	// mariaDB 준비
	Class.forName("org.mariadb.jdbc.Driver");
	System.out.println("mariadb 사용가능");
	
	// mariaDB 연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://172.20.10.7/cc","root","root");
	System.out.println(conn + "<-- conn");
	
	// 쿼리
	PreparedStatement stmt = conn.prepareStatement("insert into user_tb(ID, psw, user_name, addr, birth, phone) values(?,?,?,?,?,?)"); // ?표현식 : 변수자리
	stmt.setString(1, ID);
	stmt.setString(2, psw);
	stmt.setString(3, user_name);
    stmt.setString(4, addr);
    stmt.setString(5, birth);
    stmt.setString(6, phone);

    System.out.println(stmt + "<-- stmt");
	
	// 쿼리 실행
	stmt.executeUpdate();
    conn.close(); // DB 종료
%>
    <p> <%= psw.toString() %>
</body>
</html>