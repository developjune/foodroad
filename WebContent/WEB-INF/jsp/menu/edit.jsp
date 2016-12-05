<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 정보 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
			
			var price = document
			.getElementById("price");
			price.value = document.form.price.value.trim();
			
			efrm = document.form;
			efrm.restaurantNo.value = restaurantNo;
			efrm.no.value = no;
			
			document.getElementById('form').submit();
		}
	};
</script>
<script type="text/javascript">
	function remove() {
		var singleResult = "";
		var result = "";
		
		if (document.pictureForm.nos.length == null) {
			if (document.pictureForm.nos.checked == true) {
				singleResult += document.pictureForm.nos.value + "\n";
			}
			//선택된 것 이 없으면 
			if (singleResult == "") {
				alert("아무것도 선택하지 않으셨습니다");
			//하나라도 선택이 됐으면 	
			} else {
				document.getElementById('pictureForm').submit();
			}
		} else {
			for (i = 0; i < document.pictureForm.nos.length; i++) {
				//체크된 값을 result변수에 누적(문자열)
				if (document.pictureForm.nos[i].checked == true) {
					result += document.pictureForm.nos[i].value + "\n";
				}
			}
			//선택된 것 이 없으면 
			if (result == "") {
				alert("아무것도 선택하지 않으셨습니다");
			//하나라도 선택이 됐으면 	
			} else {
				document.getElementById('pictureForm').submit();
			}
		}
	};
	
	function check(){
	    cbox = pictureForm.nos;
	    if(cbox.length) {  // 여러 개일 경우
	        for(var i = 0; i<cbox.length;i++) {
	            cbox[i].checked=pictureForm.all.checked;
	        }
	    } else { // 한 개일 경우
	        cbox.checked=pictureForm.all.checked;
	    }
	};
</script>
</head>
<body>
	<%-- <form id="pictureForm" name="pictureForm"
		action="<c:url value="/menu/pictureremoveall" />" method="post">
		<table style="width: 50%;" border="1" align="center">
			<tr>
				<c:forEach items="${listPicture}" var="picture">
						<input type="hidden" id="menuNo" name="menuNo" value="${menu[0].no}" />
						<td colspan="2"><input type="checkbox" value="${picture.no}"
							name="nos"> <img src="/img/${picture.logicalName}_${picture.physicalName}"
							width="200" height="200" /></td>
				</c:forEach>
				<td align="right" paddingBottom="50px"><input type="button" id="buttonRemove" name="buttonRemove"
						value="삭제" title="삭제" onclick="remove();" />
				</td>
			</tr>
		</table>
	</form> --%>
	<form id="form" name="form" action="<c:url value="/menu/edit" />"
		method="post" >
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
</body>
</html>