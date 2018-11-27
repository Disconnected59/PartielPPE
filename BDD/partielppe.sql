-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 27 nov. 2018 à 14:16
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `partielppe`
--
CREATE DATABASE IF NOT EXISTS `partielppe` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `partielppe`;

-- --------------------------------------------------------

--
-- Structure de la table `indication`
--

DROP TABLE IF EXISTS `indication`;
CREATE TABLE IF NOT EXISTS `indication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traitement_id` int(11) DEFAULT NULL,
  `medicament_id` int(11) DEFAULT NULL,
  `posologie` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D15065D7DDA344B6` (`traitement_id`),
  KEY `IDX_D15065D7AB0D61F7` (`medicament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `indication`
--

INSERT INTO `indication` (`id`, `traitement_id`, `medicament_id`, `posologie`) VALUES
(1, 1, 2, 'rien'),
(2, 2, 3, 'pas du tout'),
(3, 1, 1, 'oui'),
(4, 2, 4, '2 par jour stp'),
(5, 1, 4, 'bon en fait prends en');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `libelle`) VALUES
(1, 'oui'),
(2, 'non'),
(3, 'pas du doliprane'),
(4, 'doliprane');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20181127130851');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

DROP TABLE IF EXISTS `traitement`;
CREATE TABLE IF NOT EXISTS `traitement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date NOT NULL,
  `duree` int(11) DEFAULT NULL,
  `nom_patient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id`, `date_debut`, `duree`, `nom_patient`) VALUES
(1, '2018-11-27', 0, 'gertrude'),
(2, '2018-11-27', 0, 'gertrude');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `indication`
--
ALTER TABLE `indication`
  ADD CONSTRAINT `FK_D15065D7AB0D61F7` FOREIGN KEY (`medicament_id`) REFERENCES `medicament` (`id`),
  ADD CONSTRAINT `FK_D15065D7DDA344B6` FOREIGN KEY (`traitement_id`) REFERENCES `traitement` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
