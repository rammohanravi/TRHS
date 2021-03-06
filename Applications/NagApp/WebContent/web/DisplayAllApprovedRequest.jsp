<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.*" %>
<%@ page import="com.nag.bean.*" %>
<%@ page import="com.nag.dao.*" %>

<%
	//EmployeeDetails empDetails = (EmployeeDetails)request.getAttribute("loginUserDetails");	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<link href="styles/styles.css" type="text/css" rel="stylesheet">
<style>
.welcomeMssg{
	color: blue;
    float: left;
    font-weight: bold;
    text-align: center;
    width: 100%;
}
.displayMssg{
	float:left;
	width:100%;
	text-align:center;
	padding-top:30px;
}
.pedningReqTable{
	float:left;
	width:100%;
	
}
.HeaderTd{
	font-weight:bold;
	padding:5px 5px 5px 0;
	width:15%;
}
</style>
</head>
<body>
<div id="mainDiv">
	<jsp:include page="header.jsp" />
	<div id="innerMainDiv">	
		<div id="contentDiv">
		
			<div id="displayAllApprovedRequest" class="pageContent">			
					
				<div class="container">
					<jsp:include page="adminMenu.jsp" />
					
					<div class="contentSection">
						<div class="heading">All Approved Requests</div>
						<div class="">
						<c:choose>
						<c:when test="${not empty allApprovedRequestMap}">
							<table class="pedningReqTable display" id="resultTable" cellspacing="0" width="100%" valign="left">
								<thead>
									<tr>
										<th class="HeaderTd" style="width:8%;">No</th>
										<th class="HeaderTd">Requested By</th>
										<th class="HeaderTd">Source</th>
										<th class="HeaderTd">Destination</th>
										<th class="HeaderTd">Travel Date</th>										
										<th class="HeaderTd">Expenses</th>
										<th class="HeaderTd">Approved Date</th>		
										<th></th>																
									</tr>
								</thead>
								<tbody>
									<c:set var="count" value="0"></c:set>
									<c:forEach items="${allApprovedRequestMap}" var="approvedRequest" varStatus="status">
									<c:set var="count" value="${count + 1}"></c:set>
									<tr>
										<td class="dataTd">${count}</td>
										<td class="dataTd">${approvedRequest.value.requestedEmpDetails.employeeName}</td>
										<td class="dataTd">${approvedRequest.value.source}</td>
										<td class="dataTd">${approvedRequest.value.destination}</td>
										<td class="dataTd">
										<fmt:formatDate value="${approvedRequest.value.travelDate}" type="date" pattern="dd-MM-yyyy" />
										</td>										
										<td class="dataTd">${approvedRequest.value.expenses}</td>
										<td class="dataTd">
										<fmt:formatDate value="${approvedRequest.value.actionDate}" type="date" pattern="dd-MM-yyyy" />
										</td>
										<td class="dataTd"><a href="TravelRequestDetails?requestFrom=owner&travelRequestMasterId=${approvedRequest.value.travelRequestMasterId}">Details</a></td>														
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</c:when>							
							<c:otherwise>
								No Approved travel requests.
							</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>				
				
			</div>
			<div class="footerPush"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</div>
<jsp:include page="DataTableImpl.jsp" />
</body>
</html>