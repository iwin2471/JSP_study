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
<script language="javascript" src="http://connect.facebook.net/ko_KR/all.js"></script>

</head>

<%String name = request.getParameter("name"); %>
<script>
function getMyProfile(){

	FB.api('/me',function(user){

	var myName= user.name ;

	          var myEmail = user.email;

	                  var myId = user.id;

	 });

	FB.api('/me/picture?type=large',function(data){

	var myImg = data.data.url;

	});

	 

	 

	}
var FBtoken = "";

function loginFB(){

 

FB.login(function(response) {

if (response.authResponse) {

   FBtoken =  response.authResponse.accessToken;

} else {    

       }

     }

 , {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 

);

}

function loginFB(){

	FB.login(function(response) {

	if (response.authResponse) {

	     // callback 영역입니다. 자신의 브라우저가 페북에 연동되면 여기로직을 처리 하게 되죠

	} else {

	     //오류가 났거나 연동이 실패 했을때 처리 하는부분..... 

	       }

	     }

	 , {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 

	);

	}
	
var fabceloginChk = 0;

function loginFB(){

	if(fabceloginChk == 0){
	
	FB.login(function(response) {

	if (response.authResponse) {

 		fabceloginChk  = 1;

	} else {   

	alert('로그인에 실패했습니다!!!');
		fabceloginChk  = 0;
		
		       }
		
		     }
		
		 , {scope: "user_about_me,publish_stream,read_friendlists,offline_access,email,user_birthday"} 
		
		);
		
		}
		
	}
		function nhello() {				
		   if(localStorage.getItem('ID') == null){
				$('#nhello').html('로그인해주세요');
		    }else{
				window.location.replace("main.jsp?name="+localStorage.getItem('ID'));
		    }
		}
		function hello(){
				$('#hello').html(localStorage.getItem('ID')+'님 환영합니다');
		}
		function login() {
				location.href = "/ReProject/login.jsp";
		}
		function closeAlert() {
				$('#hello_close').hide();
		}
</script>
<script type="text/javascript">

window.fbAsyncInit = function() {
  FB.init({
	  appId  : '/*사용하는 페북 앱의 id값 넣는곳... 이건 다른곳 찾아봐도 자세하게 나옵니다.*/', 

	   status : true, // check login status

	   cookie : true, // enable cookies to allow the server to access the session

	   xfbml  : true, // parse XFBML

	   oauth  : true // enable OAuth 2.0   기본세팅입니다. 그냥 따라 쓰면 됩니다
 });

 };

 

 (function(d){

    var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}

    js = d.createElement('script'); 
    js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    d.getElementsByTagName('head')[0].appendChild(js);

  }(document));

 

</script>
<%if(name == null){%>
<ol class="breadcrumb">
  <li><a href="#" onclick='location.href="/ReProject/main.jsp"'>Home</a></li>
  <li><a href="#" onclick='location.href="/ReProject/boardList.jsp"'>Board</a></li>
</ol>
<body onload="nhello()">
<div class="alert alert-dismissable alert-success" id="nhello_close">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="login()">로그인</button>
  <div id='nhello'></div>
</div>
<input type="button" value="페이스북로그인!" onclick="loginFB()" />
</body>
<%}else { %>
<ol class="breadcrumb">
  <li><a href="#" onclick='location.href="/ReProject/main.jsp"'>Home</a></li>
  <li><a href="#" onclick='location.href="/ReProject/boardList.jsp"'>Board</a></li>
  <li><a href="#" onclick='location.href="/ReProject/boardList.jsp"'>Board</a></li>
</ol>
<body onload="hello()">
<div class="alert alert-dismissable alert-success" id="hello_close">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="closeAlert()">x</button>
  <div id='hello'></div>
</div>
</body>
<input type="button" value="페이스북로그인!" onclick="loginFB()" />
<%} %>
</html>