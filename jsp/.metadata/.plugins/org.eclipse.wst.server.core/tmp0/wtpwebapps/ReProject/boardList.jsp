<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
</head>

<%
DBconnect dbc = new DBconnect();

ResultSet rs = dbc.boardli();
%>

<body>
<ol class="breadcrumb">
  <li><a href="#" onclick='location.href="/ReProject/main.jsp"'>Home</a></li>
  <li class='active'>Board</li>
</ol>
<h1><small>Board</small></h1>

<table class="table">
<tr>
	<th>No</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Date</th>
</tr>
<%
while(rs.next()) {
%>
  <tr>
  	<td><%=rs.getInt("NO")%></td>
  	<td><a href="index.jsp"><%=rs.getString("TITLE")%></a></td>
  	<td><%=rs.getString("WRITER")%></td>
  	<td><%=rs.getString("WRT_DATE")%></td>
  </tr>

<%
}
%>
</table>
</ul>
</body>
</html>