<%@attribute name="extraScripts" fragment="true" %>
<%@attribute name="extraStyles" fragment="true" %>
<%@attribute name="titulo" fragment="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@tag pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <title>
        <jsp:invoke fragment="titulo"/>
    </title>

</head>
<body>

<%--<c:url value="/produtos/form" var="urlNovo"/>--%>
<%--<c:url value="/produtos" var="urlProdutos"/>--%>

<!-- Always shows a header, even in smaller screens. -->

<header>
    <nav class="light-blue lighten-1">
        <div class="nav-wrapper container">
            <a href="#" class="brand-logo">Casa do Código</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="${spring:mvcUrl('produtoFormulario').build()}">Novo Produto</a></li>
                <li><a href="${spring:mvcUrl('produtoList').build()}">Produtos</a></li>
            </ul>
        </div>
    </nav>
</header>


<main class="container">

    <div class="row">
        <c:if test="${not empty error}">
        <div class="m12 s12 col">
            <div class="card-panel deep-orange darken-1">
                <div class="row">
                    <div class="col l8 white-text">
                        <h5>${error.titulo}</h5>
                        <h6>${error.detalhe}</h6>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="m12 s12 col">
                <div class="card-panel green">
                    <div class="row">
                        <div class="col l8 white-text">
                            <h5>${msg.titulo}</h5>
                            <h6>${msg.detalhe}</h6>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

    <div class="row">
        <div class="col l12 s12">
            <h2>
                <jsp:invoke fragment="titulo"/>
            </h2>
        </div>
        <jsp:doBody/>
    </div>
</main>


<footer class="page-footer grey">
    <div class="container">
        <div class="row">
            <div class="col l8 s12">
                <h5 class="white-text">Title</h5>
            </div>
            <div class="col l4 s12">
                <ul>
                    <li><a class="white-text" href="#">Help</a></li>
                    <li><a class="white-text" href="#">Privacy & Terms</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            Made by <a class="orange-text text-lighten-3" href="http://materializecss.com">Caelum</a>
        </div>
    </div>
</footer>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>
</html>