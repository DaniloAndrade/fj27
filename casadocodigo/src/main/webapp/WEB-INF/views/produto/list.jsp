<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>
<%--
  Created by IntelliJ IDEA.
  User: danilosandrade
  Date: 07/10/2017
  Time: 09:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<template:template>
    <jsp:attribute name="titulo">
        Products
    </jsp:attribute>
    <jsp:body>
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--middle mdl-cell--6-col">

                <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>NumberOfPages</th>
                        <th>Prices</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${products}" var="product">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.title}</td>
                            <td>${product.description}</td>
                            <td>${product.numberOfPages}</td>
                            <td>
                                <c:forEach items="${product.prices}" var="price">
                                    ${price.value} - ${price.bookType}
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </jsp:body>
</template:template>


