-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 07 jan. 2021 à 09:36
-- Version du serveur :  8.0.22-0ubuntu0.20.04.3
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `micro_url`
--

-- --------------------------------------------------------

--
-- Structure de la table `mots_cles`
--

CREATE TABLE `mots_cles` (
  `mot_cle_id` int NOT NULL,
  `mot_cle` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mots_cles`
--

INSERT INTO `mots_cles` (`mot_cle_id`, `mot_cle`) VALUES
(1, 'basket'),
(2, 'gard'),
(3, 'national'),
(4, 'regional');

-- --------------------------------------------------------

--
-- Structure de la table `url`
--

CREATE TABLE `url` (
  `url_id` int NOT NULL,
  `url` text NOT NULL,
  `shortcut` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `url`
--

INSERT INTO `url` (`url_id`, `url`, `shortcut`, `datetime`, `description`) VALUES
(1, 'https://resultats.ffbb.com/championnat/b5e6211eee2f.html?r=200000002780719&d=200000002861502&p=5', 'bb-nm3_C', '2021-01-06 14:10:47', 'Résultats du championnat de basket NM3 poule C'),
(2, 'https://resultats.ffbb.com/organisation/808.html', 'bb-Dep-30', '2021-01-06 14:13:25', 'Résultats du championnat de basket départemental 30'),
(3, 'https://resultats.ffbb.com/championnat/b5e6211f1ce6.html?r=200000002792678&d=200000002875929&p=4', 'ffbb-DM30', '2021-01-06 16:16:00', 'Résultats du championnat de basket départemental masculin du Gard'),
(4, 'http://www.ffbb.com/', 'ffbb', '0000-00-00 00:00:00', 'site de la fede française de basket'),
(5, 'https://resultats.ffbb.com/organisation/b5e6211d5979.html', 'bb-Reg-Occitanie', '2021-01-07 09:00:03', 'Page des résultats de basket de la région Occitanie');

-- --------------------------------------------------------

--
-- Structure de la table `url_mots_cles`
--

CREATE TABLE `url_mots_cles` (
  `url_mots_cles_id` int NOT NULL,
  `id_mot_cle` int NOT NULL,
  `id_url` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `url_mots_cles`
--

INSERT INTO `url_mots_cles` (`url_mots_cles_id`, `id_mot_cle`, `id_url`) VALUES
(5, 1, 1),
(6, 3, 1),
(7, 1, 2),
(8, 2, 2),
(9, 2, 3),
(10, 1, 4),
(11, 1, 5),
(12, 4, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `mots_cles`
--
ALTER TABLE `mots_cles`
  ADD PRIMARY KEY (`mot_cle_id`);

--
-- Index pour la table `url`
--
ALTER TABLE `url`
  ADD PRIMARY KEY (`url_id`);

--
-- Index pour la table `url_mots_cles`
--
ALTER TABLE `url_mots_cles`
  ADD PRIMARY KEY (`url_mots_cles_id`),
  ADD KEY `id_url` (`id_url`),
  ADD KEY `id_mot_cle` (`id_mot_cle`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `mots_cles`
--
ALTER TABLE `mots_cles`
  MODIFY `mot_cle_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `url`
--
ALTER TABLE `url`
  MODIFY `url_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `url_mots_cles`
--
ALTER TABLE `url_mots_cles`
  MODIFY `url_mots_cles_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `url_mots_cles`
--
ALTER TABLE `url_mots_cles`
  ADD CONSTRAINT `url_mots_cles_ibfk_1` FOREIGN KEY (`id_mot_cle`) REFERENCES `mots_cles` (`mot_cle_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `url_mots_cles_ibfk_2` FOREIGN KEY (`id_url`) REFERENCES `url` (`url_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
