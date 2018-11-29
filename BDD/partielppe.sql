-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 29 nov. 2018 à 14:07
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `indication`
--

INSERT INTO `indication` (`id`, `traitement_id`, `medicament_id`, `posologie`) VALUES
(1, 1, 5, 'Oui'),
(2, 2, 1, '2 comprimés par jour pendant 1 semaine'),
(4, 1, 1, '5 fois par jour toutes les 2 heures jusqu\'à amélioration de l\'état'),
(5, 1, 3, '5 fois par jour toutes les 2 heures jusqu\'à amélioration de l\'état'),
(6, 1, 3, '5 fois par jour toutes les 2 heures jusqu\'à amélioration de l\'état'),
(7, 2, 4, 'Deux cachets par jour'),
(8, 13, 13, '3 fois par jour'),
(9, 12, 15, '2 fois par jour pendant le repas'),
(10, 11, 14, 'Une fois par jour après le repas'),
(11, 7, 9, 'Trois fois par jour a 4 heures d\'intervalle'),
(12, 15, 10, 'Une fois par jour à jean'),
(13, 10, 6, 'Deux fois par jour à 6 heure d\'intervalle'),
(14, 3, 5, 'Deux cuillères a soupe trois fois par jour'),
(15, 4, 8, 'Un cachet par jour'),
(16, 2, 13, 'Un cachet toutes les 3 heures');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id`, `libelle`) VALUES
(1, 'Doliprane'),
(2, 'Smecta'),
(3, 'Aspirine'),
(4, 'Humex'),
(5, 'Helicidine'),
(6, 'Efferalgan'),
(7, 'Levothyrox'),
(8, 'Imodium'),
(9, 'Tahor'),
(10, 'Spedifen'),
(11, 'Voltarene'),
(12, 'Eludril'),
(13, 'Paracetamol'),
(14, 'Forlax'),
(15, 'Lamaline');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `traitement`
--

INSERT INTO `traitement` (`id`, `date_debut`, `duree`, `nom_patient`) VALUES
(1, '2014-06-07', 20, 'Mouloud'),
(2, '2018-11-24', 2, 'Michel'),
(3, '2018-12-12', 30, 'Pierre'),
(4, '2018-09-12', 5, 'Kevin'),
(5, '2018-09-24', 10, 'Jean'),
(6, '2018-09-30', 14, 'Antoine'),
(7, '2018-08-13', 5, 'Bekir'),
(8, '2018-11-12', 6, 'Mathis'),
(9, '2018-11-05', 16, 'Adrien'),
(10, '2018-05-05', 30, 'Boris'),
(11, '2018-10-23', 12, 'Emmanuelle'),
(12, '2018-04-24', 30, 'Lebas'),
(13, '2018-11-05', 5, 'Nicolas'),
(14, '2018-02-05', 5, 'Pauline'),
(15, '2018-11-05', 14, 'Celina'),
(16, '2018-11-13', 10, 'Jean');

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
