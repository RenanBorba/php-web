CREATE DATABASE  IF NOT EXISTS `ideiacursos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ideiacursos`;
-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: 127.0.0.1
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_img` varchar(100) DEFAULT NULL,
  `course_duration` decimal(3,1) NOT NULL,
  `course_description` text,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CodeIgniter PHP','/public/images/courses/codeigniter.jpg',23.2,'O CodeIgniter é um Framework para Desenvolvimento de Aplicações – um kit de ferramentas – para pessoas que constroem websites usando PHP.\r\nSeu objetivo é permitir que você desenvolva projetos de um jeito muito mais rápido do que você faria se estivesse programando totalmente do zero.\r\nEle faz isso fornecendo um rico conjunto de bibliotecas mais comumente usadas para as tarefas mais necessárias, além de fornecer uma simples estrutura lógica de acesso à estas bibliotecas.\r\nEm resumo: o CodeIgniter é um framework maleável que tenta lhe fornecer as ferramentas necessárias ao mesmo tempo que fica fora do caminho, sem lhe atrapalhar.'),(2,'Cake PHP','/public/images/courses/cake.jpg',18.2,'CakePHP é um framework escrito em PHP que tem como principais objetivos oferecer uma estrutura que possibilite aos programadores de PHP de todos os níveis desenvolverem aplicações robustas rapidamente, sem perder flexibilidade.\r\nO CakePHP tem uma licença livre, é de código aberto, o que é ideal para qualquer tipo de projeto seja um freelance ou um projeto da sua empresa. Tem um objetivo claro de tornar o desenvolvimento organizado e rápido sem tirar flexibilidade.'),(3,'CodeIgniter Iniciante','/public/images/courses/STK-CodeIgniter.jpg',15.8,'Neste curso vamos conhecer um dos mais clássicos frameworks da atualidade, o CodeIgniter. Ele é ideal para quem não tem conhecimentos muito avançados em PHP e quer começar a organizar seu código, ao mesmo tempo em que quer maior produtividade. O Codelgniter trabalha com conceito MVC. Neste curso, ensinaremos a criar um CRUD e a implementar uma área restrita para atualização do site (homepage).'),(4,'MySQL','/public/images/courses/mysql.jpg',22.0,'MySQL é o banco de dados de código aberto mais famoso do mundo. Com desempenho, confiabilidade e facilidade de uso comprovados, o MySQL se tornou a principal opção de banco de dados para aplicativos baseados na Web, usado por propriedades da Web de alto perfil, incluindo Facebook, Twitter, YouTube e os cinco principais sites da Web*. Além disso, é uma escolha extremamente difundida como banco de dados integrado, distribuído por milhares de ISVs e OEMs.					');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(100) NOT NULL,
  `member_photo` varchar(100) DEFAULT NULL,
  `member_description` text,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Renan Borba','/public/images/team/Perfil_(3).jpg','Há mais de 6 anos em constante capacitação técnica, participação em estágios e ocupações na área da TI. Técnico de nível médio em Informática (2014), busco recolocação profissional após recém graduação no curso de Bacharelado em Sistemas de Informação (2018), Professor, 22 anos.'),(2,'Renan Delgado','/public/images/team/Perfil_(3).jpg','Há mais de 6 anos em constante capacitação técnica, participação em estágios e ocupações na área da TI. Técnico de nível médio em Informática (2014), busco recolocação profissional após recém graduação no curso de Bacharelado em Sistemas de Informação (2018), Professor, 22 anos.					');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(30) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `user_full_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rborba','$2y$10$y.kNGM.5dK65G2kVKSUXPuC/7QGmTTY9bL.1.aHYDQ71pwE.OV1lm','Renan Borba','renandbm.rb@gmail.com'),(2,'user_teste','$2y$10$64ZOsgIQFBq9LrkxaLZQo.Z/uZxrzWuvXuETuzwzltqCFTFU11EEW','Renan Delgado Borba Martiliano','renandbm.rb@hotmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-16 21:09:31
