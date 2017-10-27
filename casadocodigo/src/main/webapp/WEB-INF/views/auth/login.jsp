<%@	taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@	taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@	taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<template:template2>
    <jsp:attribute name="titulo">
        Login
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
                        <form:form cssClass="col s12" servletRelativeAction="/login">
                            <div class="input-field col s12 ">
                                <label for="login">Usuário</label>
                                <input class="" id="login" type="text" name="username"/>
                                <form:errors path="username"  />
                            </div>

                            <div class="input-field col s12 ">
                                <label for="password">Senha</label>
                                <input class="" id="password" type="password" name="password"/>
                                <form:errors path="password"  />
                            </div>

                            <input name="submit" type="submit" value="Login">
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</template:template2>
