<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['음식점 수','한식', '중식', '일식', '양식','까페','기타'],
          ['전체 ${adminFoodDto.totalFoodCnt}', ${adminFoodDto.korFood}, ${adminFoodDto.chnFood},${adminFoodDto.jpFood},${adminFoodDto.wtFood},${adminFoodDto.cafe},${adminFoodDto.etc}]         
        ]);       

        var chart = new google.charts.Bar(document.getElementById('columnchart_material1'));

        chart.draw(data, google.charts.Bar.convertOptions());
      }
      
      function drawChart2() {
          var data = google.visualization.arrayToDataTable([
            ['구매 수','한식', '중식', '일식', '양식','카페','기타'],
            ['전체 ${adminCouponDto.totalCouponCnt}', ${adminCouponDto.korCoupon}, ${adminCouponDto.chnCoupon},${adminCouponDto.jpCoupon},${adminCouponDto.wtCoupon},${adminCouponDto.cafe},${adminCouponDto.etc}]         
          ]);       

          var chart = new google.charts.Bar(document.getElementById('columnchart_material2'));

          chart.draw(data, google.charts.Bar.convertOptions());
        }
    </script>
    <style>
    	.table th { text-align: center;}
    </style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-6">
				<h2>전체 음식점 현황</h2>
				<div id="columnchart_material1" style="width: 90%; height: 500px;"></div>
				<h2>음식점 TOP10</h2>
				<p>조회수 기반</p>
				<table class="table table-dark table-hover">
					<thead>
						<tr>
							<th style="width:15%;">순위</th>
							<th>음식점 명</th>
							<th>조회수</th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="foodAdminRank" items="${adminFoodRank}">
							<tr>
								<td style="text-align:center;">${foodAdminRank.rank}</td>
								<td>${foodAdminRank.foodName}</td>
								<td style="text-align:center;">${foodAdminRank.foodRead}</td>
								<td style="text-align:center;"><a
									href="${root}/food/read.go?foodCode=${foodAdminRank.foodCode}">링크</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-6">
				<h2>이번 달 판매 현황<span style="font-size: 12px;">(취소된 구매는 제외)</span></h2>
				<div id="columnchart_material2" style="width: 90%; height: 500px;"></div>
				<h2>구매된 쿠폰 TOP10</h2>
				<p>판매수 기반</p>
				<table class="table table-dark">
					<thead>
						<tr>
							<th style="width:15%;">순위</th>
							<th>쿠폰명</th>
							<th>판매 수</th>
							<th>링크</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="couponAdminRank" items="${adminCouponRank}">
							<tr>
								<td style="text-align:center;">${couponAdminRank.rank}</td>
								<td>${couponAdminRank.couponName}</td>
								<td style="text-align:center;">${couponAdminRank.purchaseCnt}</td>
								<td style="text-align:center;"><a href="${root}/coupon/couponRead.go?couponCode=${couponAdminRank.couponCode}">링크</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>


