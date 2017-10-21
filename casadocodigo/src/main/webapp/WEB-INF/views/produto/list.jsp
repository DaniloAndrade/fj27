<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%--
  Created by IntelliJ IDEA.
  User: danilosandrade
  Date: 07/10/2017
  Time: 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<template:template2>
    <jsp:attribute name="titulo">
        Products
    </jsp:attribute>
    <jsp:body>


        <div class="row">
            <c:forEach items="${products}" var="product">
                <div class="col s12 m6">
                    <div class="card blue-grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">${product.title}</span>
                            <p>${product.description}</p>
                        </div>
                        <div class="card-action">
                            <a href="${spring:mvcUrl('visualizarProduto').arg(0,product.id).build()}">Ver</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>


        <%--<div class="mdl-grid">--%>
        <%--<div class="mdl-cell mdl-cell--middle mdl-cell--6-col">--%>

        <%--<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th>ID</th>--%>
                <%--<th>Title</th>--%>
                <%--<th>Description</th>--%>
                <%--<th>NumberOfPages</th>--%>
                <%--<th>Prices</th>--%>
                <%--<th></th>--%>
            <%--</tr>--%>
            <%--</thead>--%>

            <%--<tbody>--%>
            <%--<c:forEach items="${products}" var="product">--%>
                <%--<tr>--%>
                    <%--<td>${product.id}</td>--%>
                    <%--<td>${product.title}</td>--%>
                    <%--<td>${product.description}</td>--%>
                    <%--<td>${product.numberOfPages}</td>--%>
                    <%--<td>--%>
                        <%--<c:forEach items="${product.prices}" var="price">--%>
                            <%--${price.value} - ${price.bookType}--%>
                        <%--</c:forEach>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<a href="${spring:mvcUrl('visualizarProduto').arg(0,product.id).build()}">Ver</a>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        <%--</table>--%>
        <%--</div>--%>
        <%--</div>--%>
    </jsp:body>
</template:template2>


