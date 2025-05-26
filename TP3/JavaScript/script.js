document.addEventListener("DOMContentLoaded", function () {

    // Sélection des éléments du DOM
    const produitList = document.getElementById("produitList");
    const errorMessage = document.getElementById("errorMessage");

    // Afficher le message de chargement


    // Appel de l’API avec fetch
    fetch("http://localhost:8080/ords/commande/produit/")
        .then(function (response) {
            return response.json();
        })
        .then(function (data) {
            

            if (data && data.items && Array.isArray(data.items)) {
                if (data.items.length === 0) {
                    produitList.innerHTML = "<p>Aucun produit trouvé.</p>";
                } else {
                    afficherProduits(data.items);
                }
            } else {
                errorMessage.textContent = "Erreur : données invalides.";
                errorMessage.style.display = "block";
                console.log("Données invalides :", data);
            }
        })
        .catch(function (error) {
 
            errorMessage.textContent = "Erreur lors du chargement des produits.";
            errorMessage.style.display = "block";
            console.error("Erreur:" + error);
        });

    // Fonction pour afficher les produits
    function afficherProduits(produits) {
        produitList.innerHTML = "";

        produits.forEach(function (produit) {
            const produitCard = document.createElement("div");
            produitCard.className = "produit-card";

            const produitTitle = document.createElement("h2");
            produitTitle.textContent = produit.nom || "Produit sans nom";

            const produitDetails = document.createElement("div");
            produitDetails.className = "produit-details";

            produitDetails.innerHTML = `
                <div class="detail-row"><span class="label">ID Produit:</span><span>${produit.id_produit || "N/A"}</span></div>
                <div class="detail-row"><span class="label">Nom :</span><span>${produit.nom || "N/A"}</span></div>
                <div class="detail-row"><span class="label">Taille:</span><span>${produit.taille || "N/A"}</span></div>
                <div class="detail-row"><span class="label">Prix:</span><span>${produit.prix_unitaire || "N/A"}</span></div>
                <div class="detail-row"><span class="label">Stock unitaire:</span><span>${produit.stock || "N/A"}</span></div>
                <div class="detail-row"><span class="label">Catégorie:</span><span>${produit.categorie || "N/A"}</span></div>
            `;

            produitCard.appendChild(produitTitle);
            produitCard.appendChild(produitDetails);
            produitList.appendChild(produitCard);
        });
    }

});
