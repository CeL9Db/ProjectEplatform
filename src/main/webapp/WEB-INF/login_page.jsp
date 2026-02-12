<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Page de connection</title>
        <%@include file="header.jsp"%>

        <div id="body_login_page">
            <div id="top_side_main">
                <fieldset>
                    <legend><b>Login yourself to have a permission to buy some games in our store</b></legend>
                </fieldset>
            </div>
            
            <div class="container_login">
                <form method="post" action="/login">
                    <label for="email">Email:</label>
                    <span class="block_login">
                        <input type="email" placeholder="email" name="email" id="email" autocomplete="off" required class="input_login"/>
                        <i class='bx bxl-gmail'></i>
                    </span>
                    
                    <label for="password">Password:</label>
                    <span class="block_login">
                        <input type="password" placeholder="password" name="password" id="password" autocomplete="off" required class="input_login"/>
                        <i class='bx bxs-lock-alt'></i>
                    </span>
                    
                    <button type="submit" class="button">Login</button>
                </form>
                
                <br>
                
                <c:if test="${not empty error_connection}">
                    <p style="color: red;">${error_connection}</p>
                </c:if>
                
                <a href="/registerPage">Don't have an account?</a>
            </div>

            <div id="bottom_side_main">
                <fieldset>
                    <legend><b>Comment nous contacter?</b></legend>
                    <ul class="bottom_etmini_info">
                        <li class="liste_abc_none_style"><a href="/condition_de_vente">Les conditions de vente</a></li>
                        
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
                        
                        <li class="liste_abc_none_style"><a href="/politique">Politique de confidentialité</a></li>
                        <br><hr>
                        <li class="liste_abc_none_style">Copyright © 2024 Lanzz Store - All rights reserved</li>
                    </ul>
                </fieldset>
            </div>
        </div>
    </body>
</html>