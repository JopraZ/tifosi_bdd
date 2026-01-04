INSERT INTO marque (nom) VALUES
('Coca-cola'),
('Cristalline'),
('Monster'),
('Pepsico');

INSERT INTO ingredient (nom) VALUES
('Ail'),
('Ananas'),
('Artichaut'),
('Bacon'),
('Base Tomate'),
('Base crème'),
('Champignon'),
('Chevre'),
('Cresson'),
('Emmental'),
('Gorgonzola'),
('Jambon cuit'),
('Jambon fumé'),
('Oeuf'),
('Oignon'),
('Olive noire'),
('Olive verte'),
('Piment'),
('Poivre'),
('Pomme de terre'),
('Raclette'),
('Salami'),
('Tomate cerise'),
('Mozarella');

INSERT INTO boisson (nom, id_marque) VALUES
('Fanta citron',1),
('Fanta orange',1),
('Capri-sun',1),
('Pepsi',4),
('Pepsi Max Zéro',4),
('Lipton zéro citron',4),
('Lipton Peach',4),
('Monster energy ultra gold',3),
('Monster energy ultra blue',3),
('Eau de source',2);

INSERT INTO focaccia (nom, prix) VALUES
('Mozaccia', 9.80),
('Gorgonzollaccia', 10.80),
('Raclaccia', 8.90),
('Emmentalaccia', 9.80),
('Tradizione',8.90),
('Hawaienne', 11.20),
('Américaine', 10.80),
('Paysanne', 12.80);

-- Table de liaison focaccia / ingredient par focaccia

-- ===================================================

-- Mozaccia --

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Mozaccia'
AND i.nom IN (
    'Base tomate', 
    'Mozarella', 
    'cresson', 
    'jambon fumé', 
    'ail', 
    'artichaut', 
    'champignon', 
    'parmesan', 
    'poivre', 
    'olive noire';
)

-- Gorgonzollaccia --

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Gorgonzollaccia'
AND i.nom IN (
    'Base tomate', 
    'Gorgonzola', 
    'cresson', 
    'ail', 
    'champignon', 
    'parmesan', 
    'poivre', 
    'olive noire';
)

-- Raclaccia -- 

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Raclaccia'
AND i.nom IN (
    'Base tomate',
    'raclette',
    'cresson',
    'ail',
    'champignon',
    'parmesan',
    'poivre';
)

-- Emmentalaccia -- 

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Emmentalaccia'
AND i.nom IN (
    'Base crème',
    'Emmental',
    'cresson',
    'champignon',
    'parmesan',
    'poivre',
    'oignon';
)

-- Tradizione -- 

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Tradizione'
AND i.nom IN (
    'Base tomate',
    'Mozarella',
    'cresson',
    'jambon cuit',
    'champignon',
    'parmesan',
    'poivre',
    'olive noire',
    'olive verte';
)

-- Hawaienne -- 

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Hawaienne'
AND i.nom IN(
    'Base tomate',
    'Mozarella',
    'cresson',
    'bacon',
    'ananas',
    'piment',
    'parmesan',
    'poivre',
    'olive noire';
)

-- Américaine --

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Hawaienne'
AND i.nom IN (
    'Base tomate',
    'Mozarella',
    'cresson',
    'bacon',
    'pomme de terre',
    'parmesan',
    'poivre',
    'olive noire';
)

-- Paysanne --

INSERT INTO comprend (id_focaccia, id_ingredient)
SELECT f.id_focaccia, i.id_ingredient
FROM focaccia f
JOIN ingredient i
WHERE f.nom ='Paysanne'
AND i.nom IN(
    'Base crème',
    'Chèvre',
    'cresson',
    'pomme de terre',
    'jambon fumé',
    'ail',
    'artichaut',
    'champignon',
    'parmesan',
    'poivre',
    'olive noire',
    'œuf';
)