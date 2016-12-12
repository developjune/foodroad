<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메뉴 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<form action="<c:url value="/menu/list/${menu.restaurantNo }" />" method="post">
			<table class="table table-striped table-hover table-bordered">
				<tr>
					<td align="center" colspan="2">${listMenu[0].restaurantName}</td>
				</tr>
				<tr>
					<td align="center" colspan="2">전화번호 : ${listMenu[0].tel }</td>
				</tr>
				<tr>
					<td align="center">메뉴명</td>
					<td align="center">가격</td>
				</tr>
				<c:if test="${!empty listMenu}">
					<c:forEach items="${listMenu}" var="menu" varStatus="status">
						<tr>
							<td style="text-align: center;">
								<c:out value="${menu.name }" />
							</td>
							<td style="text-align: center;">
								<c:out value="${menu.price}" />
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty listMenu}">
					<tr>
						<td style="text-align: center;" colspan="2">목록이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
</body>
</html>