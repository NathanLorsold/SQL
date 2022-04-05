CREATE DATABASE Clicom;

USE Clicom;

CREATE TABLE CLIENT(
	cli_id INT NOT NULL,
	cli_nom VARCHAR(50),
	cli_prenom VARCHAR(50),
	cli_adresse VARCHAR(50),
	cli_ville VARCHAR(50),
	PRIMARY KEY (cli_id)
);

CREATE TABLE produit(
pro_num INT NOT NULL,
pro_libelle VARCHAR(50),
pro_description VARCHAR(50),
PRIMARY KEY(pro_num)
);

CREATE TABLE commande(
com_date DATETIME,
com_obs VARCHAR (50),
cli_num INT NOT NULL,
com_num INT NOT NULL,
FOREIGN KEY (cli_num) REFERENCES CLIENT(cli_num),
PRIMARY KEY(com_num)
);

CREATE TABLE est_compose(
est_qte INT,
pro_num INT NOT NULL,
com_num INT NOT NULL,
FOREIGN KEY (com_num) REFERENCES commande(com_num),
FOREIGN KEY (pro_num) REFERENCES produit(pro_num),
PRIMARY KEY (com_num,pro_num)
);

-- 2. ------------------------------------------------

USE Clicom;

CREATE INDEX index_cli_nom
ON CLIENT (cli_nom);

-- EXERCICE 2 ------------------------------------------------

-- 1. ---------------------------------
SELECT CompanyName,ContactName,ContactTitle,Phone 
FROM customers 
WHERE country = "France";

-- 2. ------------------------------------------

SELECT ProductName,UnitPrice 
FROM products 
JOIN suppliers ON products.SupplierID = suppliers.SupplierID 
WHERE CompanyName = "Exotic Liquids";

-- 3. ------------------------------------------

-- Renommer la table order details -> order_details.

SELECT DISTINCT CompanyName AS "Fournisseur", order_details.ProductID AS "Nbre produits"
FROM suppliers 
JOIN products ON suppliers.SupplierID = products.SupplierID JOIN order_details ON products.ProductID = order_details.ProductID 
WHERE country = "France" 
ORDER BY order_details.ProductID desc;

SELECT DISTINCT CompanyName,UnitsInStock 
FROM suppliers 
JOIN products ON suppliers.SupplierID = products.SupplierID JOIN order_details ON products.ProductID = order_details.ProductID 
WHERE country = "France" 
ORDER BY UnitsInStock desc;

SELECT CompanyName AS "Fournisseur", COUNT(order_details.ProductID) AS "Nbre produits"
FROM suppliers 
JOIN products ON suppliers.SupplierID = products.SupplierID JOIN order_details ON products.ProductID = order_details.ProductID 
WHERE country = "France"
-- Sans le group by on détecte uniquement une entreprise ?
GROUP BY order_details.ProductID
-- Sans le nom de la table avant 
ORDER BY order_details.ProductID DESC;

SELECT DISTINCT CompanyName AS "Fournisseur", count(distinct order_details.ProductID) AS "Nbre produits"
FROM suppliers 
JOIN products ON suppliers.SupplierID = products.SupplierID JOIN order_details ON products.ProductID = order_details.ProductID 
WHERE country = "France"
GROUP BY CompanyName
ORDER BY order_details.ProductID desc;

-- 4. --------------------------------------------------------------------------------------

SELECT ShipName AS "Client", count(orders.OrderID) AS "Nbre commandes"
FROM orders JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE ShipCountry LIKE "France"
GROUP BY Shipname;

-- 5. ------------------------------------------------------------------------------------------------------

SELECT ShipName,ShipCountry, SUM(products.UnitPrice)
FROM orders JOIN order_details ON orders.OrderID=order_details.OrderID JOIN products ON order_details.ProductID=products.ProductID
GROUP BY ShipName,ShipCountry;

-- La condition ne fonctionne pas ='(

-- 6. -----------------------------------------------------------------------------------------------------------

SELECT DISTINCT customers.Country, suppliers.CompanyName
FROM suppliers JOIN products ON suppliers.SupplierID = products.SupplierID 
JOIN order_details ON products.ProductID = order_details.ProductID 
JOIN orders ON order_details.OrderID = orders.OrderID 
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE suppliers.CompanyName = "Exotic Liquids"
ORDER BY customers.Country asc;

-- Avec l'attribut "produit fournis"

SELECT DISTINCT customers.Country AS "Pays"
FROM suppliers JOIN products ON suppliers.SupplierID = products.SupplierID 
JOIN order_details ON products.ProductID = order_details.ProductID 
JOIN orders ON order_details.OrderID = orders.OrderID 
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE suppliers.CompanyName = "Exotic Liquids"
ORDER BY customers.Country asc;


-- 7. ------------------------------------------------------------------------------------------------------------

SELECT sum(order_details.UnitPrice),sum(order_details.Quantity),orders.OrderDate 
FROM products JOIN order_details ON products.ProductID = order_details.ProductID JOIN orders ON order_details.OrderID = orders.OrderID 
GROUP BY order_details.UnitPrice
HAVING OrderDate = 1997; 

SELECT order_details.UnitPrice,order_details.Quantity,sum(order_details.UnitPrice) + sum(order_details.Quantity) AS "Total", OrderDate 
FROM products JOIN order_details ON products.ProductID = order_details.ProductID JOIN orders ON order_details.OrderID = orders.OrderID
WHERE OrderDate > 1996;

SELECT sum(order_details.UnitPrice) * sum(order_details.Quantity) / COUNT(order_details.OrderID) AS "Montant Ventes 97"
FROM products JOIN order_details ON products.ProductID = order_details.ProductID JOIN orders ON order_details.OrderID = orders.OrderID
WHERE OrderDate BETWEEN 19970101 AND 19971231;

-- Toujours pas fini lolilol

-- 8. -----------------------------------------------------------------------

SELECT MONTH(orders.OrderDate) AS "Mois 97", sum(order_details.UnitPrice) * sum(order_details.Quantity) / COUNT(order_details.OrderID) AS "Montant Ventes 97"
FROM products JOIN order_details ON products.ProductID = order_details.ProductID JOIN orders ON order_details.OrderID = orders.OrderID
WHERE orders.OrderDate BETWEEN 19970101 AND 19971231
GROUP BY MONTH(orders.OrderDate);

-- 9. --------------------------------------------------------------------------

SELECT orders.OrderDate AS "Date de dernière commande"
FROM orders JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE customers.CompanyName = "Du monde entier"
ORDER BY orders.OrderDate DESC
LIMIT 1;

-- 10. -------------------------------------------------------

SELECT AVG(DATEDIFF(orders.ShippedDate,orders.OrderDate)) AS "Délai moyen de livraison en jours"
FROM orders;
