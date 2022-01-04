/*Récupère la somme des prix des commandes passées par le client 10*/
SELECT SUM(prixCommande) FROM Commande 
WHERE idClient=10;

/*Renvoie tout les noms de fournisseur qui fournisse un produit*/
SELECT nomFournisseur
FROM Fournisseur
where identifiantFournisseur IN (SELECT identifiantFournisseur
                                 FROM Fournir);
                                 
/*Récuperer l'id produit et l'identifiant de promotion pour les pourcentage de reduction superieur ou egal a 35*/
SELECT idProduit, identifiantPromotion
FROM Reduire
Where pourcentage >= 35
Order by pourcentage;

/* Retourne les id distinctes des commandes qui contiennent des produits appartenant à la catégorie Batterie */
SELECT DISTINCT idCommande 
FROM SeTrouver
WHERE idProduit IN (SELECT idProduit
					FROM Produit
					WHERE identifiantCategorie IN (SELECT identifiantCategorie
													FROM categorieProduit
													WHERE nomCategorie = 'Batterie'));
                         
/*Récupère toutes les infos sur les clients qui n'ont passé aucune commande*/
SELECT * FROM Client
WHERE idClient IN(
    SELECT idClient FROM Client
    MINUS
    SELECT idClient FROM Commande
)
/*Retourne les infos sur les clients 5,6 & 7*/

/*Renvoie l'idProduit et sa quantité des produits dont le prix est superieur a 100 du plus chère au moins chère */
SELECT quantite , idProduit
FROM SeTrouver s
JOIN Produit p ON p.idProduit=s.idProduit
WHERE prixProduit > 100
ORDER BY DESC;

/*Récupère le nom des clients qui sont des VIP mais également qui ont acheté un instrument dans la catégorie guitare*/
SELECT nomClient FROM Client
WHERE idClient IN(
    SELECT idClient FROM CategorieClient
    WHERE nomCategorieClient='VIP'
    INTERSECT
    SELECT idClient FROM Commande
    WHERE idCommande IN(
        SELECT idProduit FROM Produit
        WHERE identifiantCategorie IN(
            SELECT identifiantCategorie FROM CategorieProduit
            WHERE nomCategorie='Guitare'
        )
    )
)
/*Retourne Bigard*/

/*Pour chaque ville de résidence (qui possède des clients), on indique l'identifiant de la ville de résidence ainsi que le nombre de clients de la ville.*/
SELECT idVilleResidence, COUNT(idClient) AS NBCLIENT
FROM Client
GROUP BY idVilleResidence;

/*Pour chaque département (qui possède des villes), on indique l'identifiant du département ainsi que le nombre de ville du département.*/
SELECT identifiantDepartement, COUNT(identifiantVille) AS NBVILLE
FROM Ville
GROUP BY identifiantDepartement;

/*Pour chaque client, on indique le code du client ainsi que le nombre de commande passé*/
SELECT idClient, COUNT(idCommande) AS NBCOMMANDES
FROM Commande 
GROUP BY idClient;

/*Retourne le prix moyen des commandes */
SELECT AVG(prixCommande) AS prixMoyen
FROM Commande;
/*41,167*/
