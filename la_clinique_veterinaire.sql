-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 26 jan. 2021 à 11:03
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `la_clinique_veterinaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `DateDeces` date DEFAULT NULL,
  `idPropriétaire` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Animal_Propriétaire_idx` (`idPropriétaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `idAnimal` int DEFAULT NULL,
  `idRace` int DEFAULT NULL,
  KEY `fk_Chat_Animal1_idx` (`idAnimal`),
  KEY `fk_Chat_Race_chat1_idx` (`idRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

DROP TABLE IF EXISTS `chien`;
CREATE TABLE IF NOT EXISTS `chien` (
  `taille` int DEFAULT NULL,
  `poids` int DEFAULT NULL,
  `idAnimal` int DEFAULT NULL,
  `idRace` int DEFAULT NULL,
  KEY `fk_Chien_Animal1_idx` (`idAnimal`),
  KEY `fk_Chien_Race_chien1_idx` (`idRace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `antecedents` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

DROP TABLE IF EXISTS `effectuer`;
CREATE TABLE IF NOT EXISTS `effectuer` (
  `idGarde` int DEFAULT NULL,
  `idVeterinaire` int DEFAULT NULL,
  KEY `fk_Effectuer_Garde1_idx` (`idGarde`),
  KEY `fk_Effectuer_Veterinaire1_idx` (`idVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `garde`
--

DROP TABLE IF EXISTS `garde`;
CREATE TABLE IF NOT EXISTS `garde` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

DROP TABLE IF EXISTS `horaire`;
CREATE TABLE IF NOT EXISTS `horaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jour` varchar(10) DEFAULT NULL,
  `heureDebut` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL,
  `idVeterinaire` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Horaire_Veterinaire1_idx` (`idVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) DEFAULT NULL,
  `dosage` int DEFAULT NULL,
  `indications` text,
  `effetsSecondaires` text,
  `laboratoire` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
CREATE TABLE IF NOT EXISTS `prescrire` (
  `idVisite` int DEFAULT NULL,
  `idMedicament` int DEFAULT NULL,
  `Posologie` mediumtext,
  KEY `fk_Prescrire_Visite1_idx` (`idVisite`),
  KEY `fk_Prescrire_Medicament1_idx` (`idMedicament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `propriétaire`
--

DROP TABLE IF EXISTS `propriétaire`;
CREATE TABLE IF NOT EXISTS `propriétaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `codepostal` int DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `telephoneMobile` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `race_chat`
--

DROP TABLE IF EXISTS `race_chat`;
CREATE TABLE IF NOT EXISTS `race_chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `race_chien`
--

DROP TABLE IF EXISTS `race_chien`;
CREATE TABLE IF NOT EXISTS `race_chien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

DROP TABLE IF EXISTS `veterinaire`;
CREATE TABLE IF NOT EXISTS `veterinaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(70) DEFAULT NULL,
  `prenom` varchar(70) DEFAULT NULL,
  `telephone` int DEFAULT NULL,
  `telephoneMobile` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

DROP TABLE IF EXISTS `visite`;
CREATE TABLE IF NOT EXISTS `visite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateVisite` date DEFAULT NULL,
  `heureVisite` time DEFAULT NULL,
  `raison` text,
  `idDossier` int DEFAULT NULL,
  `idAnimal` int DEFAULT NULL,
  `idVeterinaire` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Visite_Dossier1_idx` (`idDossier`),
  KEY `fk_Visite_Animal1_idx` (`idAnimal`),
  KEY `fk_Visite_Veterinaire1_idx` (`idVeterinaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
