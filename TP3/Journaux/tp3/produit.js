function afficherProduits() {
    const url = "http://localhost:8080/ords/commande/produits/";
  
    fetch(url)
      .then(response => response.json())
      .then(data => {
        const produits = data.items;
        const tbody = document.querySelector("#tableProduits tbody");
        console.log(produits);
        produits.forEach(produit => {
          const tr = document.createElement("tr");
  
          tr.innerHTML = `
            <td>${produit.id_produit}</td>
            <td>${produit.nom}</td>
            <td>${produit.prix}</td>
            <td>${produit.stock}</td>
          `;
  
          tbody.appendChild(tr);
        });
      })
      .catch(error => console.error("Erreur lors de la récupération :", error));
  }
  
  afficherProduits();
  