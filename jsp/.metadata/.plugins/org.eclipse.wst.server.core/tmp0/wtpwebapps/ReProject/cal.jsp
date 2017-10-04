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

<script>
	function sum() {
		var fNum = Number($('#f').val());
		var sNum = Number($('#s').val());
		
		var result = fNum + sNum;
		
		$('#result').val(result);
	}
</script>

<body>
<form action="/ReProject/resul.jsp">
<input name="f" id="f">+<input name="s" id="s">=<input id="result">
<input type="button" onclick="sum()" value="더하기	">
</form>
</body>
</html>