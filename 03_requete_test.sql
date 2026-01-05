-- 1. Liste des focaccias par ordre alphabétique

SELECT nom
FROM focaccia
ORDER BY nom ASC;

-- Résultat attendu: une liste de noms, trier de A à Z, sans doublon
-- Résultat obtenu: Américaine,Emmentalaccia etc...

-- =============================================

-- 2. Nombre total d'ingrédients

SELECT COUNT(*) AS nombre_ingredients
FROM ingredient;

-- Résultat attendu: 25
-- Résultat obtenu: 25

-- =============================================

-- 3. Prix moyen des focaccias

SELECT ROUND( AVG(prix), 2 ) AS prix_moyen_focaccia
FROM focaccia;

-- Résultat attendu: prix moyen
-- Résultat obtenu: 10.37

-- =============================================

-- 4. Liste des boissons avec leur marques 

SELECT 
    b.nom AS boisson,
    m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY m.nom, b.nom;

-- Résultat attendu: boissons groupé par marques
-- Résultat obtenu: Capri-sun   Coca-Cola etc...

-- =============================================

-- 5. Liste des ingrédients de la Raclaccia

SELECT i.nom AS ingredient
FROM comprend c
JOIN focaccia f ON c.id_focaccia = f.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom ASC;

-- Résultat attendu: ingrédients trier de A à Z
-- Résultat obtenu: Ail, Base Tomate etc..

-- =============================================

-- 6. Focaccia et leur nombre d'ingrédients

SELECT 
    f.nom AS focaccia,
    COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom ASC;

-- Résultat attendu: liste des focaccias avec le nombre d'ingrédients
-- Résultat obtenu: Américaine 	7 etc...

-- =============================================

-- 7.Trouver la focaccia avec le plus d'ingrédients

SELECT
    f.nom AS focaccia,
    COUNT(c.id_ingredient) AS nombre_ingredients
FROM focaccia f
JOIN comprend c on f.id_focaccia = c.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nombre_ingredients DESC
LIMIT 1;

-- Résultat attendu: Paysanne 	10
-- Résultat obtenu: Paysanne 	10

-- =============================================

-- 8. Trouver les focaccia qui contiennent de l'ail

SELECT DISTINCT
    f.nom AS focaccia
FROM focaccia f
JOIN comprend c ON f.id_focaccia = c.id_focaccia
JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE i.nom ='Ail'
ORDER BY f.nom ASC;

-- Résultat attendu: Gorgonzollaccia, Mozaccia etc...
-- Résultat obtenu: Gorgonzollaccia, Mozaccia etc...

-- =============================================

-- 9. Afficher les ingrédients inutilisés

SELECT
    i.nom AS ingredient
FROM ingredient i 
LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient
WHERE c.id_ingredient IS NULL
ORDER BY i.nom ASC

-- Résultat attendu: Oeuf etc...
-- Résultat obtenu: Oeuf etc...

-- =============================================

-- 10. Afficher les focaccia qui n'ont pas de champignons 

SELECT nom
FROM focaccia
WHERE id_focaccia NOT IN (
    SELECT c.id_focaccia
    FROM comprend c
    JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE i.nom = 'Champignon'
)

-- Résuluat attendu: Américaine etc..
-- Résuluat obtenu: Américaine etc..