<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Panier et wishlist</title>
        <%@include file="header.jsp" %>
        <link rel="stylesheet" href="style/style.css">
    </head>
    <body>
        <div class="payement_page">
            <div class="panier_et_wishlist">
                <div class="panier">
                    <div class="headers_payement_page">
                        <h4>Panier :<hr></h4>
                    </div>
                    <div class="produit_container">
                        <c:choose>
                            <c:when test="${not empty sessionScope.panier and sessionScope.panier.size() > 0}">
                                <c:forEach items="${sessionScope.panier}" var="item" varStatus="loop">
                                    <div class="produit">
                                        <span>Nom : ${item.nom_produit}</span><br><br>
                                        <span>Createur : ${item.code_createur.nom_createur}</span><br><br>
                                        <span>Fournisseur : ${item.code_fourn.nom_fourn}</span><br><br>
                                        <span>Prix : ${item.prix_produit} €</span>
                                        
                                        <a href="/supprimer_article?id_produit=${loop.index}" style="color: red; float: right;">Supprimer l'article</a>
                                        <hr>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="produit">
                                    <span style="padding: 25px;">Votre panier est vide</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <c:set var="prix_final" value="0" />
            <c:if test="${not empty sessionScope.panier}">
                <c:forEach items="${sessionScope.panier}" var="item">
                    <c:set var="prix_final" value="${prix_final + item.prix_produit}" />
                </c:forEach>
            </c:if>

            <div class="resume_calc">
                <div class="calc">
                    <div class="headers_payement_page">
                        <h4>Resumé de votre panier :<hr></h4>
                    </div>
                    
                    <div class="produit_container">
                        <div class="produit">
                            <c:if test="${prix_final > 0}">
                                <span style="padding: 25px;"><br>Total à payer: <fmt:formatNumber value="${prix_final}" type="number" minFractionDigits="2" maxFractionDigits="2"/> €</span>
                                
                                <form action="https://www.paypal.com/signin" method="post" target="_blank">
                                    <button type="submit" class="button" style="margin-top: 20px; width: 100%;">Régler avec Paypal</button>
                                </form>
                            </c:if>
                            <c:if test="${prix_final == 0}">
                                <span style="padding: 25px;">Rien à payer</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </body>
</html>