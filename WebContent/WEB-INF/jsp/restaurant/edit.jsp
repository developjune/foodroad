<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>음식점 정보 수정</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script type="text/javascript"
	   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=NfZbwjSruLlfEAQP7NAC">
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.5.js"></script>

</head>
<body>
	<form id="form" name="form" action="<c:url value="/restaurant/edit/${restaurant[0].no}" />" method="post" enctype="multipart/form-data">
    	<div style="width:100%;" align="center">
         	<table style="width:30%;" class="table table-striped table-bordered">
            	<tr>
               		<td colspan="2" style="text-align: center;"><h3>정보 수정</h3></td>
           		</tr>
            	<tr>
               		<td><h5>음식점명:</h5></td>
               		<td>
                  		<input type="text" id="name" name="name" value="${restaurant[0].name }" class="form-control"/>
               		</td>
            	</tr>
            	<tr>
               		<td><h5>x좌표:</h5></td>
               		<td>
                  		<input type="text" id="xCoordinate1" class="form-control" name="xCoordinate1" value="${restaurant[0].xCoordinate}" disabled="disabled"> 
                  		<input type="hidden" id="xCoordinate" name="xCoordinate" value="${restaurant[0].xCoordinate}">
               		</td>
            	</tr>
            	<tr>
               		<td><h5>y좌표:</h5></td>
               		<td>
                  		<input type="text" id="yCoordinate1" class="form-control" name="yCoordinate1" value="${restaurant[0].yCoordinate}" disabled="disabled"> 
                  		<input type="hidden" id="yCoordinate" name="yCoordinate" value="${restaurant[0].yCoordinate}">
               		</td>
            	</tr>
            	<tr>
               		<td><h5>주소:</h5></td>
               		<td>
                  		<input type="text" id="address" class="form-control" name="address" value="${restaurant[0].address }" />
               		</td>
            	</tr>
            	<tr>
               		<td><h5>전화번호:</h5></td>
               		<td>
                  		<input type="text" id="tel" name="tel" class="form-control" value="${restaurant[0].tel }" />
               		</td>
            	</tr>
            	<tr>
					<td><h5>사진등록</h5></td>
					<td>
						<input type="file" id="imgInp1" name="file" value="찾아보기...">
						<img id="blah1" src="/" alt="1"/>
					</td>
				</tr>
            	<tr>
            		<td align="right" colspan="2">
		            	<input type="button" class="btn btn-default" id="button_add" name="button_add" value="수정" title="수정" onclick="edit();" />
		            	<a href="<c:url value="/restaurant/list/" />">
		               		<input type="button" class="btn btn-default" id="button_list" name="button_list" value="목록" />
		            	</a>
	            	</td>
            	</tr>
         	</table>
      	</div>
   	</form>
   	<form id="pictureForm" name="pictureForm" action="<c:url value="/restaurant/pictureremoveall" />" method="post">
		<div style="width:100%;" align="center">
			<input type="hidden" id="no" name="no" value="${restaurant[0].no}" />
	        <table style="width:30%;" class="table table-striped table-bordered">
				<tr>
					<c:if test="${!empty listPicture}" >
						<td colspan="2">
							<input type="checkbox" checked="checked" value="${listPicture[0].no}" name="nos" />
							<%-- <img src="/img/${listPicture[0].logicalName}_${listPicture[0].physicalName}" width="100" height="100" /> --%>
							<c:out value="${listPicture[0].physicalName }"></c:out>
						</td>
					</c:if>
					<td align="right"><input type="button" id="buttonRemove" name="buttonRemove"
							value="삭제" title="삭제" onclick="remove();" />
					</td>
				</tr>
			</table>
		</div>
	</form>
   	<div style="clear: left; width: 100%;" align="center">
 		<div id="map" style="width: 800px; height: 500px;"></div>
   	</div>
   
   	<script type="text/javascript">
   		function edit() {
      		if (document.form.name.value.trim() == "") {
         		alert("음식점 명을 입력 하세요.");
      		} else if (document.form.xCoordinate.value.trim() == "" || document.form.yCoordinate.value.trim() == "") {
         		alert("좌표를 설정 해야 합니다.");
      		} else if (document.form.address.value.trim() == "") {
         		alert("주소를 입력 하세요.");
      		} else if (document.form.tel.value.trim() == "") {
        		alert("전화번호를 입력 하세요.");
      		} else {
      			var name = document.getElementById("name");
         		name.value = document.form.name.value.trim();
         
	         	var address = document.getElementById("address");
	         	address.value = document.form.address.value.trim();
	         	document.getElementById('form').submit();
      		}
   		};
   	
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
				if (document.pictureForm.nos.checked == true) {
					result += document.pictureForm.nos.value + "\n";
				}
			}
			document.getElementById('pictureForm').submit();
		};
		
		function check(){
	    	cbox = pictureForm.nos;
	    	if(cbox.length) {  // 여러 개일 경우
	        	for(var i = 0; i<=cbox.length;i++) {
	            	cbox[i].checked=pictureForm.all.checked;
	        	}
	    	} else { // 한 개일 경우
	        	cbox.checked=pictureForm.all.checked;
	    	}
		};
		
		$(document).ready(function() {
			function readURL(input) {
        		if (input.files && input.files[0]) {
            		var reader = new FileReader(); 
            		if (test == imgInp1) {
            			reader.onload = function (e) {
                    		$('#blah1').attr('src', e.target.result);
            			}
                		reader.readAsDataURL(input.files[0]);
            		}
        		} 
    		}
			
	    	var test;
	    	$("#imgInp1").change(function(){
	        	test = imgInp1;
	        	readURL(this);
	    	});
		});
      
		var position = new naver.maps.LatLng(36.800965, 127.0728709);

      	var map = new naver.maps.Map('map', {
         	center : position,
       		zoom : 10,
         	enableWheelZoom : true,
         	enableDragPan : true,
         	enableDblClickZoom : true,
         	mapMode : 0,
         	activateTrafficMap : false,
         	activateBicycleMap : false,
         	minMaxLevel : [ 1, 14 ]
      	});

      	var x = ${restaurant[0].xCoordinate};
      	var y = ${restaurant[0].yCoordinate};

      	var marker = new naver.maps.Marker({
         	position : new naver.maps.LatLng(y, x),
         	map : map
      	});

      	naver.maps.Event.addListener(map, 'click', function(e) {
         	marker.setPosition(e.coord);
         	var xChange = e.coord.x;
         	var yChange = e.coord.y;

         	var xCoordinate = document.getElementById("xCoordinate");
         	xCoordinate.value = xChange;

         	var yCoordinate = document.getElementById("yCoordinate");
         	yCoordinate.value = yChange;

         	var xCoordinate1 = document.getElementById("xCoordinate1");
         	xCoordinate1.value = xChange;

         	var yCoordinate1 = document.getElementById("yCoordinate1");
         	yCoordinate1.value = yChange;
      	});
   	</script>
</body>
</html>