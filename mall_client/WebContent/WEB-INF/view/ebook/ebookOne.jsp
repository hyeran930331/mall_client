<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "mall.client.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Ebook ebook = (Ebook)request.getAttribute("ebook");
%>
	<div>
		<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	</div>

	<h1>ebookOne</h1>
	<table border="1">
		<tr>
			<td>ebookTitle</td>
			<td>${ebookList[0].ebookTitle}</td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>${ebookList[0].CategoryName}</td>
		</tr>
		<tr>
			<td>작가</td>
			<td>${ebookList[0].EbookAuthor}</td>
		</tr>
		<tr>
			<td>출판사</td>
			<td>${ebookList[0].EbookCompany}</td>
		</tr>
		<tr>
			<td>ISBN</td>
			<td>${ebookList[0].EbookISBN}</td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td>${ebookList[0].EbookDate()}</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>${ebookList[0].EbookPrice}</td>
		</tr>
		<tr>
			<td>페이지 수</td>
			<td>${ebookList[0].EbookPageCount}</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><img src="${pageContext.request.contextPath}/img/default.jpg"></td>
		</tr>
		<tr>
			<td>소개</td>
			<td>${ebookList[0].EbookSummary}</td>
		</tr>
		<tr>
			<td>상태</td>
			<td>${ebookList[0].EbookState}</td>
		</tr>
	</table>
	<!-- InsertCartController?ebookNo - cartDao.insertCart() -> redirect:CartListController -->
	<!-- 로그인 중이거나 판매중이 아니면 버튼을 누를 수 없음 -->
	<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebookList[0].EbookNo}"> <!--% if(session.getAttribute("loginClient") == null || !ebook.getEbookState().equals("판매중")){ %-->
		
		<c:if test="${loginClient == null || !ebookState.equals("판매중") }">
				<button type="submit" disabled="disabled">장바구니추가</button>
		</c:if>
		
		<c:if test="${loginClient !=null or ebookState.equals("판매중")}"><!--% } else { %-->
				<button type="submit">장바구니추가</button>
		</c:if>		<!--% } %-->	
		
	</a>
	<!-- 바로구매...? -->
	<!-- 리뷰 -->
	<!-- 별점...? -->
</body>
</html>