<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<span id="headline_menu">
    <a href="/"><img src="icons/logo_official.jpg" class="logo"></a>
    <span class="name_logo">Lanzz Store</span>
    <span class="middle_headline"><input type="text" class="search" placeholder="Search.." autocomplete="off"></span>
<span class="right_headline">
        <div class="cart-wrapper">
            <a href="/favorPage" class="cart-link">
                <img src="icons/buy.svg" class="favor_page_link">
                <c:if test="${not empty sessionScope.panier and sessionScope.panier.size() > 0}">
                    <span id="cart-count" class="cart-badge">${sessionScope.panier.size()}</span>
                </c:if>
                <c:if test="${empty sessionScope.panier or sessionScope.panier.size() == 0}">
                    <span id="cart-count" class="cart-badge" style="display:none;">0</span>
                </c:if>
            </a>

            <div class="mini-cart-dropdown">
                <div class="mini-cart-items">
                    <c:choose>
                        <c:when test="${not empty sessionScope.panier}">
                            <c:forEach items="${sessionScope.panier}" var="item">
                                <div class="mini-cart-item">
                                    <img src="${item.code_visuel.icon}" alt="game icon"> <div class="item-details">
                                        <span class="item-name">${item.nom_produit}</span>
                                        <span class="item-price">${item.prix_produit} €</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p style="padding: 10px; color: black;">Panier vide</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <div class="mini-cart-footer">
                    <a href="/favorPage" class="btn-checkout">Voir le panier / Payer</a>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test = "${not empty sessionScope.userSession and sessionScope.userSession.loged}">
                <a href="/personalPage"><img src="icons/avatar2.svg" class="button_pers_page"></a>
            </c:when>
            <c:otherwise>
                <a href="/registerPage"><img src="icons/avatar2.svg" class="button_pers_page"></a>
            </c:otherwise>
        </c:choose>
    </span>
</span>