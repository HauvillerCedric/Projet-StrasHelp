# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.32)
# Database: strashelp
# Generation Time: 2023-05-09 14:48:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table association
# ------------------------------------------------------------

DROP TABLE IF EXISTS `association`;

CREATE TABLE `association` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `address` varchar(255) DEFAULT NULL,
  `dateCreate` date DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `credit` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `association_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `association` WRITE;
/*!40000 ALTER TABLE `association` DISABLE KEYS */;

INSERT INTO `association` (`id`, `name`, `description`, `address`, `dateCreate`, `phone`, `email`, `credit`, `user_id`, `password`, `type`)
VALUES
	(15,'Jean Eudes','Petanque','67210','2023-05-06','0783672987','jeaneuades@fr.com',NULL,NULL,'$2y$10$BmwQ9EgFAxva3MAC5bms8Opcyjp2v3sBytg5FhHmZq18P9sM4vi1S',0),
	(18,'Sabine','Langue des signes','Strasbourg','2023-05-03','0782541867','sabine@fr.com',NULL,NULL,'$2y$10$p5ucpoGmNjMI/0bXLeC4YecWtJIAAa21X93oFt.hAl0qyKdWo3vgW',0),
	(19,'John','enseignant de mathématiques','Strasbourg','2023-05-03','0718615390','john@fr.com',NULL,NULL,'$2y$10$xxUJ2tfJvz.Q5AxqLsz.2OtuSdFNCwNYXaap9L5iXA5kGBJOnDuQG',0),
	(20,'Herve','Apiculture','Klingenthal','2023-05-10','0725197280','herve@fr.com',NULL,NULL,'$2y$10$fDTzqtPVklsxGrDJVpKa2eBwiHXcisgpJhwlA6tZ/l4QlRUHXd9HW',0);

/*!40000 ALTER TABLE `association` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categorie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorie`;

CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;

INSERT INTO `categorie` (`id`, `description`)
VALUES
	(1,'Bricolage'),
	(2,'Cuisine'),
	(3,'Informatique'),
	(4,'Education'),
	(5,'Sport');

/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table note
# ------------------------------------------------------------

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `date` date DEFAULT NULL,
  `note` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `offre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `offre_id` (`offre_id`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;

INSERT INTO `note` (`id`, `date`, `note`, `user_id`, `offre_id`)
VALUES
	(53,'2023-05-03',1,2,1),
	(54,'2023-05-03',5,2,3),
	(55,'2023-05-03',5,1,2),
	(56,'2023-05-03',5,1,10),
	(57,'2023-05-04',4,2,6),
	(58,'2023-05-04',3,2,10),
	(59,'2023-05-04',3,1,4),
	(60,'2023-05-04',5,2,5),
	(61,'2023-05-04',4,2,8),
	(62,'2023-05-09',4,10,13),
	(63,'2023-05-09',4,10,8),
	(64,'2023-05-09',5,8,11),
	(65,'2023-05-09',5,9,15);

/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table offre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offre`;

CREATE TABLE `offre` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `availability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `categorie_id` int NOT NULL,
  `phone` text,
  PRIMARY KEY (`id`),
  KEY `categorie_id` (`categorie_id`),
  CONSTRAINT `offre_ibfk_3` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;

INSERT INTO `offre` (`id`, `title`, `description`, `availability`, `area`, `user_id`, `categorie_id`, `phone`)
VALUES
	(3,'Cours de langue','English/Portuguese','Semaine','Nice',3,4,''),
	(4,'Yoga','Cours de yoga a domicile','Semaine','Strasbourg',4,5,'0785038784'),
	(5,'Design','UI / UX','Semaine','Paris',5,3,NULL),
	(6,'Pétanque','Pétanque et pastis','Week-end','Nice',1,5,NULL),
	(8,'Menuiserie','meubles sur mesure','Semaine','Neudorf',3,1,NULL),
	(11,'Jardinage','Embellir votre jardin','semaine','Andlau',10,1,'0871654278'),
	(13,'Menage','maison et entreprise','semaine','Strasbourg',11,5,NULL),
	(15,'Capoeira','Pour les enfants et adultes','week-end','Obernai',4,5,'0785038784'),
	(16,'Couture','Tous les types de vêtements','semaine','Mullhouse',9,1,'7965Z96008'),
	(17,'Apiculture','Miel de fleurs sauvages, miel de châtaignier, miel d\'acacia.','week-end','Klingenthal',12,2,'0786433489');

/*!40000 ALTER TABLE `offre` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table particulier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `particulier`;

CREATE TABLE `particulier` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `credit` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `particulier_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `particulier` WRITE;
/*!40000 ALTER TABLE `particulier` DISABLE KEYS */;

INSERT INTO `particulier` (`id`, `name`, `description`, `phone`, `email`, `credit`, `user_id`, `password`, `address`, `type`)
VALUES
	(2,'Fouad','Hello','678565815','liondor67@gmail.com',NULL,NULL,'qwerty123@&','1 B RUE DES VOSGES',0),
	(9,'Mohammed','Cuisine','0782567180','momo@fr.com',NULL,NULL,'$2y$10$TSDOuUa9d.O56gmceq88uOn9RxRvNe5QdE8BD4ickYRIlfM9mQ/RK','67000',0),
	(10,'Marie Odile','repassage','0786725430','marieodile@fr.com',NULL,NULL,'$2y$10$bQUDVDtOUiLN5q9IhOR7HOjJ5ZclRLSf0lpSG.J/AMbESfRqaqG7.','Boesch',0),
	(11,'Benoit','Jardinage','0871654278','benoit@fr.com',NULL,NULL,'$2y$10$eA8EMbXXkoPRE3E68t/41usTzaOIYJQZ61aet1.XkGuwEJ4l5lEKu','Andlau',0);

/*!40000 ALTER TABLE `particulier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `login`, `password`)
VALUES
	(1,'yavuz','d4e520d9130bddccba586603dd622562'),
	(2,'stephane','f7885ad36a637f4a1212716eb9cdcff2'),
	(3,'cedric','c4de7df1bafd6d9b8f5d35d4328c93b0'),
	(4,'andressa','29a5641eaa0c01abe5749608c8232806'),
	(5,'fouad','a8ecea6c4e7d71454687bbd4c13f6945'),
	(7,'Jean Eudes','e068509c7d074054744afeab90035839'),
	(8,'Mohammed','06c56a89949d617def52f371c357b6db'),
	(9,'Marie Odile','b3725122c9d3bfef5664619e08e31877'),
	(10,'Benoit','0b36e58acc0a3c7f807b049c935f3b94'),
	(11,'Sabine','e668ab336799b9f36c47f8ce3c738d79'),
	(12,'Herve','eefde70a4a3c5afdde3f2deac5a4954a');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
