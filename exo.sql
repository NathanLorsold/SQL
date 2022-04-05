-- //////////////////////////////////////////////////////////////////////////////////////////////
-- Copier coller les lignes de code de sql dans un fichier ici afin de les réutiliser sur sql.
-- //////////////////////////////////////////////////////////////////////////////////////////////

-- Création de la base Garage.

DROP DATABASE IF EXISTS garage; 

CREATE DATABASE garage;  

USE garage; 

CREATE TABLE voiture ( 
    voit_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    voit_marque VARCHAR(50) NOT NULL, 
    voit_prix INT 
); 

INSERT INTO voiture (voit_id, voit_marque, voit_prix) VALUES (1, 'Audi', 29990); 
INSERT INTO voiture (voit_id, voit_marque, voit_prix) VALUES (2, 'BMW', 8500); 
INSERT INTO voiture (voit_id, voit_marque, voit_prix) VALUES (3, 'Ford', 15550); 

-- ///////////////////////////////////////////////
-- Création d'une BDD avec insertion de tables.
-- ///////////////////////////////////////////////

-- Détruit la base de données ciblés.

DROP DATABASE IF EXISTS NOM_DE_LA_BASE;

-- Création de la base de données.

CREATE DATABASE NOM_DE_LA_BASE; 

-- Utilisation de la base de données.

DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel;

USE hotel;

CREATE TABLE hotel (
num_hotel INT Primary key NOT NULL,
capacite_hotel VARCHAR(50) NOT NULL,
categorie_hotel VARCHAR(50) NOT NULL,
nom_hotel VARCHAR(50) NOT NULL,
adresse_hotel VARCHAR(50) NOT NULL,
num_station VARCHAR(50) NOT NULL
);

CREATE TABLE clients (
num_client INT PRIMARY KEY NOT NULL ,
adresse_client VARCHAR (50) NOT NULL,
nom_client VARCHAR(50) NOT NULL,
prenom_client VARCHAR(50) NOT NULL
);

CREATE TABLE Chambre (
num_chambre INT PRIMARY KEY NOT NULL,
capacite_chambre VARCHAR(50) NOT NULL,
degre_confort VARCHAR(50) NOT NULL,
exposition VARCHAR(50) NOT NULL,
type_chambre VARCHAR(50) NOT NULL,
num_hotel int NOT NULL,
FOREIGN KEY (num_hotel) REFERENCES hotel (num_hotel)
);

CREATE TABLE Reservation (
date_debut VARCHAR(50) NOT NULL,
date_fin VARCHAR(50) NOT NULL,
date_reservation VARCHAR(50) NOT NULL,
montant_arrhes NUMERIC(50) NOT NULL,
prix_total VARCHAR(50) NOT NULL,
num_chambre INT NOT NULL,
num_client INT NOT NULL,
FOREIGN KEY (num_chambre) REFERENCES Chambre (num_chambre),
FOREIGN KEY (num_client) REFERENCES clients (num_client)
);
CREATE TABLE Station (
num_station INT NOT NULL AUTO_INCREMENT,
nom_station VARCHAR(50) NOT NULL,
PRIMARY KEY (num_station)
);

exo 2 :

admin
N@thandu972
util1 
mdp:nathan123
util2
mdp:nathan123
util3
mdp:nathan123

GRANT PRIVILEGES
ON hotel.*
TO util1@'%';
WITH GRANT OPTION;
FLUSH PRIVILEGES;

GRANT SELECT
ON hotel.*
TO util2@'%'; 
FLUSH PRIVILEGES;

GRANT SELECT
ON station.*
TO util3@'%';
FLUSH PRIVILEGES;

-- On peut retrouver la ligne de code écrite dans chaque bdd dans l'onglet CODE CREATE !

CREATE TABLE Employes (
    emp_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    emp_matricule INT NOT NULL,
    emp_nom VARCHAR(50) NOT NULL,
    emp_prenom VARCHAR(50) NOT NULL,
    emp_dep CHAR(3) NOT NULL,
    emp_salaire DECIMAL(6,2)
);

INSERT INTO Employes (emp_id, emp_matricule, emp_nom, emp_prenom, emp_dep, emp_salaire)
VALUES (1, 140, 'TIFIET', 'Tarek', 30, 2100)

