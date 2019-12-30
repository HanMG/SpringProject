<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['음식점 수','한식', '중식', '일식', '경양식','고기집','까페','회집','뷔페','기타'],
          ['전체 ${adminFoodDto.totalFoodCnt}', ${adminFoodDto.korFood}, ${adminFoodDto.chnFood},${adminFoodDto.jpFood},${adminFoodDto.wtFood},${adminFoodDto.bbq},${adminFoodDto.cafe},${adminFoodDto.fishFood},${adminFoodDto.buffet},${adminFoodDto.etc}]         
        ]);       

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions());
      }
    </script>
	</head>
	<body>
		<h3>멤버페이지!!</h3>
		 <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
		 <div>전체 음식점 수 : ${adminFoodDto.totalFoodCnt}</div>
		 
		 <div>
		 	<p>음식점 랭킹 TOP 10 (조회수 기반)</p>
		 	<c:forEach var="foodAdminRank" items="${adminFoodRank}">
		 		<div>순위 : ${foodAdminRank.rank}, <a href="${root}/food/read.go?foodCode=${foodAdminRank.foodCode}">링크</a>, 음식점 명: ${foodAdminRank.foodName}, 조회수 : ${foodAdminRank.foodRead}</div>		 		
		 	</c:forEach>		 	
		 </div>
	</body>
</html>


