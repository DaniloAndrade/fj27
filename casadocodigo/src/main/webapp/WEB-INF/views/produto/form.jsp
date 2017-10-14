<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<template:template>

    <jsp:body>
        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--middle mdl-cell--6-col mdl-cell--3-offset">
                <form method="post" action="${spring:mvcUrl("productSave").build()}">

                    <spring:hasBindErrors name="product">
                        <c:if test="${errors.hasFieldErrors('title')}">
                            <c:set var="titleError" value="is-invalid"/>
                        </c:if>
                        <c:if test="${errors.hasFieldErrors('description')}">
                            <c:set var="descriptionError" value="is-invalid"/>
                        </c:if>
                        <c:if test="${errors.hasFieldErrors('numberOfPages')}">
                            <c:set var="numberOfPagesError" value="is-invalid"/>
                        </c:if>
                    </spring:hasBindErrors>
                    <div class="mdl-grid">
                        <div class="mdl-cell mdl-cell--middle mdl-cell--12-col">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label ${titleError}">
                                <input class="mdl-textfield__input" id="title" type="text" name="title"
                                       value="${product.title}"/>
                                <label class="mdl-textfield__label" for="title">Título</label>
                                <form:errors path="product.title" cssClass="mdl-textfield__error"/>
                            </div>
                        </div>
                        <div class="mdl-cell mdl-cell--middle mdl-cell--12-col">
                            <div class="mdl-textfield mdl-js-textfield ${descriptionError}">
                                <label class="mdl-textfield__label" for="description">Descrição</label>
                                <textarea class="mdl-textfield__input" required placeholder="Descrição"
                                          name="description" rows="3" cols="20" id="description">
                                        ${product.description}
                                </textarea>
                                <form:errors path="product.description" cssClass="mdl-textfield__error"/>
                            </div>
                        </div>
                        <div class="mdl-cell mdl-cell--middle mdl-cell--12-col">
                            <div class="mdl-textfield mdl-js-textfield ${titleError}">
                                <input class="mdl-textfield__input" id="releaseDate" type="date" name="releaseDate"
                                       value="${product.releaseDate}"/>
                                <label class="mdl-textfield__label" for="title">Data de Publicação</label>
                                <form:errors path="product.releaseDate" cssClass="mdl-textfield__error"/>
                            </div>
                        </div>
                        <div class="mdl-cell mdl-cell--middle mdl-cell--12-col">
                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label ${numberOfPagesError}">
                                <input class="mdl-textfield__input" id="numberOfPages" type="text"
                                       name="numberOfPages" value="${product.numberOfPages}"/>
                                <label class="mdl-textfield__label" for="numberOfPages">Número de páginas</label>
                                <form:errors path="product.numberOfPages" cssClass="mdl-textfield__error"/>
                            </div>
                        </div>
                        <c:forEach items="${types}" varStatus="status" var="bookType">
                            <div class="mdl-cell mdl-cell--4-col">
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" name="prices[${status.index}].value"
                                           id="price_${bookType}"
                                           value="${product.prices[status.index].value}"/>
                                    <label class="mdl-textfield__label" for="price_${bookType}">${bookType}</label>
                                    <input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"
                                           value="${product.prices[status.index].bookType}"/>
                                </div>
                            </div>
                        </c:forEach>
                        <div>
                            <input type="submit" value="Enviar"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</template:template>

