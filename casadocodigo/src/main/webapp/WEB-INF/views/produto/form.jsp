<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Cadastro de produtos</title>
</head>
<body>
	<c:url value="/produto" var="url"/>
	<form method="post" action="${url}">
		<div>
			<label for="title">Título</label>
			<input id="title" type="text" name="title"/>
		</div>
		<div>
			<label for="description">Descrição</label>
			<textarea id="description" name="description" rows="10" cols="20"></textarea>
		</div>
		
		<div>
			<label for="numberOfPages">Número de páginas</label>
			<input id="numberOfPages" type="text" name="numberOfPages"/>
		</div>
		<c:forEach items="${types}" varStatus="status" var="bookType">
		<div>
			<label for="price_${bookType}">${bookType}</label>
			<input type="text" name="prices[${status.index}].value" id="price_${bookType}"/>
			<input type="hidden" name="prices[${status.index}].bookType" value="${bookType}" />
		</div>
		</c:forEach>
		<div>
			<input type="submit" value="Enviar"/>
		</div>
	</form>
</body>
</html>