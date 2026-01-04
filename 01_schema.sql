-- Création de la base de données Tifosi
-- =====================================

CREATE DATABASE IF NOT EXISTS tifosi
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- Créatiaion de l'utilisateur MySQL
-- =================================

CREATE USER IF NOT EXISTS 'tifosi'@'localhost'
IDENTIFIED BY 'tifosi_password';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';

FLUSH PRIVILEGES;

-- Création des tables
-- ===================

USE tifosi;

CREATE TABLE ingredient (
    id_ingredient INT AUTO_INCRMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE focaccia (
    id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    PRIX DECIMAL(5,2) NOT NULL CHECK (prix > 0)
);

CREATE TABLE marque (
    id_marque INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE boisson (
    id_boisson INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    id_marque INT NOT NULL, 
    CONSTRAINT fk_boisson_marque
        FOREIGN KEY (id_marque)
        REFERENCES marque(id_marque)
);

CREATE TABLE menu (
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL CHECK (prix > 0),
    id_focaccia INT NOT NULL, 
    CONSTRAINT fk_menu_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia)
);

CREATE TABLE client (
    id_client INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT
);

-- Création des tables de liaisons
-- ===============================

CREATE TABLE comprend (
    id_focaccia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT,
    PRIMARY KEY (id_focaccia,id_ingredient),
    CONSTRAINT fk_comprend_focaccia
        FOREIGN KEY (id_focaccia)
        REFERENCES focaccia(id_focaccia),
    CONSTRAINT fk_comprend_ingredient
        FOREIGN KEY (id_ingredient)
        REFERENCES ingredient(id_ingredient)
);

CREATE TABLE achete (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client,id_menu,date_achat),
    CONSTRAINT fk_achete_client
        FOREIGN KEY (id_client)
        REFERENCES client(id_client),
    CONSTRAINT fk_achete_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu)
);

CREATE TABLE contient (
    id_boisson INT NOT NULL,
    id_menu INT NOT NULL,
    PRIMARY KEY (id_boisson,id_menu),
    CONSTRAINT fk_contient_boisson
        FOREIGN KEY (id_boisson)
        REFERENCES boisson(id_boisson),
    CONSTRAINT fk_contient_menu
        FOREIGN KEY (id_menu)
        REFERENCES menu(id_menu)
);