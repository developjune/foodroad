<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=NfZbwjSruLlfEAQP7NAC">
</script>
<script>
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
				window.open(url,"name99", 
						"width=500px,height=650px,left=100px,top=100px");
			}
		})
	});
</script>
</head>
<body>
   <div class="container">
   <div align="center">
   <table border="1" width="50%" align="center" class="table table-striped table-bordered">
      <tr>
         <td colspan="7" align="center">${listMenu[0].restaurantName }</td>
      </tr>
      <tr>
         <td align="center">메뉴번호</td>
         <td align="center">타입</td>
         <td align="center">음식이름</td>
         <td align="center">가격(원)</td>
         <td align="center">수정</td>
         <td align="center">삭제</td>
      </tr>
      <c:if test="${!empty listMenu}">
         <c:forEach items="${listMenu }" var="menu" varStatus="status">
            <tr>
               <td align="center"><c:out value="${menu.no }"></c:out></td>
               <td align="center">
                     <c:forEach items="${codes}" var="codes" varStatus="varStatus">
                        <c:if test="${codes.code == menu.type}">
                           <c:out value="${codes.name}"></c:out>
                        </c:if>
                     </c:forEach>
               </td>
               <td align="center"><c:out value="${menu.name }"></c:out></td>
               <td align="center"><c:out value="${menu.price }"></c:out></td>
               <td style="text-align: center;">
                  <a href="<c:url value="/menu/editform/${menu.no}" />">
                  <input type="button" class="btn btn-default btn-xs btn-block" id="button_view" name="button_view" value="수정" /></a>
               </td>
               <td style="text-align: center;">
                  <a href="javascript:onDelete(${menu.restaurantNo} , ${menu.no})">
                     <input type="button" class="btn btn-default btn-xs btn-block" id="button_view" name="button_view" value="삭제" />
                  </a>
               </td>
            </tr>
         </c:forEach>
      </c:if>
      <c:if test="${empty listMenu }">
         <tr>
            <td colspan="6" align="center">목록이 없습니다.</td>
         </tr>
      </c:if>
   </table>
   </div>
   <div align="right">
            <input type="button" class="btn btn-default" id="button_view_menu" name="button_view" value="메뉴판 보기" />
            <input type="hidden" id="url" value="/img/${listPicture.logicalName }_${listPicture.physicalName }">
            
            <a href="<c:url value="/menu/addform/${menu.restaurantNo}" />">
               <input type="button" class="btn btn-default" id="button_view" name="button_view" value="메뉴 등록" /></a>
            <a href="<c:url value="/restaurant/list" />"> 
               <input type="button" class="btn btn-default" id="button_view" name="button_view" value="음식점 목록으로" /></a>
   </div>
   </div>
   <div style="clear: left; width: 100%;" align="center">
         <div id="map" style="width: 800px; height: 500px;"></div>
    </div>
   <script>
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
      
      var x = ${listMenu[0].xCoordinate};
      var y = ${listMenu[0].yCoordinate};
      
      var marker = new naver.maps.Marker({
         position : new naver.maps.LatLng(y, x),
         map : map
      });
   </script>
   
   <script language="javascript">
      function onDelete(restaurantNo, no)
      {
         efrm = document.frm;
         efrm.restaurantNo.value = restaurantNo;
         efrm.no.value = no;
         efrm.submit();
      }
   </script>
   
   <script language="javascript">
      function list(no)
      {
         efrm = document.frm1;
         efrm.no.value = no;
         efrm.submit();
      }
   </script>
   
   <form name="frm1" method="get" action="menu/adminlist">
      <input type="hidden" name="no" value="">
   </form>
   
   <form name="frm" method="post" action="/menu/delete">
      <input type="hidden" name="no" value="">
      <input type="hidden" name="restaurantNo" value="">
   </form>
</body>
</html>