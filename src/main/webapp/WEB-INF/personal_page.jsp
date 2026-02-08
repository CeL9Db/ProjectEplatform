<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Personal page</title>
        <%@include file="header.jsp"%>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <div class="separateur"></div>
        
        <div id="pers_page">
            <div class="side_bar">
                <fieldset>
                    <legend><b>Menu</b></legend>
                    <hr>
                </fieldset>
                <%-- 
               	<a href="/personalPage">Mon information</a>
                <a href="/personalPageCle">Tes clès achetés</a>
                <a href="/personalPageCommSup">Commentaire</a>
                <a href="/personalPageHistory">Histoire des achats</a>
                --%>
            </div>
            
            <div class="dashboard">
                <div class="produit_container">
                    <div class="produit">
                        <fieldset>
                            <legend><b>Dashboard</b></legend>
                            <hr>
                        </fieldset>
                        <h1>Vos informations:</h1>
                        <div>
                            <ul>
                                <li>nickname: ${user.nickname}</li>
                                <li>email: ${user.email}</li>
                                <li>status: ${user.loged}</li>
                            </ul>
                        </div>
                        <a href="/">
                            <img src="icons/add.svg" class="icons_sous_bar" alt="Voir plus">Voir plus de jeux
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="complementaire">
                <fieldset>
                    <legend><b>Complémentaire</b></legend>
                    <hr>
                </fieldset>
                
                <a href="/">
                    <img src="icons/buy.svg" class="icons_sous_bar" alt="Acheter"> Acheter des produits
                </a>
                
                <hr>
                
                <fieldset class="links_stores_partenaires">
                    <a href="https://www.instant-gaming.com/fr/">
                        <img src="icons/instant_gaming_logo.svg" class="icons_sous_bar" alt="Instant Gaming">
                    </a>
                    
                    <a href="${result.url_fourn}">
                        <img src="${result.img_fourn}" class="icons_sous_bar" alt="Partenaire"> 
                    </a>
                    <hr>
                </fieldset>
                
                <a href="/logout">
                    <img src="icons/logout.svg" class="icons_sous_bar" alt="Déconnexion">Logout
                </a>
            </div>
        </div>
    </body>
</html>