/*Récupère la somme des prix des commandes passées par le client 10*/
SELECT SUM(prixCommande) FROM Commande 
WHERE idClient=10;

/*Renvoie tout les noms de fournisseur qui fournisse un produit*/
SELECT nomFournisseur
FROM Fournisseur
where identifiantFournisseur IN (SELECT identifiantFournisseur
                                 FROM Fournir);
