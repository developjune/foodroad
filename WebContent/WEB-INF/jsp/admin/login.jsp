<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#id").keypress(function (key) {
	        if ($("#id").val() != "" && $("#pw").val() == "") {
	        	if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        	var f = document.getElementById("loginForm");
		        	f.elements[1].focus();
	        	}
	        } else if ($("#id").val() != "" && $("#pw").val() != "") {
	        	if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        		searchBook();
	        	}
	        }
	    });
		
		$("#pw").keypress(function(key) {
			if ($("#pw").val() != "" && $("#id").val() != "") {
				if (key.keyCode == 13) {//키가 13이면 실행 (엔터는 13)
					searchBook();
				}
			} else if ($("#pw").val() != "" && $("#id").val() == "" ||
					$("#id").val() == "") {
				if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        	var f = document.getElementById("loginForm");
		        	f.elements[0].focus();
	        	}
			}
		});

		searchBook = function() {
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력하세요.");
			} else {
				if (id.value != "admin" || pw.value != "admin" ) {
					alert("아이디 혹은 비밀번호가 틀렸습니다.");
				} else if (id.value == "admin" && pw.value == "admin") {
					document.getElementById('loginForm').submit();
				}
			}
		};

	});
</script>

<script type="text/javascript">
	function login() {
		if (document.loginForm.id.value.trim() == "") {
			alert("아이디를 입력하세요.");
		} else if (document.loginForm.pw.value.trim() == "") {
			alert("비밀번호를 입력하세요.");
		} else if (document.loginForm.id.value != "admin") {
			alert("아이디가 틀렸습니다.");
		} else if (document.loginForm.pw.value != "admin") {
			alert("비밀번호가 틀렸습니다.");
		} else {
			document.getElementById('loginForm').submit();
		}
	};
</script>
</head>
<body>
	<div class="container">
		<h2>로그인</h2>
		<form class="col-xs-6 form-horizontal" id="loginForm" name="loginForm"
			method="post" action="/admin/login">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="id" maxlength="20">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pw" name="pw"
						placeholder="password" maxlength="20">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" class="btn btn-default" id="button_login"
						name="button_login" onclick="login();">Login</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>