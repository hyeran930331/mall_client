<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<h1>Ebook Calendar</h1>
	

	<!-- %List<Map<String, Object>> ebookListByMonth = (List<Map<String, Object>>)request.getAttribute("ebookListByMonth");% -->
	<!--%int currentYear = (Integer) request.getAttribute("currentYear");%-->
	<!--%int currentMonth = (Integer) request.getAttribute("currentMonth");%-->
	<!--%int endDay = (Integer) request.getAttribute("endDay");%-->
	<!--%int firstDayOfWeek = (Integer) request.getAttribute("firstDayOfWeek");%-->


	<!-- n행 7열 -->
	<div>
		<a
			href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}">이전달</a>
		<span>${currentYear}년</span> <span>${currentMonth}월</span> <a
			href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}">다음달</a>
	</div>
	
	<table border="1">
		<tr>
			<td>일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>
		
		<tr>
			<c:forEach var="i" begin="1" step="1" end="${(endDay+(firstDayOfWeek-1))}">
				<c:if test="${i-(firstDayOfWeek-1) <= 0}">
					<td>&nbsp;</td> <!-- 앞에 공백. 요일숫자-1만큼 -->
				</c:if>
				
				<!-- 앞의 공백은 맞음 2:23 -->
				
				<c:if test="${i-(firstDayOfWeek-1) > 0}">
				
					<td>
						${i-(firstDayOfWeek-1)} 
						<c:forEach var="m" items="${ebookListByMonth}">
							
							<c:if test="${((i-(firstDayOfWeek-1)) == m.d)}">
								<div> 
								<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
								<c:if test="${m.ebookTitle.length() > 10}">
									 ${m.ebookTitle.substring(0,10)}...
								</c:if>
								<c:if test="${m.ebookTitle.length() <= 10}">
									 ${m.ebookTitle}...
								</c:if>
								</a>
								</div>
							</c:if>
						</c:forEach>
					</td> <!-- 날짜숫자 출력 -->
				</c:if>
				
				<!-- 숫자는 다나옴 6:04 -->
				
				<c:if test="${ i!=0 && i%7==0 }">
				<!-- 순서가 7번째이면서 순서가 0번째가 아닐때 줄을 바꾼다. -->
					</tr><tr>
				</c:if>	
			</c:forEach>
			
			<!-- 마지막 tr 이 끝난후 -->
			<c:if test="${(endDay+(firstDayOfWeek-1))%7 != 0}"> <!-- 뒤에 공백. -->
				<c:forEach var="j" begin="1" step="1" end="${(7-((endDay+firstDayOfWeek-1)%7))}">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
			
		</tr>
	</table>
</body>
</html>