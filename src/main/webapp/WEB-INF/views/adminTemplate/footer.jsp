<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Sticky Footer -->
	<!-- footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>
	<!-- Bootstrap core JavaScript-->
	<%-- <script src="${root}/resources/sb/vendor/jquery/jquery.min.js"></script> --%>
	<script type="text/javascript" src="${root}/resources/jquery/ui/jquery-ui.js"></script>
	<script
		src="${root}/resources/sb/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${root}/resources/sb/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="${root}/resources/sb/vendor/chart.js/Chart.min.js"></script>
	<script
		src="${root}/resources/sb/vendor/datatables/jquery.dataTables.js"></script>
	<script
		src="${root}/resources/sb/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${root}/resources/sb/js/sb-admin.min.js"></script>      
</body>
</html>