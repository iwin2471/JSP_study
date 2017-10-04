<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.DBconnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
</head>


<body onload="loginchk()">
<%
	String id = request.getParameter("id");
String passwd = request.getParameter("password");
DBconnect dbc = new DBconnect();

int loginResult = dbc.login(id, passwd);
System.out.println(request.getContextPath());
%>
</body>

<script>
	function loginchk() {
		var chk = <%=loginResult%>;
		
		switch(chk){
		
			// 정상 로그인
			case 0:
				sessionStorage.setItem("ID", "<%=id%>")
				location.href = "/ReProject/main.jsp";				
				break;
			
			// 비밀번호 틀림	
			case 1:
				alert('비밀번호가 틀렸습니다.');
				location.href = "/ReProject/login.jsp?type=1&id=<%=id%>"
				break;
		
			// 아이디 없음
			case 2:
				alert('<%=id%>는없는아이디입니다'); 
				location.href = "/ReProject/login.jsp"
				break;
				
			// 서버 상태 안좋음
			case 3:
				break;
			
		}
	}

</script>
</html>