<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

	

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Lanzz store</title>
        <link rel="stylesheet" href="style/style.css">
        <%@include file="header.jsp" %>
    </head>
    <body>	
        <div class="highlight_banner">
            <img src="${promotedJeu.code_visuel.highlight}" id="highlights">
            <div class="content">
                <a href="/selectedJeu?id=${promotedJeu.id}" class="banner_title">${promotedJeu.nom_produit}</a>
                <div class="prix">${promotedJeu.prix_produit} €</div>
            </div>
        </div>
        <div id="body_menu_main">
            <c:forEach items="${Jeux}" var="jeu">
            <div class="top_side_main">
                <fieldset>
                    <legend><b>Jeux les plus populaires en ce moment</b></legend>
                </fieldset>
            </div>
            <div class="card_container ${jeu.grid_placement}">
                <div class="card">
                    <div class="card_front">
                        <img src="${jeu.img}" class="games_icons">
                    </div>
                    <div class="card_back">
                        <a href="/selectedJeu?id=${jeu.id}">
                            <video muted preload="auto" autoplay="none" disablePictureInPicture poster ="${jeu.img}" class="video_background_card">
                                <source src="${jeu.video}"/>
                            </video>
                        </a>
                    </div>
                </div>
            </div>
            </c:forEach>
            <div class="above_bottom_side_main">
            <input type="checkbox" id="checker">
                <fieldset class="limited l-200">
                    <legend><b>mini information</b></legend>
                    <ul class="bottom_etmini_info">
                        <br><br>
                        <h2><b>Qu'est-ce que le Lanzz Store ?</b></h2>
                        <hr>
                        <br>
                        <li class="liste_abc_none_style">
                            Dans notre boutique en ligne, vous pouvez garantir l'achat 
                            de clés de jeux de Steam, Uplay, Battle.net et d'autres 
                            plateformes de jeux populaires. Notre boutique met tout 
                            en œuvre pour que vos achats soient rapides, avec un 
                            maximum de commodité et de sécurité, et que les prix 
                            restent aussi abordables que possible.
                        </li>
                        <li class="liste_abc_none_style">
                            Il vous suffit d'indiquer votre adresse électronique lors 
                            de la commande et de choisir un mode de paiement pratique. 
                            Vous recevrez ensuite un mot de passe vous permettant 
                            d'accéder à votre armoire personnelle, où vous recevrez 
                            une clé d'activation.
                        </li>
                        <br>
                        <h2><b>Nos avantages</b></h2>
                        <hr>
                        <br>
                        <li class="liste_abc_none_style">Une gamme de jeux toujours plus étendue</li>
                        <li class="liste_abc_none_style">
                            Le support technique du site aidera à répondre à toutes 
                            les questions qui se posent et à les résoudre rapidement.
                        </li>
                        <li class="liste_abc_none_style">Nous acceptons les paiements par carte bancaire (Visa, MasterCard) et sommes certifiés par PayPal.</li>
                        <li class="liste_abc_none_style">
                            Possibilité d'obtenir une remise allant jusqu'à 25 % lors 
                            des événements saisonniers. Plus le nombre d'achats est élevé, 
                            plus les chances d'obtenir une réduction sur les achats futurs 
                            sont grandes.
                        </li>
                        <li class="liste_abc_none_style">Nous achetons les clés en gros auprès de revendeurs agréés travaillant directement avec les éditeurs.</li>
                        <li class="liste_abc_none_style">Nous surveillons régulièrement les autres grands détaillants en ligne et sommes prêts à offrir le prix le plus bas.</li>
                        <br>
                        <li class="liste_abc_none_style">
                            Travaillant sur le marché des jeux informatiques depuis 2024, 
                            nous avons acquis une expérience inestimable, écouté attentivement 
                            toutes les opinions et tous les souhaits des acheteurs. Grâce à 
                            un travail constant, notre service devient aussi simple et pratique 
                            que possible, et la procédure d'achat devient incroyablement facile.
                        </li>
                    </ul>
            <div class="bottom_side_main">
                <fieldset>
                    <legend><b>LANZZ STORE</b></legend>
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
            <div class="bottom"></div>
                </fieldset>
                <label for="checker" class="more_button"></label>
            </div>
        </div>
       
    </body>
</html>