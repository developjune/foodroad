<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메뉴 정보 수정</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.5.js"></script>
</head>
<body>
	<form id="form" name="form" action="<c:url value="/menu/edit" />" method="post">
		<input type="hidden" name="no" value="">
		<input type="hidden" name="restaurantNo" value="">
		<div style="width:100%;" align="center">
			<table style="width:30%;" class="table table-striped table-bordered">
				<tr align="right">
					<td colspan="2" style="text-align: center;"><h3>메뉴 수정</h3></td>
				</tr>
				<tr align="center">
					<td><h5>타입:</h5></td>
					<td>
						<select name="type" class="form-control">
							<c:forEach  items="${codes}" var="code">
								<option
									<c:if test="${code.code == menu[0].type}">
										selected="selected"
									</c:if> value="${code.code}">${code.name }
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr align="center">
					<td><h5>메뉴명:</h5></td>
					<td><input type="text" id="name" name="name" value="${menu[0].name }" class="form-control" /></td>
				</tr>
				<tr align="center">
					<td><h5>가격:</h5></td>
					<td><input type="text" id="price" name="price" value="${menu[0].price }" class="form-control" /></td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input type="button" class="btn btn-default" id="button_view" name="button_view" value="수정" onclick="javascript:edit(${menu[0].restaurantNo}, ${menu[0].no})" />
						<a href="<c:url value="/menu/adminlist/${menu[0].restaurantNo }" />">
							<input type="button" class="btn btn-default" id="button_list" name="button_list" value="목록" />
						</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<script type="text/javascript">
		function edit(restaurantNo, no) {
			if (document.form.name.value.trim() == "") {
				alert("메뉴 명을 입력 하세요.");
			} else if (document.form.price.value.trim() == "") {
				alert("가격을 입력 하세요.");
			} else {
				var name = document
				.getElementById("name");
				name.value = document.form.name.value.trim();
				
				var price = document.getElementById("price");
				price.value = document.form.price.value.trim();
				
				efrm = document.form;
				efrm.restaurantNo.value = restaurantNo;
				efrm.no.value = no;
				
				document.getElementById('form').submit();
			}
		};
	</script>
</body>
</html>