<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import= "mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인메뉴 -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	</div>
	<!-- cartList -->
	<h1>CartList</h1>
	<table border="1">
		<tr>
			<td>cartNo</td>
			<td>ebookNo</td>
			<td>ebookTitle</td>
			<td>cartDate</td>
			<td>삭제</td>
			<td>주문</td>
		</tr>
		<!--% for(Map<String, Object> map: cartList){ %-->
		<!--% int cartNo = (int)map.get("cartNo"); %-->
		<!--% String ebookTitle = (String)map.get("ebookTitle"); %-->
		<!--% int ebookNo = (int)map.get("ebookNo"); %-->
		<!--% String cartDate = (String)map.get("cartDate"); %-->
		
		<c:forEach var="m" items="${cartList}"> <!-- List<Map<String, Object>> cartList = (List<Map<String, Object>>)request.getAttribute("cartList"); -->
			<tr>
				<td>${m.cartNo} <!-- %cartNo%--></td>
				<td>${m.ebookNo} <!-- %ebookNo%--></td>
				<td>${m.ebookTitle} <!-- %ebookTitle%--></td>
				<td>${m.cartDate} <!-- %ecartDate%--></td>
				<!-- DeleteCartController - CartDao.deleteCart() - redirect:/CartListController -->
				<td><a href="${pageContext.request.contextPath}/DeleteCartController?ebookNo=${m.ebookNo}">삭제</a></td>
				<!-- InsertOrdersController - insertOrders(),deleteCart():ISSUE 트랜잭션처리 - reidirect:/OrdersListController -->
				<td><a href="${pageContext.request.contextPath}/InsertOrdersController?ebookNo=${m.ebookNo}">주문</a></td>
			</tr>
		</c:forEach> <!-- } -->
	</table>
</body>
</html> 