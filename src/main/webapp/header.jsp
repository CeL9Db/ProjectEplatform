<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="connectionDB.Connect" %>


<span id="headline_menu">
    <a href="lanzz_store_main.jsp"><img src="Icons_complémentaire/logo_official.jpg" class="logo"></a>
    <span class="name_logo">Lanzz Store</span>
    <span class="middle_headline"><input type="text" class="search" placeholder="Search.." autocomplete="off"></span>
    <span class="right_headline">
        <a href="http://localhost/myhost-exemple/favor_page.php"><img src="Icons_complémentaire/buy.svg" class="favor_page_link"></a>
        <?php if(isset($_SESSION['user'])) { ?>
        <a href="http://localhost/myhost-exemple/personal_page.php"><img src="Icons_complémentaire/avatar2.svg" class="button_pers_page"></a>
        <?php } else { ?>
        <a href="http://localhost/myhost-exemple/login_page.php"><img src="Icons_complémentaire/avatar2.svg" class="button_pers_page"></a>
        <?php } ?>
    </span>
</span>