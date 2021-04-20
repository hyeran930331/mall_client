<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clientOne</title>
</head>
<body>
	<!-- %Client client = (Client)request.getAttribute("client");% -->
	<!-- session 이라서 따로 taglib 필요없음 -->
	
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->

	<h1>고객정보</h1>
	<table border="1">
		<tr>
			<td>clientNo</td>
			<td>${client.clientNo}<!--%=client.getClientNo()%--></td>
		</tr>

		<tr>
			<td>clientMail</td>
			<td>${client.clientMail}<!--%=client.getClientMail()%--></td>
		</tr>

		<tr>
			<td>clientDate</td>
			<td>${client.clientDate}<!--%=client.getClientDate()%--></td>
		</tr>
	</table>
	<!-- UpdateClientPwController.doGet() - updateClientPw.jsp -->
	<!-- UpdateClientPwController.doPost() - ClientDao.updateClientPw() - session.invalidate() - redirect:/IndexController -->
	<a href="${pageContext.request.contextPath}/UpdateClientPwController"><button type="button">비밀번호수정</button></a>
	<!-- DeleteClinetController - CartDao.deleteCartByClient(mail),ClinetDao.deleteClient() - session.invalidate() - redirect:/IndexController -->
	<a href="${pageContext.request.contextPath}/DeleteClientController"><button type="button">회원탈퇴</button></a>
</body>
</html>



 