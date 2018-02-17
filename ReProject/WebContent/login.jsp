<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>

<%
String type = request.getParameter("type");
String id = request.getParameter("id");
%>

<script type="text/javascript">
	$(function() {
		var type = <%=type%>;
		
		if(type == 1) {
			$("#id").val('<%=id%>');
			$("#password").focus();
			
		} else {
			$("#id").focus();
		}
	});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="container">

<form class="form-signin" action="<%=request.getContextPath()%>/logincheck.jsp" method="POST">
	<h2 class="form-signin-heading"><center>로그인</center></h2>
	<input name="id" id="id" class="form-control" placeholder="아이디">
	
	<%if(type == null) {%>
	<input type="password" name="password" class="form-control" id="inputError" placeholder="패스워드">
	<%} else {%>
	<div class="has-error">
	  <input type="password" class="form-control" id="password" name="password">
	</div>
	<%}%>
	<input type="submit" value="완료" class="btn btn-primary btn-block">
</form>
<!-- <div class="alert alert-success">
        <strong>Well done!</strong> You successfully read this important alert message.
</div> -->


    </div> <!-- /container -->
</body>
</html>