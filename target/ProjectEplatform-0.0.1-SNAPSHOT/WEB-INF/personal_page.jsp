<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Personal page</title>
        <%@include file="header.jsp"%>
        <script src="JS/anim.js"></script>
    </head>
    <body>
        <div class="separateur"></div>
        
        <div id="pers_page">
            <div class="side_bar">
                <fieldset>
                    <legend><b>Menu</b></legend>
                    <hr>
                </fieldset>
                <a href="#dashboard" class="menu-link" data-section="dashboard">
                    <img src="icons/avatar2.svg" class="icons_sous_bar" alt="Info">
                    Mon information
                </a>
                <a href="#" onclick="alert('Fonctionnalité à venir'); return false;">
                    <img src="icons/buy.svg" class="icons_sous_bar" alt="Clés">
                    Mes clés achetées
                </a>
                <a href="#" onclick="alert('Fonctionnalité à venir'); return false;">
                    <img src="icons/comment.svg" class="icons_sous_bar" alt="Commentaires">
                    Commentaires
                </a>
                <a href="#" onclick="alert('Fonctionnalité à venir'); return false;">
                    <img src="icons/history.svg" class="icons_sous_bar" alt="Historique">
                    Historique des achats
                </a>
            </div>
            
            <div class="dashboard">
                <div class="produit_container">
                    <fieldset>
                        <legend><b>Dashboard</b></legend>
                        <hr>
                    </fieldset>
                    <h1>Vos informations:</h1>
                    <ul>
                        <li><strong>Pseudo:</strong> ${userSession.nickname}</li>
                        <li><strong>Email:</strong> ${userSession.email}</li>
                        <li><strong>Statut:</strong> <span style="color: #6b43ff; font-weight: 600;">${userSession.loged ? 'Connecté' : 'Non connecté'}</span></li>
                    </ul>
                    <a href="/" style="margin-top: 25px;">
                        <img src="icons/add.svg" class="icons_sous_bar" alt="Voir plus">
                        Voir plus de jeux
                    </a>
                </div>
            </div>
            
            <div class="complementaire">
                <fieldset>
                    <legend><b>Actions</b></legend>
                    <hr>
                </fieldset>
                
                <a href="/" style="margin-bottom: 15px;">
                    <img src="icons/buy.svg" class="icons_sous_bar" alt="Acheter">
                    Boutique
                </a>
                
                <hr>
                
                <fieldset class="links_stores_partenaires">
                    <legend style="margin-bottom: 15px; font-size: 0.9rem;">Nos Partenaires</legend>
                    <a href="https://www.instant-gaming.com/fr/" target="_blank">
                        <img src="icons/instant-gaming-seeklogo.svg" class="icons_sous_bar" alt="Instant Gaming">
                    </a>
                    
                    <c:if test="${not empty result}">
                        <a href="${result.url_fourn}" target="_blank">
                            <img src="${result.img_fourn}" alt="Partenaire"> 
                        </a>
                    </c:if>
                </fieldset>
                
                <hr>
                
                <a href="/logout" style="margin-top: 15px;">
                    <img src="icons/logout.svg" class="icons_sous_bar" alt="Déconnexion">
                    Déconnexion
                </a>
            </div>
        </div>
    </body>
</html>