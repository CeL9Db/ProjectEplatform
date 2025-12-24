<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="connectionDB.Connect" %>

	<% String currentPage = request.getServletPath(); 
		if(currentPage != null && currentPage == "/lanzz_store_main.jsp") 
		{
	    	response.sendRedirect("lanzz_store_main.jsp");
	    	return;
		}
	%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>Lanzz store</title>
        <link rel="stylesheet" href="style.css">
         <%@include file="header.jsp" %>
    </head>
    <body>
    	<%
			try(Connection connection = Connect.getConnection())
			{
				String sql = 
						"select count('nom_produit') as sum_produit, img, url, video, grid_placement " +
						"from produits " +
						"group by nom_produit, img, url, video, grid_placement " +
						"having img is not null and char_length(img) > 0 " +
						"and url is not null and char_length(url) > 0 " +
						"and video is not null and char_length(video) > 0 " +
						"and grid_placement is not null and char_length(grid_placement) > 0";
				String sql_dogma =
						"select v.highlight, p.prix_produit, p.url, p.nom_produit " + 
						"from visuel v, produits p " +
						"where p.nom_produit = 'Dragons Dogma 2' and p.nom_produit = v.jeu";
				try(PreparedStatement pstmt = connection.prepareStatement(sql); PreparedStatement pstmt_dogma = connection.prepareStatement(sql_dogma))
				{
					try(ResultSet rs = pstmt.executeQuery(); ResultSet rs_dogma = pstmt_dogma.executeQuery())
					{
						if(rs_dogma.next())
						{
			
		%>
        <div class="highlight_banner">
            <img src="<%= rs_dogma.getString("highlight") %>" id="highlights">
            <div class="content">
                <a href="<%= rs_dogma.getString("url") %>" class="banner_title"><%= rs_dogma.getString("nom_produit") %></a>
                <div class="prix"><%= rs_dogma.getFloat("prix_produit") %> €</div>
            </div>
        </div>
        <% } %>
        <div id="body_menu_main">
            <% 					
		        while(rs.next())
				{
			%>
            <div class="top_side_main">
                <fieldset>
                    <legend><b>Jeux les plus populaires en ce moment</b></legend>
                </fieldset>
                <%
					String sqlCountJeu = "SELECT COUNT(*) FROM produits";
					try (Statement st = connection.createStatement(); ResultSet rsCount = st.executeQuery(sqlCountJeu)) 
					{
					    if (rsCount.next()) {int countJeu = rsCount.getInt(1); // result of count
					
				%>
                <p>Il y'a : <%= countJeu %> jeux pour l'instant</p>
                <% 
                		}
					}
				%>
            </div>
            <div class="card_container <%= rs.getString("grid_placement") %>">
                <div class="card">
                    <div class="card_front">
                        <img src="<%= rs.getString("img") %>" class="games_icons">
                    </div>
                    <div class="card_back">
                        <a href="<%= rs.getString("url") %>">
                            <video muted preload="auto" autoplay="none" disablePictureInPicture poster ="<%= rs.getString("img") %>" class="video_background_card">
                                <source src="<%= rs.getString("video") %>"/>
                            </video>
                        </a>
                    </div>
                </div>
            </div>
            <%
				}
            %>
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
                            <?php if(isset($_SESSION['user'])) { ?>
                                <li class="liste_abc_none_style"><a href="http://localhost/myhost-exemple/assistance_page.php">Contactez-nous</a></li>
                            <?php } else { ?>
                                <li class="liste_abc_none_style">vous êtes pas connecté à votre compte pour écrire un message d'assistance !</li>
                            <?php } ?>
                            <li class="liste_abc_none_style"><a href="http://localhost/myhost-exemple/politique_de_confidentialite.php">Politique de confidentialité</a></li>
                            <br><hr>
                            <li class="liste_abc_none_style">Copyright © 2024 Lanzz Store - All rights reserved</li>
                            <hr>
                        </ul>
                </fieldset>
            </div>
            <div class="bottom"></div>
                </fieldset>
                <label for="checker" class="more_button"></label>
            </div>
        </div>
        <%
						}
					}
				}
    		catch(Exception e)
	    	{
		        out.println("Erreur: " + e.getMessage());
		        e.printStackTrace();
	    	}
		%>
    </body>
</html>