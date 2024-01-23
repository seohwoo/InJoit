<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>근태관리</title>
		<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
  		<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
   		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
	</head>
	<body>
		<!--  Body Wrapper -->
	  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
	    data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
	    <aside class="left-sidebar">
	      <!-- Sidebar scroll-->
	      <div>
	        <!-- Sidebar navigation-->
	        <jsp:include page="/WEB-INF/views/employee/sidebar.jsp"/>
	        <!-- End Sidebar navigation -->
	      </div>
	      <!-- End Sidebar scroll-->
	    </aside>
	    <!--  Sidebar End -->
	    <!--  Main wrapper -->
	    <div class="body-wrapper">
	     <!--  Header Start -->
      	<jsp:include page="/WEB-INF/views/employee/header.jsp"/>
      	<!--  Header End -->
	     <div class="container-fluid">
	     	<jsp:include page="/WEB-INF/views/admin/isAdmin.jsp" />
	     	<c:if test="${isAdmin}">
		     	<h1>근태관리</h1>
		     	<table border="1">
		     		<tr>
		     			<td>전체사원수</td>
		     			<td>오늘날짜</td>
		     			<td></td>
		     			<td>출근사원수</td>
		     			<td>퇴근사원수</td>
		     		</tr>
		     		<tr>
		     			<td>${empCnt}</td>
		     			<td>
		     				<fmt:formatDate value="${day}" dateStyle="long" type="date"/>
		     			</td>
		     			<td></td>
		     			<td>${onWorkCnt}</td>
		     			<td>${cnt-onWorkCnt}</td>
		     		</tr>
		     	</table>
				<c:if test="${cnt==0}">
					<h1>아직 아무도 출근을 안했어요..😝😝😝😝</h1>
				</c:if>
				<c:if test="${cnt>0}">
					<table border="1">
						<tr>
							<td>번호</td>
							<td>사원번호</td>
							<td>사원명</td>
							<td>출근</td>
							<td>퇴근</td>
						</tr>
						<c:forEach var="dto" items="${empAttendaceList}" varStatus="loopStatus">
							<c:set var="cnt" value="${empAttendaceList.size() - loopStatus.index}" />
							<tr>
								<td>${cnt}</td>
								<td>${dto.employeenum}</td>
								<td>${dto.name}</td>
								<td><fmt:formatDate value="${dto.onwork}" dateStyle="long" type="both"/></td>
								<td><fmt:formatDate value="${dto.offwork}" dateStyle="long" type="both"/></td>
							</tr>
						</c:forEach>
					</table>
					<jsp:include page="/WEB-INF/views/include/paging.jsp" />
				</c:if>
			</c:if>
	     </div>
	    </div>
	   </div>
	</body>
	<script src="/resources/libs/jquery/dist/jquery.min.js"></script>
  <script src="/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/js/sidebarmenu.js"></script>
  <script src="/resources/js/app.min.js"></script>
  <script src="/resources/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="/resources/libs/simplebar/dist/simplebar.js"></script>
  <script src="/resources/js/dashboard.js"></script>
</html>