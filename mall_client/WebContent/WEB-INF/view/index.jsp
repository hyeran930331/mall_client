<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "mall.client.vo.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- you -->
	<!-- 카테고리 -->
	<!-- 페이징 -->
	<!-- 검색 -->
	
	<!-- me -->
	<!-- 베스트 셀러 : group by절과 count()통계함수 -->
	<!-- 캘린더 -->
	
	<h1>index</h1>
	
	
	<!-- 접속자 수 -->
	
	<div>
		<div>오늘 접속자 수 : ${statsCount}</div>
		<div>전체 접속자 수 : ${total }</div>
	</div>

	<!-- 구매 순서의 best ebook 상품5개 출력 -->
	<h3>Best Ebook</h3>
	<table border="1">
		<tr>
			<!-- % List<Map<String, Object>> bestOrdersList = (List<Map<String, Object>>)(request.getAttribute("bestOrdersList")); % -->
			<!-- % for(Map m : bestOrdersList) { % -->
			<c:forEach var="m" items="${bestOrdersList}">
					<td>
						<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
						<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
						<div>
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
								${m.ebookTitle} <!-- %=m.get("ebookTitle")%-->
							</a>
						</div>
						
						<div> ${m.ebookPrice} <!--%=m.get("ebookPrice")%--> </div>
					</td>
			</c:forEach> <!--% } % -->
		</tr>
	</table>

	<!-- 구매가능한 category weight값 순서의 ebook 상품 출력 -->
	<DIV>
	<h3>구매가능한 Ebook List</h3>
	<table border="1">
		<tr>
		<!-- % List<Ebook> ebookCanBuyList = (List<Ebook>)(request.getAttribute("ebookCanBuyList")); % -->
		<!-- % for(Ebook ebook : ebookCanBuyList) { %-->
			<c:forEach var="ii" begin="0" step="1" end="${rowPerPage+1}"> <!-- % int ii = 0; %--> <!-- % ii += 1; %-->
				<td>
					<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
					
					<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
					<div>
						<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebookCanBuyList[ii].ebookNo}">
							${ebookCanBuyList[ii].ebookTitle} <!--%=ebook.getEbookTitle()%-->
						</a>
					</div>
					
					<div>￦${ebookCanBuyList[ii].ebookPrice} <!-- %=ebook.getEbookPrice()% --></div>
				</td>
					
					<c:if test="${ii !=0 && (ii+1)%5 ==0}"> <!--%if(ii%5==0) {-->
								</tr><tr>	
					</c:if> 
			</c:forEach> <!--%	} }  %-->
		</tr>
	</table>
	</DIV>
	
	<!-- ebook 상품 출력 -->
	<!-- 검색 -->
	<DIV>
	<h3>Ebook List</h3>
	<form action="${pageContext.request.contextPath}/IndexController?${selectOne}=${searchWord}">
	검색 : 
	<select>
		<option>ebookNo</option>
		<option>ebookISBN</option>
		<option>ebookTitle</option>
		<option>ebookPrice</option>
	</select>
	<input type="text" name="searchWord">
	<button type="submit">검색</button>
	</form>
	<table border="1">
		<tr>
			<th>ebookNo</th>
			<th>ebookISBN</th>
			<th>ebookTitle</th>
			<th>ebookEbookPrice</th>
			<th>ebookDate</th>
			<th>ebookState</th>
		</tr>
	
		<c:forEach var="i" begin="0" step="1" end="${rowPerPage+1}"> <!-- % int ii = 0; %--> <!-- % ii += 1; %-->
		<tr>
			
			<td>${ebookList[i].ebookNo}</td>
			<td>${ebookList[i].ebookISBN}</td>
			<td>
				<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
					<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebookList[i].ebookNo}">
						${ebookCanBuyList[i].ebookTitle} <!--%=ebook.getEbookTitle()%-->
					</a>
			</td>
			<td> ￦${ebookList[i].ebookPrice} <!-- %=ebook.getEbookPrice()% --></td>
			<td> ${ebookList[i].ebookDate}</td>
			<td>${ebookList[i].ebookState}</td>
			
		</tr>
		</c:forEach> <!--%	} }  %-->
		
	</table>
	</DIV>
	
</body>
</html>