-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 12 nov. 2024 à 13:36
-- Version du serveur : 8.0.36
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd2024`
--

-- --------------------------------------------------------

--
-- Structure de la table `athlète`
--

DROP TABLE IF EXISTS `athlète`;
CREATE TABLE IF NOT EXISTS `athlète` (
  `Id_Athlète` int NOT NULL,
  `Nom_athlète` varchar(50) DEFAULT NULL,
  `Prénom` varchar(50) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Taille` varchar(50) DEFAULT NULL,
  `Poids` varchar(50) DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL,
  `Id_Equipe` int DEFAULT NULL,
  `Id_Pays` int NOT NULL,
  PRIMARY KEY (`Id_Athlète`),
  KEY `Id_Equipe` (`Id_Equipe`),
  KEY `Id_Pays` (`Id_Pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `athlète`
--

INSERT INTO `athlète` (`Id_Athlète`, `Nom_athlète`, `Prénom`, `Genre`, `Taille`, `Poids`, `Date_naissance`, `Id_Equipe`, `Id_Pays`) VALUES
(1, 'Dupont', 'Lucas', 'M', '1.85', '80', '1995-03-12', 1, 1),
(2, 'Martin', 'Sophie', 'F', '1.70', '65', '1997-07-19', 2, 2),
(3, 'Lefevre', 'Antoine', 'M', '1.78', '75', '1993-01-23', 3, 3),
(4, 'Moreau', 'Julie', 'F', '1.65', '60', '1998-09-05', 4, 4),
(5, 'Bernard', 'Thierry', 'M', '1.90', '85', '1992-11-30', 5, 5),
(6, 'Petit', 'Elise', 'F', '1.60', '55', '2000-05-15', 6, 6),
(7, 'Robert', 'Nathalie', 'F', '1.75', '68', '1994-06-02', 7, 7),
(8, 'Richard', 'Damien', 'M', '1.88', '78', '1991-02-25', 8, 8),
(9, 'Durand', 'Maxime', 'M', '1.82', '82', '1996-10-10', 9, 9),
(10, 'Giraud', 'Caroline', 'F', '1.68', '62', '1995-12-20', 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `catégorie`
--

DROP TABLE IF EXISTS `catégorie`;
CREATE TABLE IF NOT EXISTS `catégorie` (
  `Id_Catégorie` int NOT NULL,
  `Nom_catégorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `catégorie`
--

INSERT INTO `catégorie` (`Id_Catégorie`, `Nom_catégorie`) VALUES
(1, 'individuel'),
(2, 'équipe'),
(3, 'handicapé individuel'),
(4, 'handicapé équipe');

-- --------------------------------------------------------

--
-- Structure de la table `coach`
--

DROP TABLE IF EXISTS `coach`;
CREATE TABLE IF NOT EXISTS `coach` (
  `Id_Coach` int NOT NULL,
  `Nom_coach` varchar(50) DEFAULT NULL,
  `Prénom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Coach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `coach`
--

INSERT INTO `coach` (`Id_Coach`, `Nom_coach`, `Prénom`) VALUES
(1, 'Dupont', 'Jean'),
(2, 'Martin', 'Pierre'),
(3, 'Lefevre', 'Jacques'),
(4, 'Moreau', 'Paul'),
(5, 'Roux', 'Marc'),
(6, 'Bernard', 'Louis'),
(7, 'Petit', 'Alain'),
(8, 'Robert', 'Claude'),
(9, 'Richard', 'Nicolas'),
(10, 'Durand', 'Hugo');

-- --------------------------------------------------------

--
-- Structure de la table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
CREATE TABLE IF NOT EXISTS `discipline` (
  `Id_Discipline` int NOT NULL,
  `Nom_discipline` varchar(50) DEFAULT NULL,
  `Id_Sport` int NOT NULL,
  PRIMARY KEY (`Id_Discipline`),
  KEY `Id_Sport` (`Id_Sport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `discipline`
--

INSERT INTO `discipline` (`Id_Discipline`, `Nom_discipline`, `Id_Sport`) VALUES
(1, 'Sprint 100m', 3),
(2, 'Relais 4x100m', 3),
(3, 'Marathon', 3),
(4, 'Natation 200m', 4),
(5, 'Basketball 3x3', 2),
(6, 'Football à 11', 1),
(7, 'Simple hommes', 7),
(8, 'Simple femmes', 7),
(9, 'Équipe mixte', 6),
(10, 'Compétition épée', 9);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `Id_Epreuve` int NOT NULL,
  `Année` date DEFAULT NULL,
  `Nom_épreuve` varchar(50) DEFAULT NULL,
  `Id_Discipline` int NOT NULL,
  `Id_Lieu_event` int NOT NULL,
  PRIMARY KEY (`Id_Epreuve`),
  KEY `Id_Discipline` (`Id_Discipline`),
  KEY `Id_Lieu_event` (`Id_Lieu_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`Id_Epreuve`, `Année`, `Nom_épreuve`, `Id_Discipline`, `Id_Lieu_event`) VALUES
(1, '2023-06-12', 'Finale 100m hommes', 1, 1),
(2, '2023-07-20', 'Relais 4x100m femmes', 2, 2),
(3, '2024-05-15', 'Marathon international', 3, 3),
(4, '2023-08-01', 'Finale natation 200m', 4, 4),
(5, '2023-06-25', 'Match de basketball 3x3', 5, 5),
(6, '2024-04-10', 'Finale football', 6, 6),
(7, '2023-09-18', 'Match de tennis simple hommes', 7, 7),
(8, '2024-03-22', 'Match de tennis simple femmes', 8, 8),
(9, '2023-10-05', 'Finale rugby', 9, 9),
(10, '2024-02-14', 'Compétition épée hommes', 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `Id_Equipe` int NOT NULL,
  `Nom_équipe` varchar(50) DEFAULT NULL,
  `Id_Coach` int NOT NULL,
  PRIMARY KEY (`Id_Equipe`),
  UNIQUE KEY `Id_Coach` (`Id_Coach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`Id_Equipe`, `Nom_équipe`, `Id_Coach`) VALUES
(1, 'Les Bleus', 1),
(2, 'Les Lions', 2),
(3, 'Les Aigles', 3),
(4, 'Les Coqs', 4),
(5, 'Les Tigres', 5),
(6, 'Les Loups', 6),
(7, 'Les Dauphins', 7),
(8, 'Les Hérissons', 8),
(9, 'Les Dragons', 9),
(10, 'Les Phoenix', 10);

-- --------------------------------------------------------

--
-- Structure de la table `lieu_event`
--

DROP TABLE IF EXISTS `lieu_event`;
CREATE TABLE IF NOT EXISTS `lieu_event` (
  `Id_Lieu_event` int NOT NULL,
  `Stade` varchar(50) DEFAULT NULL,
  `Id_Ville` int NOT NULL,
  PRIMARY KEY (`Id_Lieu_event`),
  KEY `Id_Ville` (`Id_Ville`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `lieu_event`
--

INSERT INTO `lieu_event` (`Id_Lieu_event`, `Stade`, `Id_Ville`) VALUES
(1, 'Stade de France', 1),
(2, 'Groupama Stadium', 2),
(3, 'Orange Vélodrome', 3),
(4, 'Stade Pierre-Mauroy', 4),
(5, 'Allianz Riviera', 5),
(6, 'Matmut Atlantique', 6),
(7, 'Stadium de Toulouse', 7),
(8, 'Stade de la Beaujoire', 8),
(9, 'Stade Geoffroy-Guichard', 9),
(10, 'Roazhon Park', 10);

-- --------------------------------------------------------

--
-- Structure de la table `médailles`
--

DROP TABLE IF EXISTS `médailles`;
CREATE TABLE IF NOT EXISTS `médailles` (
  `Id_Médailles` int NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `id_res` int NOT NULL,
  `Id_Athlète` int NOT NULL,
  PRIMARY KEY (`Id_Médailles`),
  UNIQUE KEY `id_res` (`id_res`),
  KEY `Id_Athlète` (`Id_Athlète`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `médailles`
--

INSERT INTO `médailles` (`Id_Médailles`, `Type`, `id_res`, `Id_Athlète`) VALUES
(1, 'Or', 1, 1),
(2, 'Argent', 2, 2),
(3, 'Bronze', 3, 3),
(4, 'Or', 4, 4),
(5, 'Argent', 5, 5),
(6, 'Bronze', 6, 6),
(7, 'Or', 7, 7),
(8, 'Argent', 8, 8),
(9, 'Bronze', 9, 9),
(10, 'Or', 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `Id_Pays` int NOT NULL,
  `Nom_pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Pays`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`Id_Pays`, `Nom_pays`) VALUES
(1, 'France'),
(2, 'Allemagne'),
(3, 'Italie'),
(4, 'Espagne'),
(5, 'Royaume-Uni'),
(6, 'Portugal'),
(7, 'Suisse'),
(8, 'Belgique'),
(9, 'Pays-Bas'),
(10, 'Autriche');

-- --------------------------------------------------------

--
-- Structure de la table `résultat`
--

DROP TABLE IF EXISTS `résultat`;
CREATE TABLE IF NOT EXISTS `résultat` (
  `id_res` int NOT NULL,
  `Position_classement` varchar(50) DEFAULT NULL,
  `Id_Athlète` int NOT NULL,
  `Id_Epreuve` int NOT NULL,
  PRIMARY KEY (`id_res`),
  KEY `Id_Athlète` (`Id_Athlète`),
  KEY `Id_Epreuve` (`Id_Epreuve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `résultat`
--

INSERT INTO `résultat` (`id_res`, `Position_classement`, `Id_Athlète`, `Id_Epreuve`) VALUES
(1, '1er', 1, 1),
(2, '2e', 2, 2),
(3, '3e', 3, 3),
(4, '1er', 4, 4),
(5, '2e', 5, 5),
(6, '3e', 6, 6),
(7, '1er', 7, 7),
(8, '2e', 8, 8),
(9, '3e', 9, 9),
(10, '1er', 10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `Id_Sport` int NOT NULL,
  `Nom_sport` varchar(50) DEFAULT NULL,
  `Id_Catégorie` int NOT NULL,
  PRIMARY KEY (`Id_Sport`),
  KEY `Id_Catégorie` (`Id_Catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`Id_Sport`, `Nom_sport`, `Id_Catégorie`) VALUES
(1, 'Football', 2),
(2, 'Basketball', 2),
(3, 'Athlétisme', 1),
(4, 'Natation', 1),
(5, 'Handball', 2),
(6, 'Rugby', 2),
(7, 'Tennis', 1),
(8, 'Cyclisme', 1),
(9, 'Escrime', 3),
(10, 'Judo', 4);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `Id_Ville` int NOT NULL,
  `Nom_ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Ville`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`Id_Ville`, `Nom_ville`) VALUES
(1, 'Paris'),
(2, 'Lyon'),
(3, 'Marseille'),
(4, 'Lille'),
(5, 'Nice'),
(6, 'Bordeaux'),
(7, 'Toulouse'),
(8, 'Nantes'),
(9, 'Saint-Étienne'),
(10, 'Rennes');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `athlète`
--
ALTER TABLE `athlète`
  ADD CONSTRAINT `athlète_ibfk_1` FOREIGN KEY (`Id_Equipe`) REFERENCES `equipe` (`Id_Equipe`),
  ADD CONSTRAINT `athlète_ibfk_2` FOREIGN KEY (`Id_Pays`) REFERENCES `pays` (`Id_Pays`);

--
-- Contraintes pour la table `discipline`
--
ALTER TABLE `discipline`
  ADD CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`Id_Sport`) REFERENCES `sport` (`Id_Sport`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `epreuve_ibfk_1` FOREIGN KEY (`Id_Discipline`) REFERENCES `discipline` (`Id_Discipline`),
  ADD CONSTRAINT `epreuve_ibfk_2` FOREIGN KEY (`Id_Lieu_event`) REFERENCES `lieu_event` (`Id_Lieu_event`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`Id_Coach`) REFERENCES `coach` (`Id_Coach`);

--
-- Contraintes pour la table `lieu_event`
--
ALTER TABLE `lieu_event`
  ADD CONSTRAINT `lieu_event_ibfk_1` FOREIGN KEY (`Id_Ville`) REFERENCES `ville` (`Id_Ville`);

--
-- Contraintes pour la table `médailles`
--
ALTER TABLE `médailles`
  ADD CONSTRAINT `médailles_ibfk_1` FOREIGN KEY (`id_res`) REFERENCES `résultat` (`id_res`),
  ADD CONSTRAINT `médailles_ibfk_2` FOREIGN KEY (`Id_Athlète`) REFERENCES `athlète` (`Id_Athlète`);

--
-- Contraintes pour la table `résultat`
--
ALTER TABLE `résultat`
  ADD CONSTRAINT `résultat_ibfk_1` FOREIGN KEY (`Id_Athlète`) REFERENCES `athlète` (`Id_Athlète`),
  ADD CONSTRAINT `résultat_ibfk_2` FOREIGN KEY (`Id_Epreuve`) REFERENCES `epreuve` (`Id_Epreuve`);

--
-- Contraintes pour la table `sport`
--
ALTER TABLE `sport`
  ADD CONSTRAINT `sport_ibfk_1` FOREIGN KEY (`Id_Catégorie`) REFERENCES `catégorie` (`Id_Catégorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
