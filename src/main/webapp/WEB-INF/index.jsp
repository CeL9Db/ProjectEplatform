<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8">
        <title>${selectedJeu.nom_produit}</title>
        <link rel="stylesheet" href="style/style.css">
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div class="highlight_banner">
            <img src="${selectedJeu.code_visuel.highlight}" id="highlights_absolute">
        </div>
        <div id="game_page">
            <div class="left_side_game">
                <img src="${selectedJeu.code_visuel.icon}" class="icon_jeu">
            </div>
            <div class="right_side_game">
                <span>
                	${selectedJeu.nom_produit} - ${selectedJeu.code_fourn.nom_fourn}
                    <hr>
                </span>
                <div class="sub_info">
                    <div>
                        <a href="${selectedJeu.code_fourn.url_fourn}">
                        	<img src="${selectedJeu.code_fourn.img_fourn}" class="icons_sous_bar" id="checkmark"></a>
                        <a>Téléchargement digital</a>
                        <form action="favor_page.jsp" method="post">
                            <%-- <input type="hidden" name="id_jeu" value="${selectedJeu.id_produit}"> --%>
                            <button type="submit" class="button">Ajouter au panier</button>
                        </form>
                    </div>
                    <div>
                        <span>Développeur : ${selectedJeu.code_createur.nom_createur}</span>
                        <span>Classification : ${selectedJeu.restriction_age}</span>
                        <span>Prix : ${selectedJeu.prix_produit} €</span>
                        <span>Date sortie : ${selectedJeu.date_sortie}</span>
                        <span>Genre : ${selectedJeu.code_type_produit.nom}</span>
                    </div>
                </div>
            </div>
            <div class="visuels_game">
                <div class="video_1">
                    <video preload="1" autoplay="0" controls disablePictureInPicture class="video_jeu_page">
                        <source src="${selectedJeu.code_visuel.video}">
                    </video>
                </div>             
                <div class="photo_1">
                    <img src="${selectedJeu.code_visuel.img_1}" class="photo_jeu_page">
                </div>
                <div class="photo_2">
                    <img src="${selectedJeu.code_visuel.img_2}" class="photo_jeu_page">
                </div>
                <div class="photo_3">
                    <img src="${selectedJeu.code_visuel.img_3}" class="photo_jeu_page">
                </div>
                <div class="photo_4">
                    <img src="${selectedJeu.code_visuel.img_4}" class="photo_jeu_page">
                </div>
                <div class="photo_5">
                    <img src="${selectedJeu.code_visuel.img_5}" class="photo_jeu_page">
                </div>
            </div>
            <div class="configuration_game">
                <fieldset>
                    <legend><b>configuration</b></legend>
                    <br><br>
                    <hr>
                    <h2>Minimum (1080p 30fps)</h2>
                    <hr>
                    <ul type="*">
                        <span>  
                            <li class="liste_abc_none_style">OS: Windows 10</li>
                            <li class="liste_abc_none_style">CPU: INTEL CORE I5-8400 or AMD RYZEN 3 3300X</li>
                            <li class="liste_abc_none_style">RAM: 12GB</li>
                            <li class="liste_abc_none_style">GPU:  NVIDIA GEFORCE GTX 1060 or AMD RADEON RX 580</li>
                            <li class="liste_abc_none_style">VRAM: 4 GB</li>
                            <li class="liste_abc_none_style">Direct X: 12</li>
                        </span>
                    </ul>
                    <hr>
                    <h2>Recommendée (1080p 60fps)</h2>
                    <hr>
                    <ul type="*">
                        <span>  
                            <li class="liste_abc_none_style">OS: Windows 10/11</li>
                            <li class="liste_abc_none_style">CPU: INTEL CORE I7-8700K or AMD RYZEN 5 3600X</li>
                            <li class="liste_abc_none_style">RAM: 16GB</li>
                            <li class="liste_abc_none_style">GPU: NVIDIA GEFORCE GTX 1070 or AMD RADEON RX VEGA 56</li>
                            <li class="liste_abc_none_style">VRAM : 8 GB</li>
                            <li class="liste_abc_none_style">Direct X : 12</li>
                        </span>
                    </ul>
                </fieldset>
            </div>
            <div class="actualites_game">
                <fieldset>
                    <legend><b>actualités</b></legend>
                    <br><br>
                    <div class="actualite">
                        <img src="${selectedJeu.code_visuel.actualite_1}" class="photo_jeu_page">
                        <a href="https://www.jeuxvideo.com/news/1880964/un-joueur-d-elden-ring-aurait-decouvert-une-nouvelle-arme-cachee-dans-le-dlc-le-plus-attendu-de-l-annee-shadow-of-the-erdtree.htm"><span><b>Un joueur d'Elden Ring aurait découvert une nouvelle arme cachée dans le DLC le plus attendu de l'année, Shadow of the Erdtree</b> <br><br>Shadow of the Erdtree, le DLC d’Elden Ring, c’est pour bientôt. En attendant, les joueurs s’amusent à décortiquer (deux mois après sa sortie) le trailer de l’ajout de contenu. Voici une jolie trouvaille.</span></a>
                    </div>
                    <div class="actualite">
                        <img src="${selectedJeu.code_visuel.actualite_2}" class="photo_jeu_page">
                        <a href="https://www.jeuxvideo.com/news/1875034/elphael-elden-ring-comment-rejoindre-cette-zone.htm"><span><b>Elphael Elden Ring : Comment rejoindre cette zone ?</b> <br><br>Sur Elden Ring, certaines régions sont assez facilement trouvables quand d'autres vont avoir tendance à être bien plus cachées.</span></a>
                    </div>
                    <div class="actualite">
                        <img src="${selectedJeu.code_visuel.actualite_3}" class="photo_jeu_page">
                        <a href="https://www.jeuxvideo.com/news/1873965/masque-d-okina-elden-ring-comment-et-ou-recuperer-cette-piece-d-equipement.htm"><span><b>Masque d'Okina Elden Ring : Comment et où récupérer cette pièce d'équipement ?</b> <br><br>Sur Elden Ring, vous avez de nombreuses pièces d'équipement à récupérer. Si vous vous dirigez vers un build basé sur le saignement, vous allez sûrement vouloir obtenir le Masque d'Okina. Alors, dans cet article, on vous explique comment le récupérer.</span></a>
                    </div>
                </fieldset>
            </div>

            <div class="commentaire">
                <div class="container_login">
                    <form action="commentaire.php" method="post">
                        <label for="commentaire_jeu">Laisser nous votre petit commentaire sur ce jeu :]</label>
                        <span class="block_login">
                            <input type="text" placeholder="..." name="commentaire_jeu" required class="input_login">
                            <i class='bx bx-male-female'></i>
                        </span>
                        <button type="submit" class="button">Envoyer</button>
                    </form>
                </div>
            </div>
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
                    <div class="bottom"></div>
                </fieldset>
                <label for="checker" class="more_button"></label>
            </div>
        </div>
    </body>
</html>