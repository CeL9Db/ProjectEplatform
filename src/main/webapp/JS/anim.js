document.addEventListener('DOMContentLoaded', () => {
    /* /////////////////////////////////////////
                RECHERCHE INSTANTANÉE
       ///////////////////////////////////////// */
    const searchInput = document.querySelector('.search');
    const gameCards = document.querySelectorAll('.card_container');

    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            const searchValue = e.target.value.toLowerCase();

            gameCards.forEach(container => {
                // On cherche le titre du jeu dans l'attribut ALT du tag 'image'
                const img = container.querySelector('.games_icons');
                const gameTitle = img ? img.getAttribute('alt').toLowerCase() : '';

                // Si le titre contient ce qu'on tape, on affiche, sinon on cache
                if (gameTitle.includes(searchValue)) {
                    container.style.display = 'block';
                    // Animation d'apparition douce
                    container.style.opacity = '1';
                    container.style.transform = 'scale(1)';
                } else {
                    container.style.display = 'none';
                    container.style.opacity = '0';
                    container.style.transform = 'scale(0.8)';
                }
            });
        });
    }
	
    /*  ////////////////////////////////////////////////
        Faire apparaître les éléments touchés fluidement
        //////////////////////////////////////////////// */

	const revealElements = document.querySelectorAll('.card_container, .top_side_main, .visuels_game, .actualite, .configuration_game .liste_abc_none_style');  // les éléments touchés

	    revealElements.forEach(el => el.classList.add('reveal'));

	    const revealObserver = new IntersectionObserver((entries) => {
	        entries.forEach(entry => {
	            if (entry.isIntersecting) {
	                entry.target.classList.add('active');
	                revealObserver.unobserve(entry.target); 
	            }
	        });
	    }, {
	        threshold: 0.1 // le script se déclanche quand on voie 10% du contenu
	    });
		revealElements.forEach(el => revealObserver.observe(el));

    /*  ////////////////////////////////////////////
            Effet de paralaxe sur le jeu promoté
        //////////////////////////////////////////// */
    const banner = document.querySelector('.highlight_banner img');
        
        if(banner) {
            document.addEventListener('mousemove', (e) => {
                const x = (window.innerWidth - e.pageX * 2) / 100;
                const y = (window.innerHeight - e.pageY * 2) / 100;
                banner.style.transform = `translateX(${x}px) translateY(${y}px) scale(1.1)`;
            });
        }
});

function addToPanier(id_produit) 
{
    fetch('/addToFav?id_produit=' + id_produit, {method: 'POST'})
        .then(response => response.json())
        .then(panierItems => {
            /////////////////// à changer l'alert par qqchose de plus beau ///////////////////
            alert("Jeu ajouté !");
        
            // on update le petit count des jeux présents dans le panier
            let count = document.getElementById("cart-count");
            if (count) 
            {
                count.innerText = panierItems.length;
                count.style.display = "block";
            }
            updateMiniCartHtml(panierItems);
        })
        .catch(error => console.error('Erreur:', error));
}

    /*  ////////////////////////////////////////////
                    update mini-cart
        //////////////////////////////////////////// */
function updateMiniCartHtml(items) {
    let container = document.querySelector(".mini-cart-items");
    
    // delete of the previous info
    container.innerHTML = "";

    if (items.length === 0) {
        container.innerHTML = '<p style="padding: 10px; color: black;">Panier vide</p>';
        return;
    }

    items.forEach(game => {
        let html = `
            <div class="mini-cart-item">
                <img src="${game.code_visuel.icon}" alt="game icon">
                <div class="item-details">
                    <span class="item-name">${game.nom_produit}</span>
                    <span class="item-price">${game.prix_produit} €</span>
                </div>
            </div>
        `;
        container.insertAdjacentHTML('beforeend', html);
    });
}
