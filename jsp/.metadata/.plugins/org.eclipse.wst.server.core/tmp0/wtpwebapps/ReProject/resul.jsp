<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
</head>
<body>
<%
String cal = request.getParameter("f");
String cal2 = request.getParameter("s");
int resul = Integer.parseInt(cal)+Integer.parseInt(cal2);
String result = Integer.toString(resul);
%>
<input name="f" value="<%=cal%>">+<input name="s" value="<%=cal2%>">=<input value="<%=resul%>">
</body>
</html>
