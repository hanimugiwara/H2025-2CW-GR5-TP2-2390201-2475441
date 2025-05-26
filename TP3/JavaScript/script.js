document.addEventListener("DOMContentLoaded", function () {
    
    fetch("http://192.168.56.101:8080/ords/commande/produit/")
        .then(r => r.json())
        .then(data => {
            const tbody = document.querySelector("#table-produits tbody");
            data.items.forEach(p => {
                const row = document.createElement("tr");
                row.innerHTML = `<td>${p.id_produit}</td><td>${p.nom}</td><td>${p.taille}</td><td>${p.prix_unitaire.toFixed(2)}$</td><td>${p.stock}</td><td>${p.categorie}</td>`;
                tbody.appendChild(row);
            });
        })
        .catch(() => {
            const tbody = document.querySelector("#table-produits tbody");
            tbody.innerHTML = `<tr><td colspan="6">Erreur de chargement</td></tr>`;
        });
});