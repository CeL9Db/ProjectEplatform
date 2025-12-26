<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <form:label for="nickname">Nickname:</form:label>
                        <span class="block_login">
                            <form:input type="text" placeholder="nickname" name="nickname" required class="input_login"/>
                            <i class='bx bx-male-female'></i>
                        </span>
                        <form:label for="email">Email:</form:label>
                        <span class="block_login">
                            <form:input type="email" placeholder="email" name="email" required class="input_login"/>
                            <i class='bx bxl-gmail'></i>
                        </span>
                        <form:label for="password">Password:</form:label>
                        <span class="block_login">
                            <form:input type="password" placeholder="password" name="password" required class="input_login"/>
                            <i class='bx bxs-lock-alt'></i>
                        </span>
                        <form:button type="submit" class="button">Register</form:button>
                    </form:form>
                    <br>
                </div>
            <div id="bottom_side_main">
                <fieldset>
                    <legend><b>Comment nous contacter?</b></legend>
                    <ul class="bottom_etmini_info">
                        <li class="liste_abc_none_style"><a href="http://localhost/myhost-exemple/condition_de_vente.php">Les conditions de vente</a></li>
                        <?php if(isset($_SESSION['user'])) { ?>
                                <li class="liste_abc_none_style"><a href="http://localhost/myhost-exemple/assistance_page.php">Contactez-nous</a></li>
                            <?php } else { ?>
                                <li class="liste_abc_none_style">vous êtes pas connecté à votre compte pour écrire un message d'assistance !</li>
                            <?php } ?>
                        <li class="liste_abc_none_style"><a href="http://localhost/myhost-exemple/politique_de_confidentialite.php">Politique de confidentialité</a></li>
                        <br><hr>
                        <li class="liste_abc_none_style">Copyright © 2024 Lanzz Store - All rights reserved</li>
                    </ul>
                </fieldset>
            </div>
        </div>
    </body>
</html>