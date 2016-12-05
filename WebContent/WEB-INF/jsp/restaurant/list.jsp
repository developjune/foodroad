<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>음식점 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
   $(document).ready(function() {
      $("#searchKeyword").keypress(function (key) {
           if ($("#searchKeyword").val() != "") {
              if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
                 var f = document.getElementById("form_search");
                 f.elements[0].focus();
                 search();
              }
           } 
       });
      
   searchBook = function() {
            document.getElementById('form_search').submit();
         }
   });
</script>
<script type="text/javascript">
function search() {
      if (document.form_search.searchKeyword.value.trim() == "") {
         alert("검색어를 입력해주세요.");
      } else {
         var searchKeyword = document.getElementById("searchKeyword");
         searchKeyword.value = document.form_search.searchKeyword.value.trim();

         document.getElementById('form_search').submit();

      }
   };
</script>
</head>
<body>
   <div class="container">
     <div>
         <form id="form_search" name="form_search" class="form-inline" action="/restaurant/list" method="post">
            <div align="left" style="width:50%; float:left;margin-top: 10px; margin-bottom: 10px;">
                  <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"
                   placeholder="음식점명" value="${restaurant.searchKeyword}" onKeyPress="if(event.keyCode==13) {return false;}" /> 
                  <input type="button" class="btn btn-default" id="button_search" name="button_search" value="검색" title="검색" onclick="search();" />
                  <a href="<c:url value="/restaurant/list" />">
                   <input type="button" class="btn btn-default" id="button_view" name="button_view" value="전체" /></a>
            </div>               
            <div align="right" style="width:50%; float:left;margin-top: 10px; margin-bottom: 10px;">
                  <a href="<c:url value="/admin/logout" />">
                    <input type="button" class="btn btn-default" id="button_view" name="button_view" value="로그아웃" /></a>
            </div>               
          </form>
      </div>
      <div align="center">
         <table align="center" class="table table-striped table-bordered" width="50%">
            <tr>
               <td align="center">음식점번호</td>
               <td align="center">음식점명</td>
               <td align="center">x좌표</td>
               <td align="center">y좌표</td>
               <td align="center">주소</td>
               <td align="center">전화번호</td>
               <td align="center">상세보기</td>
               <td align="center">수정</td>
               <td align="center">삭제</td>
            </tr>
            <c:if test="${!empty listRestaurant }">
               <c:forEach items="${listRestaurant}" var="restaurant" varStatus="status">
                  <tr>
                     <td align="center">
                        <c:out value="${restaurant.no }" />
                     </td>
                     <td align="center">
                        <c:out value="${restaurant.name }" />
                     </td>
                     <td align="center">
                        <c:out value="${restaurant.xCoordinate }" />
                     </td>
                     <td align="center">
                        <c:out value="${restaurant.yCoordinate }" />
                     </td>
                     <td align="center">
                        <c:out value="${restaurant.address }" />
                     </td>
                     <td align="center">
                        <c:out value="${restaurant.tel }" />
                     </td>
                     <td style="text-align: center; width: 110px;">
                        <a href="<c:url value="/menu/adminlist/${restaurant.no}" />"> 
                        <input type="button" class="btn btn-default btn-xs btn-block" id="button_view" name="button_view" value="보기" /></a>
                     </td>
                     <td style="text-align: center; width: 110px;">
                        <a href="<c:url value="/restaurant/editform/${restaurant.no}" />">
                        <input type="button" class="btn btn-default btn-xs btn-block" id="button_view" name="button_view" value="수정" /></a>
                     </td>
                     <td style="text-align: center; width: 110px;">
                        <a href="<c:url value="/restaurant/delete/${restaurant.no}" />">
                        <input type="button" class="btn btn-default btn-xs btn-block" id="button_view" name="button_view" value="삭제" /></a>
                     </td>
                  </tr>
               </c:forEach>
            </c:if>
            <c:if test="${empty listRestaurant}">
               <tr>
                  <td colspan="8" align="center">목록이 없습니다.</td>
               </tr>
            </c:if>
         </table>
      </div>
      <div align="right">
         <a href="<c:url value="/restaurant/addform" />"> 
         <input type="button" class="btn btn-default" id="button_view" name="button_view" value="음식점 등록" /></a>
      </div>
      <div align="center">
         <c:out value="${navigator}" escapeXml="false" />
      </div>
   </div>   
</body>
</html>