INSERT INTO Employes (emp_matricule, emp_nom, emp_prenom, emp_dep)
VALUES
(152, 'CONDA', 'Anna', 41)

-- La synthaxe est différente et ne fonctionne pas comme la 1ère instruction ? a cause des emp manquant peut être ?

INSERT INTO Employes
VALUES
(13, 567, 'BAMBEL', 'Lary', 43, Null)

DELETE FROM Employes
WHERE ( emp_dep = 'E21' OR emp_salaire IS NULL )

-- Suppression d'une ligne dans une table

Exercie 1

1--------------------------

UPDATE vente
SET numfou = 9180
WHERE prix2 = prix2 * 1,02

UPDATE vente
SET prix1 = prix1*1.04
WHERE numfou = 9180
-- good

2-------------------------------

UPDATE vente
SET prix2 = prix1
WHERE codart = "R132"

UPDATE vente
SET prix2 = prix1
WHERE codart = "D035"

-- good

UPDATE vente
SET  prix2 = prix1
WHERE codart = "D035", "R132"

--  ??????

3 -----------------------------

UPDATE entcom

JOIN fournis
ON entcom.numfou = fournis.numfou
SET obscom ='*'
WHERE satisf < 5;

-- good

4---------------------------------

DELETE FROM vente WHERE codart = "I110";
DELETE FROM produit WHERE codart ="I110";

Exercice 2 

DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel; 
USE hotel;

CREATE TABLE station (
	sta_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	sta_nom VARCHAR(50) NOT NULL,
	sta_altitude INT
);

CREATE TABLE hotel (
	hot_id 			INT AUTO_INCREMENT NOT NULL,
	hot_sta_id 		INT NOT NULL,
	hot_nom 		VARCHAR(50) NOT NULL,
	hot_categorie 	INT NOT NULL,
	hot_adresse		VARCHAR(50) NOT NULL,
	hot_ville 		VARCHAR(50) NOT NULL, 
	FOREIGN KEY (hot_sta_id) REFERENCES station(sta_id),
	PRIMARY KEY (hot_id)
);

CREATE TABLE chambre (
	cha_id INT NOT NULL AUTO_INCREMENT ,
	cha_hot_id INT NOT NULL,
	cha_numero INT NOT NULL,
	cha_capacite INT NOT NULL,
	cha_type INT NOT NULL,
	FOREIGN KEY (cha_hot_id) REFERENCES hotel(hot_id),
	PRIMARY KEY (cha_id)
);

CREATE TABLE reservation (
	res_id INT NOT NULL AUTO_INCREMENT,
	res_cha_id INT NOT NULL ,
	res_cli_id INT NOT NULL ,
	res_date DATETIME NOT NULL,
	res_date_debut DATETIME NOT NULL,
	res_date_fin DATETIME NOT NULL,
	res_prix DECIMAL(6,2) NOT NULL,
	res_arrhes DECIMAL(6,2),
	FOREIGN KEY (res_cha_id) REFERENCES chambre(cha_id),
	FOREIGN KEY (res_cli_id) REFERENCES CLIENT(cli_id),
	PRIMARY KEY (res_id)
);

CREATE TABLE CLIENT (
	cli_id INT NOT NULL AUTO_INCREMENT ,
	cli_nom VARCHAR(50),
	cli_prenom VARCHAR(50),
	cli_adresse VARCHAR(50),
	cli_ville VARCHAR(50),
	PRIMARY KEY (cli_id)
);



INSERT INTO station (sta_id, sta_nom, sta_altitude) VALUES (1, 'La Montagne', 2500);
INSERT INTO station (sta_id, sta_nom, sta_altitude) VALUES (2, 'Le Sud', 200);
INSERT INTO station (sta_id, sta_nom, sta_altitude) VALUES (3, 'La Plage', 10);

INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (1, 1, 'Le Magnifique', 3, 'rue du bas', 'Pralo');
INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (2, 1, 'Hotel du haut', 1, 'rue du haut', 'Pralo');
INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (3, 2, 'Le Narval', 3, 'place de la liberation', 'Vonten');
INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (4, 2, 'Les Pissenlis', 4, 'place du 14 juillet', 'Bretou');
INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (5, 2, 'RR Hotel', 5, 'place du bas', 'Bretou');
INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (6, 2, 'La Brique', 2, 'place du haut', 'Bretou');
INSERT INTO hotel (hot_id, hot_sta_id, hot_nom, hot_categorie, hot_adresse, hot_ville) VALUES (7, 3, 'Le Beau Rivage', 3, 'place du centre', 'Toras');

INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 1, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 1, 3, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 1, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 1, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 1, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 1, 3, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 1, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 1, 7, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 1, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 2, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 2, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 2, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 2, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 2, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 2, 3, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 2, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 2, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 2, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 3, 3, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 3, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 3, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 3, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 3, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 3, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 3, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 3, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 3, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 4, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 4, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 4, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 4, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 4, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 4, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 4, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 4, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 4, 3, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 5, 3, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 5, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 5, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 5, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 5, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 5, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 5, 2, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 5, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 5, 4, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 6, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (001, 7, 1, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (002, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (003, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (101, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (102, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (103, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (201, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (202, 7, 5, 1);
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 7, 5, 1);

INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('Doe', 'John', '', 'LA');
INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('Homme', 'Josh', '', 'Palm Desert');
INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('Paul', 'Weller', '', 'Londre');
INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('White', 'Jack', '', 'Detroit');
INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('Claypool', 'Les', '', 'San Francisco');
INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('Squire', 'Chris', '', 'Londre');
INSERT INTO CLIENT (cli_nom, cli_prenom, cli_adresse, cli_ville) VALUES ('Wood', 'Ronnie', '', 'Londre');

INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (1, 1, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 800);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (2, 2, '2017-01-10', '2017-07-01', '2017-07-15', 3400, 100);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (1, 3, '2017-01-10', '2017-07-01', '2017-07-15', 400, 50);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (2, 4, '2017-01-10', '2017-07-01', '2017-07-15', 7200, 1800);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (3, 5, '2017-01-10', '2017-07-01', '2017-07-15', 1400, 450);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (4, 6, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 780);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (4, 6, '2017-01-10', '2017-07-01', '2017-07-15', 500, 80);
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (4, 1, '2017-01-10', '2017-07-01', '2017-07-15', 40, 0);

LOT 1

1 -------------

SELECT hot_ville,hot_nom FROM hotel;

2 --------------------------------

SELECT cli_nom,cli_prenom,cli_adresse FROM CLIENT;

SELECT cli_ville FROM CLIENT WHERE cli_nom LIKE "White";

3 -----------------------------------

SELECT sta_nom,sta_altitude FROM station;

4 ----------------------------

SELECT cha_numero,cha_capacite FROM chambre;

5 ---------------------------------

SELECT cli_nom,cli_ville FROM CLIENT;

SELECT cli_nom,cli_ville FROM CLIENT WHERE cli_ville NOT LIKE "Londre";

6 -----------------------------------

SELECT hot_ville,hot_categorie FROM hotel WHERE hot_ville LIKE "Bretou" AND hot_categorie > 3;

LOT 2

7 ---------------------

SELECT sta_nom,hot_nom,hot_categorie,hot_ville FROM hotel JOIN station ON hotel.hot_sta_id = station.sta_id;

8 ---------------------------------

SELECT hot_nom,hot_categorie,hot_ville,cha_numero FROM hotel JOIN chambre ON hotel.hot_id = chambre.cha_hot_id;

9 -----------------------------------

SELECT hot_nom,hot_categorie,hot_ville,cha_numero,cha_capacite FROM hotel JOIN chambre ON hotel.hot_id = chambre.cha_hot_id;

SELECT hot_nom,hot_categorie,hot_ville,cha_numero,cha_capacite FROM hotel JOIN chambre ON hotel.hot_id = chambre.cha_hot_id WHERE cha_capacite >  1 and hot_ville LIKE "Bretou";

10 ---------------------------

SELECT cli_nom,hot_nom,res_date FROM reservation JOIN CLIENT ON reservation.res_cli_id = CLIENT.cli_id JOIN chambre ON reservation.res_cha_id = chambre.cha_id JOIN hotel ON chambre.cha_hot_id = hotel.hot_id;

11 ------------------------------------------

SELECT sta_nom,hot_nom,cha_numero,cha_capacite FROM station JOIN hotel ON station.sta_id = hotel.hot_sta_id JOIN chambre ON hotel.hot_id = chambre.cha_hot_id;

12 ---------------------------------------------

SELECT cli_nom,hot_nom, res_date_debut, DATEDIFF (res_date_fin,res_date_debut) FROM CLIENT INNER JOIN reservation ON CLIENT.cli_id = reservation.res_cli_id inner JOIN chambre ON reservation.res_cha_id = chambre.cha_id inner JOIN hotel ON chambre.cha_hot_id = hotel.hot_id;

LOT 3 

13 --------------------------------------------------

SELECT hot_nom, COUNT(*) FROM hotel JOIN station ON hotel.hot_sta_id = station.sta_id GROUP BY sta_id;

14 ----------------------------------------------------

SELECT sta_nom, COUNT(*) FROM chambre JOIN hotel ON chambre.cha_hot_id = hotel.hot_id JOIN station ON hotel.hot_sta_id = station.sta_id GROUP BY sta_id;

15 ----------------------------------------------------------

SELECT sta_nom, COUNT(*) FROM chambre JOIN hotel ON chambre.cha_hot_id = hotel.hot_id JOIN station ON hotel.hot_sta_id = station.sta_id WHERE cha_capacite > 1 GROUP BY sta_id ;

16 --------------------------------------------------------

SELECT hot_nom,res_date FROM CLIENT JOIN reservation ON CLIENT.cli_id = reservation.res_cli_id JOIN chambre ON reservation.res_cha_id = chambre.cha_id JOIN hotel ON chambre.cha_hot_id = hotel.hot_id WHERE cli_nom = "Squire";

17 -------------------------------------------

SELECT SUM(DATEDIFF(res_date_fin, res_date_debut))/DATEDIFF(res_date_fin,res_date_debut) 
FROM station 
INNER JOIN hotel 
ON station.sta_id = hotel.hot_sta_id 
INNER JOIN chambre 
ON hotel.hot_id = chambre.cha_hot_id 
INNER JOIN reservation 
ON chambre.cha_id = reservation.res_cha_id 
INNER JOIN CLIENT 
ON reservation.res_cli_id = CLIENT.cli_id 
GROUP BY sta_nom ASC;

GROUP BY dep_fou ASC AND GROUP BY nom_fou ASC;

CREATE INDEX FROM cli_nom;

LAST EXERCICE --------------------

SELECT numfou FROM fournis JOIN entcom ON fournis.numfou = entcom.numfou JOIN ligcom ON ligcom.numcom = entcom.numcom;

DROP DATABASE papyrus;

CREATE DATABASE papyrus;

USE papyrus;

CREATE TABLE `fournis` (
  `numfou` int NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` tinyint(4) DEFAULT NULL, 
  CHECK (`satisf` >=0 AND `satisf` <=10),
  PRIMARY KEY (`numfou`)
);

INSERT INTO `fournis` (`numfou`, `nomfou`, `ruefou`, `posfou`, `vilfou`, `confou`, `satisf`) VALUES
	(120, 'GROBRIGAN', '20 rue du papier', '92200', 'papercity', 'Georges', 8),
	(540, 'ECLIPSE', '53 rue laisse flotter les rubans', '78250', 'Bugbugville', 'Nestor', 7),
	(8700, 'MEDICIS', '120 rue des plantes', '75014', 'Paris', 'Lison', 0),
	(9120, 'DISCOBOL', '11 rue des sports', '85100', 'La Roche sur Yon', 'Hercule', 8),
	(9150, 'DEPANPAP', '26 avenue des locomotives', '59987', 'Coroncountry', 'Pollux', 5),
	(9180, 'HURRYTAPE', '68 boulevard des octets', '4044', 'Dumpville', 'Track', 0);

CREATE TABLE `produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` char(5) NOT NULL,
  PRIMARY KEY (`codart`)
) ;


INSERT INTO `produit` (`codart`, `libart`, `stkale`, `stkphy`, `qteann`, `unimes`) VALUES
	('B001', 'Bande magnétique 1200', 20, 87, 240, 'unite'),
	('B002', 'Bande magnétique 6250', 20, 12, 410, 'unite'),
	('D035', 'CD R slim 80 mm', 40, 42, 150, 'B010'),
	('D050', 'CD R-W 80mm', 50, 4, 0, 'B010'),
	('I100', 'Papier 1 ex continu', 100, 557, 3500, 'B1000'),
	('I105', 'Papier 2 ex continu', 75, 5, 2300, 'B1000'),
	('I108', 'Papier 3 ex continu', 200, 557, 3500, 'B500'),
	('I110', 'Papier 4 ex continu', 10, 12, 63, 'B400'),
	('P220', 'Pré-imprimé commande', 500, 2500, 24500, 'B500'),
	('P230', 'Pré-imprimé facture', 500, 250, 12500, 'B500'),
	('P240', 'Pré-imprimé bulletin paie', 500, 3000, 6250, 'B500'),
	('P250', 'Pré-imprimé bon livraison', 500, 2500, 24500, 'B500'),
	('P270', 'Pré-imprimé bon fabrication', 500, 2500, 24500, 'B500'),
	('R080', 'ruban Epson 850', 10, 2, 120, 'unite'),
	('R132', 'ruban impl 1200 lignes', 25, 200, 182, 'unite');



CREATE TABLE `entcom` (
  `numcom` int(11) NOT NULL AUTO_INCREMENT,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `numfou` int(11) DEFAULT NULL,
  PRIMARY KEY (`numcom`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`)
);


INSERT INTO `entcom` (`numcom`, `obscom`, `datcom`, `numfou`) VALUES
	(70010, '', '2018-04-23 15:59:51', 120),
	(70011, 'Commande urgente', '2018-04-23 15:59:51', 540),
	(70020, '', '2018-04-23 15:59:51', 9120),
	(70025, 'Commande urgente', '2018-04-23 15:59:51', 9150),
	(70210, 'Commande cadencée', '2018-04-23 15:59:51', 120),
	(70250, 'Commande cadencée', '2018-04-23 15:59:51', 8700),
	(70300, '', '2018-04-23 15:59:51', 9120),
	(70620, '', '2018-04-23 15:59:51', 540),
	(70625, '', '2018-04-23 15:59:51', 120),
	(70629, '', '2018-04-23 15:59:51', 9180);



CREATE TABLE `ligcom` (
  `numcom` int(11) NOT NULL,
  `numlig` tinyint(4) NOT NULL,
  `codart` char(4) NOT NULL,
  `qtecde` int(11) NOT NULL,
  `priuni` decimal(5,0) NOT NULL,
  `qteliv` int(11) DEFAULT NULL,
  `derliv` date NOT NULL,
  PRIMARY KEY (`numcom`,`numlig`),
  KEY `codart` (`codart`),
  CONSTRAINT `ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `entcom` (`numcom`),
  CONSTRAINT `ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
);


INSERT INTO `ligcom` (`numcom`, `numlig`, `codart`, `qtecde`, `priuni`, `qteliv`, `derliv`) VALUES
	(70010, 1, 'I100', 3000, 470, 3000, '2007-03-15'),
	(70010, 2, 'I105', 2000, 485, 2000, '2007-07-05'),
	(70010, 3, 'I108', 1000, 680, 1000, '2007-08-20'),
	(70010, 4, 'D035', 200, 40, 250, '2007-02-20'),
	(70010, 5, 'P220', 6000, 3500, 6000, '2007-03-31'),
	(70010, 6, 'P240', 6000, 2000, 2000, '2007-03-31'),
	(70011, 1, 'I105', 1000, 600, 1000, '2007-05-16'),
	(70011, 2, 'P220', 10000, 3500, 10000, '2007-08-31'),
	(70020, 1, 'B001', 200, 140, 0, '2007-12-31'),
	(70020, 2, 'B002', 200, 140, 0, '2007-12-31'),
	(70025, 1, 'I100', 1000, 590, 1000, '2007-05-15'),
	(70025, 2, 'I105', 500, 590, 500, '2007-03-15'),
	(70210, 1, 'I100', 1000, 470, 1000, '2007-07-15'),
	(70250, 1, 'P230', 15000, 4900, 12000, '2007-12-15'),
	(70250, 2, 'P220', 10000, 3350, 10000, '2007-11-10'),
	(70300, 1, 'I100', 50, 790, 50, '2007-10-31'),
	(70620, 1, 'I105', 200, 600, 200, '2007-11-01'),
	(70625, 1, 'I100', 1000, 470, 1000, '2007-10-15'),
	(70625, 2, 'P220', 10000, 3500, 10000, '2007-10-31'),
	(70629, 1, 'B001', 200, 140, 0, '2007-12-31'),
	(70629, 2, 'B002', 200, 140, 0, '2007-12-31');



CREATE TABLE `vente` (
  `codart` char(4) NOT NULL,
  `numfou` int(11) NOT NULL,
  `delliv` smallint(6) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` decimal(5,0) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` decimal(5,0) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`codart`,`numfou`),
  KEY `numfou` (`numfou`),
  CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `fournis` (`numfou`),
  CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `produit` (`codart`)
) ;


INSERT INTO `vente` (`codart`, `numfou`, `delliv`, `qte1`, `prix1`, `qte2`, `prix2`, `qte3`, `prix3`) VALUES
	('B001', 8700, 15, 0, 150, 50, 145, 100, 140),
	('B002', 8700, 15, 0, 210, 50, 200, 100, 185),
	('D035', 120, 0, 0, 40, 0, 0, 0, 0),
	('D035', 9120, 5, 0, 40, 100, 30, 0, 0),
	('I100', 120, 90, 0, 700, 50, 600, 120, 500),
	('I100', 540, 70, 0, 710, 60, 630, 100, 600),
	('I100', 9120, 60, 0, 800, 70, 600, 90, 500),
	('I100', 9150, 90, 0, 650, 90, 600, 200, 590),
	('I100', 9180, 30, 0, 720, 50, 670, 100, 490),
	('I105', 120, 90, 10, 705, 50, 630, 120, 500),
	('I105', 540, 70, 0, 810, 60, 645, 100, 600),
	('I105', 8700, 30, 0, 720, 50, 670, 100, 510),
	('I105', 9120, 60, 0, 920, 70, 800, 90, 700),
	('I105', 9150, 90, 0, 685, 90, 600, 200, 590),
	('I108', 120, 90, 5, 795, 30, 720, 100, 680),
	('I108', 9120, 60, 0, 920, 70, 820, 100, 780),
	('I110', 9120, 60, 0, 950, 70, 850, 90, 790),
	('I110', 9180, 90, 0, 900, 70, 870, 90, 835),
	('P220', 120, 15, 0, 3700, 100, 3500, 0, 0),
	('P220', 8700, 20, 50, 3500, 100, 3350, 0, 0),
	('P230', 120, 30, 0, 5200, 100, 5000, 0, 0),
	('P230', 8700, 60, 0, 5000, 50, 4900, 0, 0),
	('P240', 120, 15, 0, 2200, 100, 2000, 0, 0),
	('P250', 120, 30, 0, 1500, 100, 1400, 500, 1200),
	('P250', 9120, 30, 0, 1500, 100, 1400, 500, 1200),
	('R080', 9120, 10, 0, 120, 100, 100, 0, 0),
	('R132', 9120, 5, 0, 275, 0, 0, 0, 0);

	1. --------------------

	SELECT numfou, numcom FROM entcom WHERE numfou="9120";
	???

	2. --------------------------------------------------------

	SELECT numfou,numcom FROM entcom;

	3. --------------------------------------------------------

	?????

	4. -------------------------------------------------------------

	SELECT codart,libart,stkphy,stkale,qteann FROM produit WHERE stkphy < stkale AND qteann < 1000;

	5. -----------------------------------------------------------------	

	SELECT nomfou,posfou FROM fournis WHERE posfou LIKE "7%" OR posfou LIKE "9%" ORDER BY posfou DESC;

	6. ----------------------------------------------------------------------

	SELECT qtecde,DATE_FORMAT(datcom, "%c") FROM entcom JOIN ligcom ON entcom.numcom = ligcom.numcom;

	7. -------------------------------------------------------------------

	SELECT numcom,datcom,obscom FROM entcom WHERE obscom LIKE "C%";

	8. ---------------------------------------------------------------------

	