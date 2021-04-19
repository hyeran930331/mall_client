<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "mall.client.vo.*" %>
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
	<%
		List<Map<String, Object>> bestOrdersList = (List<Map<String, Object>>)(request.getAttribute("bestOrdersList"));
		List<Ebook> ebookList = (List<Ebook>)(request.getAttribute("ebookList"));
		List<Ebook> ebookCanByList = (List<Ebook>)(request.getAttribute("ebookCanBuyList"));
	%>
	
	<!-- 구매 순서의 best ebook 상품5개 출력 -->
	<h3>Best Ebook</h3>
	<table border="1">
		<tr>
			<%
				for(Map m : bestOrdersList) {
			%>
					<td>
						<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
						<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
						<div>
							<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=m.get("ebookNo")%>">
								<%=m.get("ebookTitle")%>
							</a>
						</div>
						
						<div>￦<%=m.get("ebookPrice")%></div>
					</td>
			<%		
				}
			%>
		</tr>
	</table>
	
	<!-- 구매가능한 category weight값 순서의 ebook 상품 출력 -->
	<h3>구매가능한 Ebook List</h3>
	<table border="1">
		<tr>
		<%
			int ii = 0;
			for(Ebook ebook : ebookList) {
				ii += 1;
		%>		
				<td>
					<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
					
					<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
					<div>
						<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>">
							<%=ebook.getEbookTitle()%>
						</a>
					</div>
					
					<div>￦<%=ebook.getEbookPrice()%></div>
				</td>
		<%
				if(ii%5==0) {
		%>
					</tr><tr>
		<%			
				}
			}
		%>
		</tr>
	</table>
	
	<!-- ebook 상품 출력 -->
	<!-- 검색 -->
	<h3>Ebook List</h3>
	<table border="1">
		<tr>
		<%
			int i = 0;
			for(Ebook ebook : ebookList) {
				i += 1;
		%>		
				<td>
					<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
					
					<!-- EbookOneController - EbookDao.selectEbookOne() - ebookOne.jsp -->
					<div>
						<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>">
							<%=ebook.getEbookTitle()%>
						</a>
					</div>
					
					<div>￦<%=ebook.getEbookPrice()%></div>
				</td>
		<%
				if(i%5==0) {
		%>
					</tr><tr>
		<%			
				}
			}
		%>
		</tr>
	</table>
	
	
</body>
</html>