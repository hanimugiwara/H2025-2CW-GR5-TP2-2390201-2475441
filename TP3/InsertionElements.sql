
-- DONNÉES DE TEST


--  Clients
INSERT INTO client (nom, email) VALUES ('Lucas Martin', 'lucas.martin@gmail.com');
INSERT INTO client (nom, email) VALUES ('Alice Tremblay', 'alice.t@gmail.com');
INSERT INTO client (nom, email) VALUES ('Marc Dufresne', 'marc.d@gmail.com');
INSERT INTO client (nom, email) VALUES ('Sophie Leclerc', 'sophie.l@gmail.com');
INSERT INTO client (nom, email) VALUES ('Nicolas Roy', 'nicolas.r@gmail.com');

--  Produits
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('XT', 8, 359.99, 50, 'Homme');
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('K1', 8, 239.99, 50, 'Homme');
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('LP', 9, 199.99, 50, 'Homme');

INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('ML', 7, 359.99, 50, 'Femme');
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('Z4', 6, 239.99, 55, 'Femme');
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('OX', 7, 199.99, 50, 'Femme');

INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('E1', 5, 79.99, 40, 'Enfant');
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('E3', 4, 67.99, 25, 'Enfant');
INSERT INTO produit (nom, taille, prix_unitaire, stock, categorie) VALUES ('E9', 5, 99.99, 60, 'Enfant');

--  Commandes 
INSERT INTO commande (date_commande, quantite, prix, client_id_client, produit_id_produit)
VALUES (SYSDATE, 1, 359.99, 1, 1);  -- Lucas → XT

INSERT INTO commande (date_commande, quantite, prix, client_id_client, produit_id_produit)
VALUES (SYSDATE, 2, 479.98, 2, 2);  -- Alice → 2x K1

INSERT INTO commande (date_commande, quantite, prix, client_id_client, produit_id_produit)
VALUES (SYSDATE, 1, 199.99, 3, 3);  -- Marc → LP

INSERT INTO commande (date_commande, quantite, prix, client_id_client, produit_id_produit)
VALUES (SYSDATE, 1, 239.99, 4, 5);  -- Sophie → Z4

INSERT INTO commande (date_commande, quantite, prix, client_id_client, produit_id_produit)
VALUES (SYSDATE, 3, 599.97, 5, 6);  -- Nicolas → 3x OX

INSERT INTO commande (date_commande, quantite, prix, client_id_client, produit_id_produit)
VALUES (SYSDATE, 1, 359.99, 1, 4);  -- Lucas → ML

-- Paniers
INSERT INTO panier (quantite, client_id_client, commande_id_commande)
VALUES (1, 1, 1);  -- Lucas → XT

INSERT INTO panier (quantite, client_id_client, commande_id_commande)
VALUES (2, 2, 2);  -- Alice → K1

INSERT INTO panier (quantite, client_id_client, commande_id_commande)
VALUES (1, 3, 3);  -- Marc → LP

INSERT INTO panier (quantite, client_id_client, commande_id_commande)
VALUES (1, 4, 4);  -- Sophie → Z4

INSERT INTO panier (quantite, client_id_client, commande_id_commande)
VALUES (3, 5, 5);  -- Nicolas → OX

-- Deuxième panier de Lucas → ML
INSERT INTO panier (quantite, client_id_client, commande_id_commande)
VALUES (1, 1, 6);
