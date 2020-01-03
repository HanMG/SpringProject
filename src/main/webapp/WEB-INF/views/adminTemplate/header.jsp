<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- 게시판용 -->
<script type="text/javascript" src="${root}/resources/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${root}/resources/datatables.min.js"></script>
<link rel="stylesheet" href="${root}/resources/datatables.min.css">
<style type="text/css">
table {
	table-layout: fixed;
}
thead > tr > th {
	white-space: nowrap;
}
tbody > tr > th {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

    $('#example').DataTable({    	
    	"order":[[0, 'desc']]
    });
} );

</script>


<title>관리자 페이지</title>

<!-- Custom fonts for this template-->
<link
	href="${root}/resources/sb/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link
	href="${root}/resources/sb/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${root}/resources/sb/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="${root}/admin/main.go">EatTheJeju 관리자페이지</a>			
		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow mx-1">
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="alertsDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>
			<li class="nav-item dropdown no-arrow mx-1">
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="messagesDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div>
			</li>
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">마이페이지</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="${root}/admin/logout.go">로그아웃</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">
		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="${root}/admin/main.go"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Main</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${root}/admin/member.go">
					<i class="fas fa-fw fa-chart-area"></i> <span>회원관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${root}/admin/food.go">
					<i class="fas fa-fw fa-chart-area"></i> <span>음식점관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${root}/admin/coupon.go">
					<i class="fas fa-fw fa-table"></i> <span>쿠폰관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${root}/admin/purchase.go">
					<i class="fas fa-fw fa-table"></i> <span>구매관리</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${root}/admin/review.go">
					<i class="fas fa-fw fa-table"></i> <span>리뷰관리</span>
			</a></li>
		</ul>
		
		<!-- /.content-wrapper -->
</body>

</html>
