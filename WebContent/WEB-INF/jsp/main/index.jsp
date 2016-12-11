<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>FoodLoad</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=NfZbwjSruLlfEAQP7NAC"></script>
	<style>
		html, body {
			width: 100%;
			height: 100%;
			margin: auto;
		}
		
		.modal-dialog.modal-80size {
			width: auto;
			height: 70%;
			margin: 0;
			padding: 0;
		}
		
		.modal-content.modal-80size {
			height: auto;
			min-height: 30%;
		}
		
		.modal.modal-center {
			text-align: center;
		}
		
		@media screen and (min-width: 768px) {
			.modal.modal-center:before {
				display: inline-block;
				vertical-align: middle;
				content: " ";
				height: 100%;
			}
		}
		
		.modal-dialog.modal-center {
			display: inline-block;
			text-align: left;
			vertical-align: middle;
		}
		
		.jumbotron {
			background-color: #aa0d42;
			color: #fff;
			padding-top: 1px;
			padding-bottom: 12px;
		}
		
		#roomList {
			overflow: auto;
			display: inline-block;
			width: 650px;
			height: 300px;
		}
		
		a:link {
			text-decoration: none;
		}
	</style>
</head>
<body>
	<table style="width: 100%; height: 100%;">
		<colgroup>
			<col style="width: 20%;">
			<col>
		</colgroup>
		<tr style="height: 10%;">
			<td align="center">
				<h1><a href="/"><img src="/logo/logo.png" alt=""></a></h1>
			</td>
			<td rowspan="2">
				<div id="map" style="width: 100%; height: 100%;"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div style="padding-left: 10px; padding-top: 10px; padding-right: 10px;">
					<c:forEach items="${codes}" var="code" varStatus="status">
						<form action="<c:url value="/main/index" />" id="form_type" name="form_type" method="post">
							<div style="padding-top: 10px;">
								<input type="hidden" name="type" value="${code.code }" />
								<button type="submit" id="button1" name="ok" class="btn btn-info btn-block btn-lg">
									<c:out value="${code.name }"></c:out>
								</button>
							</div>
						</form>
					</c:forEach>
				</div>
			</td>
		</tr>
	</table>
	<div class="container">
		<input type="hidden" id="modal" class="btn btn-info btn-lg"
			data-toggle="modal" data-target="#myModal" />
		<!-- Modal -->
		<div class="modal modal-center fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-80size modal-center">
				<!-- Modal content-->
				<div class="modal-content modal-80size">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">메뉴 정보</h4>
					</div>
					<div class="modal-body">
						<div id="menuList"></div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" id="button_view_menu"
							name="button_view" value="메뉴판 보기" /> <input type="hidden"
							id="url"
							value="/img/${listPicture.logicalName }_${listPicture.physicalName }">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    	function getContextPath() {
        	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
        	return location.href.substring(0, hostIndex + 1);
     	};
      
     	var position = new naver.maps.LatLng(36.800965, 127.0728709);
      	var HOME_PATH = window.HOME_PATH || '.';
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
      
	    var mapType = newMap();
	    var markers = [];
               
      	<c:forEach items="${listRestaurant}" var="restaurant" varStatus="count">
        	var x = ${restaurant.xCoordinate};
         	var y = ${restaurant.yCoordinate};
         	var i = ${count.index};
         
         	var xResult = String(x).replace(".", "_");
       	 	var yResult = String(y).replace(".", "_");
        	var no = ${restaurant.no};
         	var count = xResult + "_" + yResult;
         	var count1 = String(x) + "_" + String(y);
         
         	mapType.put(count, no); 
         	mapType.put(count1, no);
         	var marker = new naver.maps.Marker({
            	position: new naver.maps.LatLng(y, x),
            	icon: {
              		url: getContextPath() + '/img/test.png',
              		size: new naver.maps.Size(50, 52),
              		origin: new naver.maps.Point(0, 0),
              		anchor: new naver.maps.Point(25, 26)
          		},
            	map : map
           	});
                   
         	markers[i] =  marker;
      	</c:forEach>
      
      	function getClickHandler(seq) {
         	return function(e) {
            	var marker = markers[seq];
            	var xhttp = new XMLHttpRequest();
            
            	var coordinateResult = String(markers[seq].getPosition().x).replace(".", "_") + "_" + String(markers[seq].getPosition().y).replace(".", "_"); 
            	var noResult = mapType.value[mapType.getKey(coordinateResult)];
            
            	$("#modal").click();
            
            	var infoData = noResult;

            	$.post(
               		"http://localhost/menu/list/${restaurant.no}",
               		{ param: infoData },
                	function(data) {
                  		document.querySelector('#menuList').innerHTML = data;
               		}
             	);
         	}
      	}
      
        for (var i=0, ii = markers.length; i<ii; i++) {
        	naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
      	}
         
        function newMap() {
         	var mapType = {};
        	mapType.value = {};
         	mapType.getKey = function(id) {
            	return "k_"+id;
         	};
         	mapType.put = function(id, value) {
            	var key = mapType.getKey(id);
            	mapType.value[key] = value;
         	};
         	mapType.contains = function(id) {
           	 	var key = mapType.getKey(id);
            	if(mapType.value[key]) {
               		return true;
            	} else {
               		return false;
            	}
         	};
         	mapType.get = function(id) {
            	var key = mapType.getKey(id);
            	if(mapType.value[key]) {
               		return mapType.value[key];
            	}
            	return null;
         	};
         	mapType.remove = function(id) {
            	var key = mapType.getKey(id);
            	if(mapType.contains(id)){
               		mapType.value[key] = undefined;
            	}
         	};
         	return mapType;
      	}
        
		function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring(0, hostIndex + 1);
		};
		$(document).ready(function() {
			$('#button_view_menu').on('click', function() {
				if(${empty listPicture}) {
					alert("사진이 없습니다");
				} else {
					var url = $('#url').val();
					window.open(url,"name99", "width=500px,height=650px,left=100px,top=100px");
				}
			})
		});
	</script>
</body>
</html>