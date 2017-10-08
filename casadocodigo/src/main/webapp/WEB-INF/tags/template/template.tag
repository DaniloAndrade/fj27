<%@attribute name="extraScripts" fragment="true" %>
<%@attribute name="extraStyles" fragment="true" %>
<%@attribute name="titulo" fragment="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@tag pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <title>
        <jsp:invoke fragment="titulo"/>
    </title>

</head>
<body>

<c:url value="/produtos/form" var="urlNovo"/>
<c:url value="/produtos" var="urlProdutos"/>

<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Casa do Código</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation. We hide it in small screens. -->
            <nav class="mdl-navigation mdl-layout--large-screen-only">
                <a class="mdl-navigation__link" href="${urlNovo}">Novo Produto</a>
                <a class="mdl-navigation__link" href="${urlProdutos}">Produtos</a>
            </nav>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Casa do Código</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="${urlNovo}">Novo</a>
            <a class="mdl-navigation__link" href="${urlProdutos}">Produtos</a>
            <%--<a class="mdl-navigation__link" href="">Link</a>--%>
            <%--<a class="mdl-navigation__link" href="">Link</a>--%>
        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
            <div class="mdl-grid">
                    <c:if test="${not empty msg}">
                        <h4>${msg}</h4>
                    </c:if>
                    <jsp:doBody/>
            </div>
        </div>
    </main>

    <footer class="mdl-mini-footer">
        <div class="mdl-mini-footer__left-section">
            <div class="mdl-logo">Title</div>
            <ul class="mdl-mini-footer__link-list">
                <li><a href="#">Help</a></li>
                <li><a href="#">Privacy & Terms</a></li>
            </ul>
        </div>
    </footer>
</div>

</body>
</html>
