<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<template:template2>

    <jsp:attribute name="titulo">
         New Products
    </jsp:attribute>

    <jsp:body>

        <style>

            /*!* label color *!*/
            /*.input-field label {*/
                /*color: #000;*/
            /*}*/
            /*!* label focus color *!*/
            /*.input-field input[type=text]:focus + label {*/
                /*color: #000;*/
            /*}*/
            /*!* label underline focus color *!*/
            /*.input-field input[type=text]:focus {*/
                /*border-bottom: 1px solid #000;*/
                /*box-shadow: 0 1px 0 0 #000;*/
            /*}*/
            /* valid color */
            .input-field input[type=text].valid {
                border-bottom: 1px solid #4CAF50;
                box-shadow: 0 1px 0 0 #4CAF50;
            }
            /* invalid color */
            .input-field input[type=text].error {
                border-bottom: 1px solid #F44336;
                box-shadow: 0 1px 0 0 #F44336;
            }

            .input-field input[type=date].valid {
                border-bottom: 1px solid #4CAF50;
                box-shadow: 0 1px 0 0 #4CAF50;
            }
            /* invalid color */
            .input-field input[type=date].error {
                border-bottom: 1px solid #F44336;
                box-shadow: 0 1px 0 0 #F44336;
            }
            /*!* icon prefix focus color *!*/
            /*.input-field .prefix.active {*/
                /*color: #000;*/
            /*}*/


        </style>

        <div class="row">
            <div class="col s12 m12 l8">
                <div class="card-panel">
                    <div class="row">
                        <form method="post" action="${spring:mvcUrl("productSave").build()}" class="col s12"
                              enctype="multipart/form-data">
                            <security:csrfInput/>
                            <spring:hasBindErrors name="product">
                                <c:if test="${errors.hasFieldErrors('title')}">
                                    <c:set var="titleError" value="error"/>
                                    <c:set var="titleClass" value=".titleInvalid"/>
                                </c:if>
                                <c:if test="${errors.hasFieldErrors('description')}">
                                    <c:set var="descriptionError" value="error"/>
                                    <c:set var="descriptionClass" value=".descriptionInvalid"/>
                                </c:if>
                                <c:if test="${errors.hasFieldErrors('numberOfPages')}">
                                    <c:set var="numberOfPagesError" value="invalid"/>
                                    <c:set var="numberOfPagesMsg" value="${errors.getFieldError('numberOfPages').defaultMessage}"/>
                                </c:if>
                            </spring:hasBindErrors>
                            <div class="row">
                                <div class="input-field col s12 ">
                                        <label for="title">Título</label>
                                        <input class="${titleError}" id="title" type="text" name="title"
                                               value="${product.title}" data-error="${titleClass}"/>
                                        <form:errors path="product.title"  cssClass="titleInvalid error"/>
                                </div>
                                <div class="input-field col s12 ">
                                        <label class="" for="description">Descrição</label>
                                        <textarea class="materialize-textarea ${descriptionError}" data-error="${descriptionClass}"
                                                  required placeholder="Descrição"
                                                  name="description" rows="3" cols="20" id="description">
                                                ${product.description}
                                        </textarea>
                                        <form:errors path="product.description" cssClass="descriptionInvalid error"/>
                                    </div>
                                </div>
                                <div class="input-field col s12">
                                        <label class="" for="releaseDate">Data de Publicação</label>
                                        <input class="" id="releaseDate" type="date" name="releaseDate"
                                               value="${product.releaseDate}"/>
                                        <form:errors path="product.releaseDate" cssClass="error"/>
                                </div>
                                <div class="input-field col s12">
                                        <label class="" for="numberOfPages">Número de páginas</label>
                                        <input class="" id="numberOfPages" type="text"
                                               name="numberOfPages" value="${product.numberOfPages}"/>
                                        <form:errors path="product.numberOfPages" cssClass="error"/>
                                </div>

                                <div class="file-field input-field col s12">
                                    <div class="btn">
                                        <span>Sumário</span>
                                        <input class="" id="summary" type="file" name="summary"
                                               value="${summary}"/>
                                    </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" type="text">
                                    </div>
                                        <%--<label class="" for="summary">Sumário</label>--%>
                                        <%--<input class="" id="summary" type="file" name="summary"--%>
                                               <%--value="${summary}"/>--%>
                                        <form:errors path="summaryPath" cssClass=" error"/>
                                    </div>
                                </div>

                                <c:forEach items="${types}" varStatus="status" var="bookType">
                                    <div class="input-field col s4">
                                            <label class="" for="price_${bookType}">${bookType}</label>
                                            <input class="" type="text" name="prices[${status.index}].value"
                                                   id="price_${bookType}"
                                                   value="${product.prices[status.index].value}"/>
                                            <input type="hidden" name="prices[${status.index}].bookType" value="${bookType}"
                                                   value="${product.prices[status.index].bookType}"/>
                                    </div>
                                </c:forEach>
                                <div>
                                    <input type="submit" value="Enviar"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="mdl-grid">
            <div class="mdl-cell mdl-cell--middle mdl-cell--6-col mdl-cell--3-offset">

            </div>
        </div>
    </jsp:body>
</template:template2>

