<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.5.js"></script>
<script type="text/javascript">
	function add() {
		if (document.form.name.value.trim() == "") {
			alert("메뉴 명을 입력 하세요.");
		} else if (document.form.price.value.trim() == "") {
			alert("가격을 입력 하세요.");
		} else {
			var name = document
			.getElementById("name");
			name.value = document.form.name.value.trim();
			
			var price = document
			.getElementById("price");
			price.value = document.form.price.value.trim();
			document.getElementById('form').submit();
		}
	};
</script>
</head>
<body>
	<form id="form" name="form" action="<c:url value="/menu/add/${menu.restaurantNo}" />" 
		method="post">
		<div style="width:100%;" align="center">
		<table style="width:30%;" class="table table-striped table-bordered">
			<tr align="right">
				<td colspan="2" style="text-align: center;">메뉴 등록</td>
			</tr>
			<tr align="center">
				<td><h5>음식점명:</h5></td>
				<td>
					<select name="restaurantNo" class="form-control">
						<c:forEach  items="${restaurant}" var="restaurant">
							<option
								<c:if test="${restaurant.no == menu.restaurantNo}">
									selected="selected"
								</c:if> value="${menu.restaurantNo}">${restaurant.name }
							</option>
						</c:forEach>
					</select>
				</td>
			<tr align="center">
				<td><h5>타입:</h5></td>
				<td>
					<select name="type" class="form-control">
						<c:forEach items="${codes}" var="codes">
								<option value="${codes.code}">${codes.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr align="center">
				<td><h5>메뉴명:</h5></td>
				<td>
				 	<input type="text" id="name" name="name" class="form-control" />
				</td>
			</tr>
			<tr align="center">
				<td><h5>가격:</h5></td>
				<td>
					<input type="text" id="price" name="price" class="form-control" />
				</td>
			</tr>
			<tr>
				<td align="right" colspan="2"><input type="button" class="btn btn-default"
					id="button_add" name="button_add" value="등록" title="등록"
					onclick="add();" />
					<a href="<c:url value="/menu/adminlist/${restaurantNo}" />">
						<input type="button" class="btn btn-default" id="button_list" name="button_list" value="목록" />
					</a>
				</td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>