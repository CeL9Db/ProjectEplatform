<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Page d'inscription</title>
        <link rel="stylesheet" href="style/style.css">
        <%@include file="header.jsp"%>
    </head>
    <body>
        <div id="body_login_page">
                <div id="top_side_main">
                    <fieldset>
                        <legend><b>Register yourself to have a permission to buy some games in our store</b></legend>
                    </fieldset>
                </div>
                <div class="container_login">
                    <form:form method="post" action="/register" modelAttribute="user">
                        <form:label for="nickname" path="nickname">Nickname:</form:label>
                        <span class="block_login">
                            <form:input type="text" placeholder="nickname" path="nickname" required="true" class="input_login"/>
                            <i class='bx bx-male-female'></i>
                        </span>
                        <form:label for="email" path="email">Email:</form:label>
                        <span class="block_login">
                            <form:input type="email" placeholder="email" path="email" required="true" class="input_login"/>
                            <i class='bx bxl-gmail'></i>
                        </span>
                        <form:label for="password" path="password">Password:</form:label>
                        <span class="block_login">
                            <form:input type="password" placeholder="password" path="password" required="true" class="input_login"/>
                            <i class='bx bxs-lock-alt'></i>
                        </span>
                        <form:button type="submit" class="button">Register</form:button>
                    </form:form>
                 	<c:if test="${not empty error_inscription}">
				        <p style="color: red;">${error_inscription}</p>
				    </c:if>
                    <br>
                </div>
            <div id="bottom_side_main">
                <fieldset>
                    <legend><b>Comment nous contacter?</b></legend>
                    <ul class="bottom_etmini_info">
                        <li class="liste_abc_none_style"><a href="http://localhost/myhost-exemple/condition_de_vente.php">Les conditions de vente</a></li>
						<c:choose>
						    <c:when test="${not empty sessionScope.session and sessionScope.session.loged}">
						        <li class="liste_abc_none_style">
						            <a href="/assistance_page">Contactez-nous</a>
						        </li>
						    </c:when>
						
						    <c:otherwise>
						        <li class="liste_abc_none_style">
						            Vous n'êtes pas connecté à votre compte pour écrire un message d'assistance !
						        </li>
						    </c:otherwise>
						</c:choose>
                        <li class="liste_abc_none_style"><a href="/politique_de_confidentialite">Politique de confidentialité</a></li>
                        <br><hr>
                        <li class="liste_abc_none_style">Copyright © 2024 Lanzz Store - All rights reserved</li>
                    </ul>
                </fieldset>
            </div>
        </div>
    </body>
</html>