<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<span id="headline_menu">
    <a href="/"><img src="icons/logo_official.jpg" class="logo"></a>
    <span class="name_logo">Lanzz Store</span>
    <span class="middle_headline"><input type="text" class="search" placeholder="Search.." autocomplete="off"></span>
    <span class="right_headline">
        <a href="/favor_page"><img src="icons/buy.svg" class="favor_page_link"></a>
        <c:choose>
        	<c:when test = ${not empty sessionScope.session and sessionScope.session.loged}>
        		<a href="/loginPage"><img src="icons/avatar2.svg" class="button_pers_page"></a>
        	</c:when>
        	<c:otherwise>
        		<a href="/registerPage"><img src="icons/avatar2.svg" class="button_pers_page"></a>
        	</c:otherwise>
        </c:choose>
    </span>
</span>