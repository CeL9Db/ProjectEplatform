<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Mon Panier | Lanzz Store</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <%@include file="header.jsp" %>
        
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>    <%-- customized icons --%>
    </head>
    <body>
        
        <c:set var="prix_final" value="0" />
        <c:if test="${not empty sessionScope.panier}">
            <c:forEach items="${sessionScope.panier}" var="item">
                <c:set var="prix_final" value="${prix_final + item.prix_produit}" />
            </c:forEach>
        </c:if>

        <div class="payement_page">
            
            <div class="panier_et_wishlist">
                <div class="headers_payement_page">
                    <h4>Mon Panier <span style="font-size: 0.8em; color: #888; font-weight: normal;">(${sessionScope.panier != null ? sessionScope.panier.size() : 0} articles)</span></h4>
                </div>
                
                <div class="produit_container">
                    <c:choose>
                        <c:when test="${not empty sessionScope.panier and sessionScope.panier.size() > 0}">
                            <c:forEach items="${sessionScope.panier}" var="item" varStatus="loop">
                                <div class="produit" id="product-${loop.index}">
                                    
                                    <img src="${item.code_visuel.icon}" alt="${item.nom_produit}" onerror="this.src='images/default_game.png'">
                                    
                                    <div class="produit-info">
                                        <span class="produit-name">${item.nom_produit}</span>
                                        <span class="produit-meta">
                                            <i class='bx bxs-user-detail'></i> ${item.code_createur.nom_createur} <br>
                                            <i class='bx bx-store-alt'></i> ${item.code_fourn.nom_fourn}
                                        </span>
                                    </div>
                                    
                                    <div class="produit-price">
                                        <fmt:formatNumber value="${item.prix_produit}" type="number" minFractionDigits="2" maxFractionDigits="2"/> €
                                    </div>
                                    
                                    <a href="/supprimer_article?id_produit=${loop.index}" class="delete-button" title="Supprimer">
                                        <i class='bx bx-trash'></i> Supprimer
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        
                        <c:otherwise>
                            <div style="text-align: center; padding: 40px; color: #888;">
                                <i class='bx bx-cart-alt' style="font-size: 4rem; margin-bottom: 20px; opacity: 0.5;"></i>
                                <h3>Votre panier est vide</h3>
                                <p>Découvrez nos jeux et commencez votre collection !</p>
                                <a href="/" class="more_button" style="margin-top: 20px; text-decoration: none;">Retourner au magasin</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <c:if test="${prix_final > 0}">
                <div class="resume_calc">
                    <div class="headers_payement_page">
                        <h4>Résumé de la commande</h4>
                    </div>
                    
                    <div class="produit_container">
                        <div class="total-row">
                            <span class="total-label">Sous-total</span>
                            <span style="color: #fff;"><fmt:formatNumber value="${prix_final}" type="number" minFractionDigits="2"/> €</span>
                        </div>
                        <div class="total-row" style="border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 20px; margin-bottom: 20px;">
                            <span class="total-label">Remise</span>
                            <span style="color: #77ff77;">0.00 €</span>
                        </div>
                        
                        <div class="total-row">
                            <span class="total-label">Total à payer</span>
                            <span class="total-amount"><fmt:formatNumber value="${prix_final}" type="number" minFractionDigits="2"/> €</span>
                        </div>
                        
                        <form action="https://www.paypal.com/signin" method="post" target="_blank">
                            <button type="submit" class="paypal-btn">
                                <i class='bx bxl-paypal' style="font-size: 1.5rem;"></i> Payer avec PayPal
                            </button>
                        </form>
                        
                        <div style="margin-top: 15px; text-align: center; font-size: 0.8rem; color: #888;">
                            <i class='bx bx-lock-alt'></i> Paiement 100% sécurisé
                        </div>
                    </div>
                </div>
            </c:if>
        </div>  
        
        <script>
            document.querySelectorAll('.delete-button').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    const card = this.closest('.produit');
                    card.style.transform = 'translateX(100px)';
                    card.style.opacity = '0';
                });
            });
        </script>
        <br><hr>
        <span class="liste_abc_none_style">Copyright © 2024 Lanzz Store - All rights reserved</span>
    </body>
</html>