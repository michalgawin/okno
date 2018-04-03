CREATE DATABASE  IF NOT EXISTS `okno` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `okno`;
-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: okno
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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
-- Table structure for table `ban_ip`
--

DROP TABLE IF EXISTS `ban_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ban_ip` (
  `ip` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban_ip`
--

LOCK TABLES `ban_ip` WRITE;
/*!40000 ALTER TABLE `ban_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ban_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `eksport`
--

DROP TABLE IF EXISTS `eksport`;
/*!50001 DROP VIEW IF EXISTS `eksport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `eksport` AS SELECT 
 1 AS `uzytkownik_id`,
 1 AS `rok_startu`,
 1 AS `NULL`,
 1 AS `nr_indeks`,
 1 AS `nazwisko`,
 1 AS `imie_1`,
 1 AS `imie_2`,
 1 AS `imie_ojca`,
 1 AS `imie_matki`,
 1 AS `pesel`,
 1 AS `My_exp_NULL`,
 1 AS `plec`,
 1 AS `data_urodzenia`,
 1 AS `miejsce_urodzenia`,
 1 AS `adres_kod`,
 1 AS `adres_poczta`,
 1 AS `adres_2`,
 1 AS `adres_1`,
 1 AS `My_exp_1_NULL`,
 1 AS `My_exp_2_NULL`,
 1 AS `telefon`,
 1 AS `email`,
 1 AS `adr_kor_kod`,
 1 AS `adr_kor_poczta`,
 1 AS `adr_kor_2`,
 1 AS `adr_kor_1`,
 1 AS `My_exp_3_NULL`,
 1 AS `My_exp_4_NULL`,
 1 AS `dodatkowy_telefon`,
 1 AS `dodatkowy_email`,
 1 AS `My_exp_5_NULL`,
 1 AS `wku`,
 1 AS `rok_matury`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grupa`
--

DROP TABLE IF EXISTS `grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupa` (
  `grupa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `typ_studiow_id` smallint(6) DEFAULT NULL,
  `rok_akademicki_id` int(11) DEFAULT NULL,
  `specjalnosc_id` int(11) DEFAULT NULL,
  `rok_studiow` int(11) DEFAULT NULL,
  PRIMARY KEY (`grupa_id`),
  KEY `nazwa` (`nazwa`),
  KEY `typ_studiow_id` (`typ_studiow_id`),
  KEY `rok_akademicki_id` (`rok_akademicki_id`),
  KEY `specjalnosc_id` (`specjalnosc_id`),
  CONSTRAINT `grupa_ibfk_1` FOREIGN KEY (`typ_studiow_id`) REFERENCES `sl_typ_studiow` (`typ_studiow_id`) ON UPDATE CASCADE,
  CONSTRAINT `grupa_ibfk_2` FOREIGN KEY (`rok_akademicki_id`) REFERENCES `sl_rok_akademicki` (`rok_akademicki_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa`
--

LOCK TABLES `grupa` WRITE;
/*!40000 ALTER TABLE `grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `harmonogram_pozycja`
--

DROP TABLE IF EXISTS `harmonogram_pozycja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harmonogram_pozycja` (
  `harmonogram_pozycja_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) DEFAULT NULL,
  `typ_studiow_id` smallint(6) DEFAULT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `miejsce` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `data_od` datetime NOT NULL,
  `data_do` datetime DEFAULT NULL,
  `widoczna` tinyint(1) NOT NULL DEFAULT '0',
  `widoczna_all` tinyint(1) NOT NULL DEFAULT '0',
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`harmonogram_pozycja_id`),
  KEY `typ_studiow_id` (`typ_studiow_id`),
  CONSTRAINT `harmonogram_pozycja_ibfk_1` FOREIGN KEY (`typ_studiow_id`) REFERENCES `sl_typ_studiow` (`typ_studiow_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harmonogram_pozycja`
--

LOCK TABLES `harmonogram_pozycja` WRITE;
/*!40000 ALTER TABLE `harmonogram_pozycja` DISABLE KEYS */;
/*!40000 ALTER TABLE `harmonogram_pozycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kalendarz_pozycja`
--

DROP TABLE IF EXISTS `kalendarz_pozycja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kalendarz_pozycja` (
  `kalendarz_pozycja_id` int(11) NOT NULL AUTO_INCREMENT,
  `rok_akademicki_id` int(11) DEFAULT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `data_od` date NOT NULL,
  `data_do` date DEFAULT NULL,
  `subpozycja_id` int(11) DEFAULT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`kalendarz_pozycja_id`),
  KEY `rok_akademicki_id` (`rok_akademicki_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kalendarz_pozycja`
--

LOCK TABLES `kalendarz_pozycja` WRITE;
/*!40000 ALTER TABLE `kalendarz_pozycja` DISABLE KEYS */;
INSERT INTO `kalendarz_pozycja` VALUES (1,2,'Wpis 1','2014-10-05','2015-01-12',NULL,0,'0000-00-00 00:00:00',NULL,NULL),(2,2,'Wpis 2','2014-10-06','2015-01-12',NULL,0,'0000-00-00 00:00:00',NULL,NULL),(3,1,'Wpis 3','2013-10-05','2014-01-12',NULL,0,'0000-00-00 00:00:00',NULL,NULL),(4,3,'Język angielski - poziom A','2015-10-05','2016-01-12',NULL,0,'0000-00-00 00:00:00',NULL,NULL),(5,3,'Kurs programowania - Java','2015-11-05','2016-02-12',NULL,0,'0000-00-00 00:00:00',NULL,NULL),(6,3,'Egzamin z programowania C++','2015-12-19','2015-12-19',NULL,0,'0000-00-00 00:00:00',NULL,NULL),(7,3,'Bardzo długa nazwa, która może zostać wyświetlona w brzydki sposób, ale zobaczymy. 1234567890 koniec.','2016-01-01','2016-09-12',NULL,0,'0000-00-00 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `kalendarz_pozycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kandydat_inz`
--

DROP TABLE IF EXISTS `kandydat_inz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kandydat_inz` (
  `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwisko` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `imie_1` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `imie_2` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `plec` char(1) COLLATE utf8_polish_ci NOT NULL DEFAULT 'm',
  `login` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `miejsce_urodzenia` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_studiow_id` smallint(6) DEFAULT NULL,
  `specjalnosc_id` int(11) DEFAULT NULL,
  `imie_matki` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `imie_ojca` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko_panienskie_matki` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `pesel` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `nip` varchar(13) COLLATE utf8_polish_ci DEFAULT NULL,
  `dowod_nr` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_wojewodztwo_id` int(11) DEFAULT NULL,
  `adres_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT 'Polska',
  `adr_kor_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_wojewodztwo_id` int(11) DEFAULT NULL,
  `adr_kor_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT 'Polska',
  `telefon_2` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `msc_zam_typ_id` int(11) DEFAULT NULL,
  `dochod_typ_id` int(11) DEFAULT NULL,
  `szkola_srednia_typ_id` int(11) DEFAULT NULL,
  `studiowal_na_pw` tinyint(1) DEFAULT NULL,
  `stary_nr_indeksu` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `wku_adres` text COLLATE utf8_polish_ci,
  `rok_matury` varchar(4) COLLATE utf8_polish_ci DEFAULT NULL,
  `rodzaj_matury_id` tinyint(4) DEFAULT NULL,
  `szkola_srednia_nazwa` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `mgr_dyplom_1_stopien_id` int(11) DEFAULT NULL,
  `mgr_kierunek` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `mgr_uczelnia` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `numer` int(11) DEFAULT NULL,
  `kandydat_status_id` int(11) DEFAULT '0',
  `data_rejestracji` datetime DEFAULT NULL,
  `aktywny` tinyint(1) NOT NULL DEFAULT '1',
  `usuniety` tinyint(1) NOT NULL DEFAULT '0',
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_id`),
  UNIQUE KEY `login` (`login`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`),
  KEY `nazwisko` (`nazwisko`,`imie_1`,`imie_2`) USING BTREE,
  KEY `specjalnosc_id` (`specjalnosc_id`),
  KEY `adres_wojewodztwo_id` (`adres_wojewodztwo_id`),
  KEY `adr_kor_wojewodztwo_id` (`adr_kor_wojewodztwo_id`),
  KEY `typ_studiow_id` (`typ_studiow_id`),
  KEY `mgr_dyplom_1_stopien_id` (`mgr_dyplom_1_stopien_id`),
  CONSTRAINT `kandydat_inz_ibfk_16` FOREIGN KEY (`typ_studiow_id`) REFERENCES `sl_typ_studiow` (`typ_studiow_id`) ON UPDATE CASCADE,
  CONSTRAINT `kandydat_inz_ibfk_17` FOREIGN KEY (`specjalnosc_id`) REFERENCES `specjalnosc` (`specjalnosc_id`) ON UPDATE CASCADE,
  CONSTRAINT `kandydat_inz_ibfk_18` FOREIGN KEY (`adres_wojewodztwo_id`) REFERENCES `sl_wojewodztwo` (`wojewodztwo_id`) ON UPDATE CASCADE,
  CONSTRAINT `kandydat_inz_ibfk_19` FOREIGN KEY (`adr_kor_wojewodztwo_id`) REFERENCES `sl_wojewodztwo` (`wojewodztwo_id`) ON UPDATE CASCADE,
  CONSTRAINT `kandydat_inz_ibfk_20` FOREIGN KEY (`mgr_dyplom_1_stopien_id`) REFERENCES `sl_dyplom_1_stopien` (`dyplom_1_stopien_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kandydat_inz`
--

LOCK TABLES `kandydat_inz` WRITE;
/*!40000 ALTER TABLE `kandydat_inz` DISABLE KEYS */;
INSERT INTO `kandydat_inz` VALUES (1,'John','Doe',NULL,'m','john.doe','haslo','john.doe@mail.com','123456789',NULL,NULL,1,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,NULL,NULL,NULL),(2,'Stone','Kate',NULL,'m','kate.stone','haslo','kate.stone@mail.com','987654321',NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `kandydat_inz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ogolne`
--

DROP TABLE IF EXISTS `log_ogolne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_ogolne` (
  `log_ogolne_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `ip` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`log_ogolne_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ogolne`
--

LOCK TABLES `log_ogolne` WRITE;
/*!40000 ALTER TABLE `log_ogolne` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_ogolne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_witryna`
--

DROP TABLE IF EXISTS `log_witryna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_witryna` (
  `log_witryna_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`log_witryna_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `przedmiot_edycja_id` (`przedmiot_edycja_id`)
) ENGINE=MyISAM AUTO_INCREMENT=301857 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_witryna`
--

LOCK TABLES `log_witryna` WRITE;
/*!40000 ALTER TABLE `log_witryna` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_witryna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obc_okres`
--

DROP TABLE IF EXISTS `obc_okres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obc_okres` (
  `obc_okres_id` int(20) NOT NULL AUTO_INCREMENT,
  `rok_akademicki_id` int(11) NOT NULL,
  `data_od` date NOT NULL,
  `data_do` date NOT NULL,
  `semestr_id` int(11) NOT NULL,
  PRIMARY KEY (`obc_okres_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obc_okres`
--

LOCK TABLES `obc_okres` WRITE;
/*!40000 ALTER TABLE `obc_okres` DISABLE KEYS */;
INSERT INTO `obc_okres` VALUES (1,3,'2015-10-01','2016-01-31',1),(2,3,'2016-02-01','2016-09-30',2),(3,2,'2015-10-01','2016-01-31',1),(4,2,'2016-02-01','2016-08-30',2),(5,1,'2015-10-01','2016-01-31',1),(6,1,'2016-02-01','2016-08-30',2);
/*!40000 ALTER TABLE `obc_okres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obc_realizacja`
--

DROP TABLE IF EXISTS `obc_realizacja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obc_realizacja` (
  `obc_realizacja_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(20) DEFAULT NULL,
  `przedmiot_id` int(11) DEFAULT NULL,
  `opis` varchar(200) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_zajec_id` int(11) DEFAULT NULL,
  `obc_okres_id` int(11) NOT NULL,
  `rok_akademicki_id` smallint(6) DEFAULT NULL,
  `semestr_id` smallint(6) DEFAULT NULL,
  `liczba_godzin` float NOT NULL,
  `wspolczynnik` float NOT NULL,
  `wspolczynnik_id` int(11) DEFAULT NULL,
  `liczba_godzin_final` float NOT NULL,
  `liczba_osob` int(11) DEFAULT NULL,
  `liczba_zespolow` int(11) NOT NULL DEFAULT '1',
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`obc_realizacja_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  KEY `typ_zajec_id` (`typ_zajec_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `obc_okres_id` (`obc_okres_id`),
  KEY `rok_akademicki_id` (`rok_akademicki_id`),
  KEY `semestr_id` (`semestr_id`),
  CONSTRAINT `obc_realizacja_ibfk_10` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`) ON UPDATE CASCADE,
  CONSTRAINT `obc_realizacja_ibfk_11` FOREIGN KEY (`typ_zajec_id`) REFERENCES `sl_typ_zajec` (`typ_zajec_id`) ON UPDATE CASCADE,
  CONSTRAINT `obc_realizacja_ibfk_12` FOREIGN KEY (`semestr_id`) REFERENCES `sl_semestr` (`semestr_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obc_realizacja`
--

LOCK TABLES `obc_realizacja` WRITE;
/*!40000 ALTER TABLE `obc_realizacja` DISABLE KEYS */;
/*!40000 ALTER TABLE `obc_realizacja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obc_realizacja_grupa`
--

DROP TABLE IF EXISTS `obc_realizacja_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obc_realizacja_grupa` (
  `obc_realizacja_grupa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obc_realizacja_id` bigint(20) NOT NULL,
  `grupa_id` int(11) NOT NULL,
  PRIMARY KEY (`obc_realizacja_grupa_id`),
  UNIQUE KEY `obc_realizacja_id` (`obc_realizacja_id`,`grupa_id`),
  KEY `grupa_id` (`grupa_id`),
  CONSTRAINT `obc_realizacja_grupa_ibfk_1` FOREIGN KEY (`obc_realizacja_id`) REFERENCES `obc_realizacja` (`obc_realizacja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obc_realizacja_grupa_ibfk_2` FOREIGN KEY (`grupa_id`) REFERENCES `grupa` (`grupa_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obc_realizacja_grupa`
--

LOCK TABLES `obc_realizacja_grupa` WRITE;
/*!40000 ALTER TABLE `obc_realizacja_grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `obc_realizacja_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obc_realizacja_osoba`
--

DROP TABLE IF EXISTS `obc_realizacja_osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obc_realizacja_osoba` (
  `obc_realizacja_osoba_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obc_realizacja_id` bigint(20) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `godzin` decimal(10,2) NOT NULL,
  `procent` decimal(7,4) DEFAULT NULL,
  PRIMARY KEY (`obc_realizacja_osoba_id`),
  UNIQUE KEY `obc_realizacja_id` (`obc_realizacja_id`,`uzytkownik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `obc_realizacja_osoba_ibfk_1` FOREIGN KEY (`obc_realizacja_id`) REFERENCES `obc_realizacja` (`obc_realizacja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obc_realizacja_osoba_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obc_realizacja_osoba`
--

LOCK TABLES `obc_realizacja_osoba` WRITE;
/*!40000 ALTER TABLE `obc_realizacja_osoba` DISABLE KEYS */;
/*!40000 ALTER TABLE `obc_realizacja_osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obc_rok_akademicki`
--

DROP TABLE IF EXISTS `obc_rok_akademicki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obc_rok_akademicki` (
  `rok_akademicki_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`rok_akademicki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obc_rok_akademicki`
--

LOCK TABLES `obc_rok_akademicki` WRITE;
/*!40000 ALTER TABLE `obc_rok_akademicki` DISABLE KEYS */;
/*!40000 ALTER TABLE `obc_rok_akademicki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_grupa`
--

DROP TABLE IF EXISTS `obl_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_grupa` (
  `obl_grupa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `semestr` smallint(6) NOT NULL,
  `osob` int(11) NOT NULL,
  `zesp_lab` int(11) NOT NULL,
  `zesp_proj` float NOT NULL DEFAULT '2',
  `specjalnosc_id` int(11) DEFAULT NULL,
  `obl_rok_id` int(11) NOT NULL,
  PRIMARY KEY (`obl_grupa_id`),
  KEY `obl_rok_id` (`obl_rok_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_grupa`
--

LOCK TABLES `obl_grupa` WRITE;
/*!40000 ALTER TABLE `obl_grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_grupa_przedmiot`
--

DROP TABLE IF EXISTS `obl_grupa_przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_grupa_przedmiot` (
  `obl_grupa_przedmiot_id` int(11) NOT NULL AUTO_INCREMENT,
  `obl_przedmiot_id` int(11) NOT NULL,
  `obl_grupa_id` int(11) NOT NULL,
  PRIMARY KEY (`obl_grupa_przedmiot_id`),
  UNIQUE KEY `przedmiot_id` (`obl_przedmiot_id`,`obl_grupa_id`),
  KEY `obl_grupa_id` (`obl_grupa_id`),
  CONSTRAINT `obl_grupa_przedmiot_ibfk_1` FOREIGN KEY (`obl_przedmiot_id`) REFERENCES `obl_przedmiot` (`obl_przedmiot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `obl_grupa_przedmiot_ibfk_2` FOREIGN KEY (`obl_grupa_id`) REFERENCES `obl_grupa` (`obl_grupa_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_grupa_przedmiot`
--

LOCK TABLES `obl_grupa_przedmiot` WRITE;
/*!40000 ALTER TABLE `obl_grupa_przedmiot` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_grupa_przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_przedmiot`
--

DROP TABLE IF EXISTS `obl_przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_przedmiot` (
  `obl_przedmiot_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `odpowiedzialny_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `semestr` smallint(6) NOT NULL,
  `obieralny` tinyint(1) NOT NULL,
  `wspolczynnik` float NOT NULL DEFAULT '1',
  `egzamin` tinyint(1) NOT NULL,
  `obl_rok_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`obl_przedmiot_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  KEY `obl_rok_id` (`obl_rok_id`),
  CONSTRAINT `obl_przedmiot_ibfk_1` FOREIGN KEY (`obl_rok_id`) REFERENCES `obl_rok` (`obl_rok_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_przedmiot`
--

LOCK TABLES `obl_przedmiot` WRITE;
/*!40000 ALTER TABLE `obl_przedmiot` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_przedmiot_specjalnosc`
--

DROP TABLE IF EXISTS `obl_przedmiot_specjalnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_przedmiot_specjalnosc` (
  `obl_przedmiot_id` int(11) NOT NULL,
  `specjalnosc_id` int(11) NOT NULL,
  PRIMARY KEY (`obl_przedmiot_id`,`specjalnosc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_przedmiot_specjalnosc`
--

LOCK TABLES `obl_przedmiot_specjalnosc` WRITE;
/*!40000 ALTER TABLE `obl_przedmiot_specjalnosc` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_przedmiot_specjalnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_rok`
--

DROP TABLE IF EXISTS `obl_rok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_rok` (
  `obl_rok_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`obl_rok_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_rok`
--

LOCK TABLES `obl_rok` WRITE;
/*!40000 ALTER TABLE `obl_rok` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_rok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_sala`
--

DROP TABLE IF EXISTS `obl_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_sala` (
  `sala_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `pojemnosc` int(11) DEFAULT NULL,
  `sala_typ_id` int(11) NOT NULL,
  `projektor` tinyint(1) NOT NULL,
  PRIMARY KEY (`sala_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_sala`
--

LOCK TABLES `obl_sala` WRITE;
/*!40000 ALTER TABLE `obl_sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_zajecia`
--

DROP TABLE IF EXISTS `obl_zajecia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_zajecia` (
  `zajecia_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_id` int(11) NOT NULL,
  `typ_zajec_id` int(11) DEFAULT NULL,
  `grupa_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`zajecia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_zajecia`
--

LOCK TABLES `obl_zajecia` WRITE;
/*!40000 ALTER TABLE `obl_zajecia` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_zajecia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obl_zajecia_data`
--

DROP TABLE IF EXISTS `obl_zajecia_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obl_zajecia_data` (
  `zajecia_data_id` int(11) NOT NULL,
  `zajecia_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `godzin` float NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `sala_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`zajecia_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obl_zajecia_data`
--

LOCK TABLES `obl_zajecia_data` WRITE;
/*!40000 ALTER TABLE `obl_zajecia_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `obl_zajecia_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogloszenie_ogolne`
--

DROP TABLE IF EXISTS `ogloszenie_ogolne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogloszenie_ogolne` (
  `ogloszenie_ogolne_id` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `data_zamieszczenia` datetime NOT NULL,
  `data_konca` date DEFAULT NULL,
  `widoczne` tinyint(1) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  PRIMARY KEY (`ogloszenie_ogolne_id`),
  KEY `zamiescil_id` (`uzytkownik_id`),
  KEY `data_zamieszczenia` (`data_zamieszczenia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogloszenie_ogolne`
--

LOCK TABLES `ogloszenie_ogolne` WRITE;
/*!40000 ALTER TABLE `ogloszenie_ogolne` DISABLE KEYS */;
INSERT INTO `ogloszenie_ogolne` VALUES (1,'Zapisy na sesję poprawkową we wrześniu','Uruchomione zostały zapisy na egzaminy w sesji poprawkowej we wrześniu.\r\n\r\nW Witrynie Studentów w sesji wrześniowej(zaznaczyłam kolorem czerwonym) należy dokonać zapisu na egzamin z zaległego przedmiotu','2015-07-01 00:00:00',NULL,1,4),(2,'Esy floresy','No i po uruchomieniu.','2015-07-31 00:00:00',NULL,1,4),(3,'ŚŹĄęćżó','Ta wiadomość pokazuje czy UNICODE jest wyświetlany poprawnie','2015-07-15 00:00:00',NULL,1,4),(4,'Zdarzenie nr 4','John Doe coś tam robi','2015-07-16 00:00:00',NULL,1,1);
/*!40000 ALTER TABLE `ogloszenie_ogolne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogloszenie_ogolne_ograniczenia`
--

DROP TABLE IF EXISTS `ogloszenie_ogolne_ograniczenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogloszenie_ogolne_ograniczenia` (
  `ogloszenie_ogolne_ograniczenia_id` int(11) NOT NULL AUTO_INCREMENT,
  `ogloszenie_ogolne_id` int(11) NOT NULL,
  `publiczne` tinyint(1) DEFAULT NULL,
  `pracownicze` tinyint(1) DEFAULT NULL,
  `typ_studiow` int(11) DEFAULT NULL,
  PRIMARY KEY (`ogloszenie_ogolne_ograniczenia_id`),
  KEY `ogloszenie_ogolne_id` (`ogloszenie_ogolne_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogloszenie_ogolne_ograniczenia`
--

LOCK TABLES `ogloszenie_ogolne_ograniczenia` WRITE;
/*!40000 ALTER TABLE `ogloszenie_ogolne_ograniczenia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogloszenie_ogolne_ograniczenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogloszenie_stale`
--

DROP TABLE IF EXISTS `ogloszenie_stale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogloszenie_stale` (
  `wydzial_id` int(11) NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `_modyfikowal_id` int(11) NOT NULL,
  `_modyfikowal_data` date NOT NULL,
  PRIMARY KEY (`wydzial_id`),
  KEY `_modyfikowal_id` (`_modyfikowal_id`),
  KEY `_modyfikowal_data` (`_modyfikowal_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogloszenie_stale`
--

LOCK TABLES `ogloszenie_stale` WRITE;
/*!40000 ALTER TABLE `ogloszenie_stale` DISABLE KEYS */;
INSERT INTO `ogloszenie_stale` VALUES (1,'NAUKA\r\nKażdy Student zapisuje się na przedmioty w Witrynie Studentów w naszym portalu. ',1,'2015-07-01'),(2,'Język angielski to PRZEDMIOT na który Student zapisuje się na początku ...',2,'2015-07-10'),(3,'Dla Studentów z rekrutacji 2009/2010 ważne jest uzyskanie ...',3,'2015-07-10');
/*!40000 ALTER TABLE `ogloszenie_stale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogloszenie_stale_plik`
--

DROP TABLE IF EXISTS `ogloszenie_stale_plik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ogloszenie_stale_plik` (
  `plik_id` int(11) NOT NULL AUTO_INCREMENT,
  `wydzial_id` int(11) NOT NULL,
  `nazwa` varchar(300) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `data_dodania` date NOT NULL,
  PRIMARY KEY (`plik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogloszenie_stale_plik`
--

LOCK TABLES `ogloszenie_stale_plik` WRITE;
/*!40000 ALTER TABLE `ogloszenie_stale_plik` DISABLE KEYS */;
/*!40000 ALTER TABLE `ogloszenie_stale_plik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oplata`
--

DROP TABLE IF EXISTS `oplata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oplata` (
  `platnosc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `przedmiot_id` int(11) DEFAULT NULL,
  `przedmiot_edycja_id` int(11) DEFAULT NULL,
  `kwota` float NOT NULL,
  `przedmiot` varchar(250) COLLATE utf8_polish_ci DEFAULT NULL,
  `notatki` text COLLATE utf8_polish_ci,
  `data_wplywu` date NOT NULL,
  `data_ksiegowania` date DEFAULT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`platnosc_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`,`przedmiot_id`,`data_wplywu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oplata`
--

LOCK TABLES `oplata` WRITE;
/*!40000 ALTER TABLE `oplata` DISABLE KEYS */;
/*!40000 ALTER TABLE `oplata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `data` date NOT NULL,
  `widoczny` tinyint(1) DEFAULT NULL,
  `kolejnosc` int(11) DEFAULT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `rok` (`data`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,'Przedmioty podstawowe','2015-08-16',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Przedmioty informatyki ','2015-08-12',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Zjazdy laboratoryjne ','2015-07-14',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Przedmioty ekonomiczno-społeczne ','2015-08-20',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Przedmioty kierunkowe wspólne ','2015-08-26',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Przedmioty kierunkowe wydziałowe - EiTI ','2015-08-13',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Przedmioty kierunkowe wydziałowe - Elektryczny ','2015-08-20',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Przedmioty kierunkowe wydziałowe - Mechatronika ','2015-08-28',NULL,NULL,NULL,NULL,NULL,NULL),(9,'Przedmioty specjalności - inżynieria komputerowa ','2015-08-25',NULL,NULL,NULL,NULL,NULL,NULL),(10,'Przedmioty specjalności - Techniki Multimedialne ','2015-08-27',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_pozycja`
--

DROP TABLE IF EXISTS `plan_pozycja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_pozycja` (
  `plan_pozycja_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `typ_plan_pozycja_id` int(11) NOT NULL,
  `przedmiot_id` int(11) DEFAULT NULL,
  `wariant_id` int(11) DEFAULT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `ects` int(11) NOT NULL DEFAULT '0',
  `typ_zaliczenie_id` int(11) NOT NULL,
  `semestr_od` int(11) NOT NULL,
  `semestr_do` int(11) DEFAULT NULL,
  `wyklad` float DEFAULT NULL,
  `cwiczenia` float DEFAULT NULL,
  `laboratorium` float DEFAULT NULL,
  `projekt` float DEFAULT NULL,
  `seminarium` float DEFAULT NULL,
  `lab_komp` float DEFAULT NULL,
  PRIMARY KEY (`plan_pozycja_id`),
  UNIQUE KEY `plan_id_2` (`plan_id`,`przedmiot_id`),
  KEY `plan_id` (`plan_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  KEY `typ_zaliczenie_id` (`typ_zaliczenie_id`),
  KEY `typ` (`typ_plan_pozycja_id`),
  KEY `wariant_id` (`wariant_id`),
  CONSTRAINT `plan_pozycja_ibfk_3` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plan_pozycja_ibfk_4` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`),
  CONSTRAINT `plan_pozycja_ibfk_5` FOREIGN KEY (`typ_zaliczenie_id`) REFERENCES `sl_typ_zaliczenie` (`typ_zaliczenie_id`) ON UPDATE CASCADE,
  CONSTRAINT `plan_pozycja_ibfk_6` FOREIGN KEY (`typ_plan_pozycja_id`) REFERENCES `sl_typ_plan_pozycja` (`typ_plan_pozycja_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_pozycja`
--

LOCK TABLES `plan_pozycja` WRITE;
/*!40000 ALTER TABLE `plan_pozycja` DISABLE KEYS */;
INSERT INTO `plan_pozycja` VALUES (1,1,1,3,NULL,NULL,6,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,2,4,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,2,17,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,2,19,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(5,3,2,18,NULL,NULL,4,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(6,5,2,21,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(7,5,1,22,NULL,NULL,6,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(8,6,2,23,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(9,1,1,5,NULL,NULL,6,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(10,1,1,6,NULL,NULL,6,1,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(11,1,1,7,NULL,NULL,6,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(12,1,1,8,NULL,NULL,6,1,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(13,2,2,13,NULL,NULL,4,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(14,2,2,14,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(15,2,2,15,NULL,NULL,4,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(16,2,2,16,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(17,4,2,20,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(18,6,2,24,NULL,NULL,4,2,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(19,7,2,25,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(20,7,2,26,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(21,8,2,27,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(22,8,2,9,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(23,9,2,29,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(24,9,2,30,NULL,NULL,4,2,1,2,NULL,NULL,NULL,NULL,NULL,NULL),(25,10,2,31,NULL,NULL,4,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(26,10,2,32,NULL,NULL,4,2,1,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `plan_pozycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_sala`
--

DROP TABLE IF EXISTS `plan_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_sala` (
  `plan_sala_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `pojemnosc` int(11) NOT NULL,
  `rzutnik` tinyint(1) NOT NULL,
  `laboratorium` tinyint(1) NOT NULL,
  PRIMARY KEY (`plan_sala_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_sala`
--

LOCK TABLES `plan_sala` WRITE;
/*!40000 ALTER TABLE `plan_sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_uruchomien`
--

DROP TABLE IF EXISTS `plan_uruchomien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_uruchomien` (
  `plan_uruchomienie_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `rok` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `widoczny` tinyint(1) NOT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`plan_uruchomienie_id`),
  KEY `rok` (`rok`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_uruchomien`
--

LOCK TABLES `plan_uruchomien` WRITE;
/*!40000 ALTER TABLE `plan_uruchomien` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_uruchomien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_uruchomien_przedmiot`
--

DROP TABLE IF EXISTS `plan_uruchomien_przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_uruchomien_przedmiot` (
  `plan_przedmiot_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `ects` int(11) NOT NULL,
  `sl_semestr_id` int(11) NOT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`plan_przedmiot_id`),
  KEY `plan_id` (`plan_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`),
  KEY `typ_zaliczenie_id` (`sl_semestr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_uruchomien_przedmiot`
--

LOCK TABLES `plan_uruchomien_przedmiot` WRITE;
/*!40000 ALTER TABLE `plan_uruchomien_przedmiot` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_uruchomien_przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_wariant`
--

DROP TABLE IF EXISTS `plan_wariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_wariant` (
  `wariant_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`wariant_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `plan_wariant_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_wariant`
--

LOCK TABLES `plan_wariant` WRITE;
/*!40000 ALTER TABLE `plan_wariant` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_wariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_wariant_przedmiot`
--

DROP TABLE IF EXISTS `plan_wariant_przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan_wariant_przedmiot` (
  `wariant_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  PRIMARY KEY (`wariant_id`,`przedmiot_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  CONSTRAINT `plan_wariant_przedmiot_ibfk_1` FOREIGN KEY (`wariant_id`) REFERENCES `plan_wariant` (`wariant_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plan_wariant_przedmiot_ibfk_2` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_wariant_przedmiot`
--

LOCK TABLES `plan_wariant_przedmiot` WRITE;
/*!40000 ALTER TABLE `plan_wariant_przedmiot` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_wariant_przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praca_student`
--

DROP TABLE IF EXISTS `praca_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `praca_student` (
  `praca_student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `opiekun_id` int(11) DEFAULT NULL,
  `konsultant_id` int(11) DEFAULT NULL,
  `recenzent_id` int(11) DEFAULT NULL,
  `konsultant_zewnetrzny` varchar(250) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_praca_id` int(11) NOT NULL,
  `temat` varchar(400) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `data_wydania` date DEFAULT NULL,
  `data_zlozenia` date DEFAULT NULL,
  `data_obrony` date DEFAULT NULL,
  `ocena_koncowa` float DEFAULT NULL,
  `ocena_praca` float DEFAULT NULL,
  `ocena_egzamin` float DEFAULT NULL,
  `srednia` float DEFAULT NULL,
  `numer` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `plik` varchar(512) COLLATE utf8_polish_ci DEFAULT NULL,
  `poster` varchar(512) COLLATE utf8_polish_ci DEFAULT NULL,
  `prezentacja` varchar(512) COLLATE utf8_polish_ci DEFAULT NULL,
  `protokol` varchar(512) COLLATE utf8_polish_ci DEFAULT NULL,
  `rok_akademicki_wydania_id` int(11) DEFAULT NULL,
  `rok_akademicki_rozliczenia_id` int(11) DEFAULT NULL,
  `wydruk_skierowanie` int(11) DEFAULT '0',
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`praca_student_id`),
  UNIQUE KEY `student_id_2` (`student_id`,`typ_praca_id`),
  KEY `opiekun_id` (`opiekun_id`),
  KEY `typ_praca_id` (`typ_praca_id`),
  KEY `konsultant_id` (`konsultant_id`),
  KEY `recenzent_id` (`recenzent_id`),
  CONSTRAINT `praca_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `praca_student_ibfk_2` FOREIGN KEY (`opiekun_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE,
  CONSTRAINT `praca_student_ibfk_3` FOREIGN KEY (`typ_praca_id`) REFERENCES `sl_typ_praca` (`typ_praca_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praca_student`
--

LOCK TABLES `praca_student` WRITE;
/*!40000 ALTER TABLE `praca_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `praca_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praca_temat`
--

DROP TABLE IF EXISTS `praca_temat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `praca_temat` (
  `praca_temat_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_praca_id` int(11) NOT NULL,
  `opiekun_id` int(11) NOT NULL,
  `temat` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `temat_en` varchar(256) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `wymagania` text COLLATE utf8_polish_ci,
  `zakres` text COLLATE utf8_polish_ci,
  `literatura` text COLLATE utf8_polish_ci,
  `widoczna` tinyint(1) NOT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`praca_temat_id`),
  KEY `typ_praca_id` (`typ_praca_id`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`),
  KEY `opiekun_id` (`opiekun_id`),
  KEY `temat` (`temat`(255)),
  CONSTRAINT `praca_temat_ibfk_1` FOREIGN KEY (`typ_praca_id`) REFERENCES `sl_typ_praca` (`typ_praca_id`),
  CONSTRAINT `praca_temat_ibfk_2` FOREIGN KEY (`_wprowadzil`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `praca_temat_ibfk_3` FOREIGN KEY (`_modyfikowal`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `praca_temat_ibfk_4` FOREIGN KEY (`opiekun_id`) REFERENCES `pracownik_dodatkowe` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praca_temat`
--

LOCK TABLES `praca_temat` WRITE;
/*!40000 ALTER TABLE `praca_temat` DISABLE KEYS */;
/*!40000 ALTER TABLE `praca_temat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praca_temat_specjalnosc`
--

DROP TABLE IF EXISTS `praca_temat_specjalnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `praca_temat_specjalnosc` (
  `praca_temat_specjalnosc_id` int(11) NOT NULL AUTO_INCREMENT,
  `praca_temat_id` int(11) NOT NULL,
  `specjalnosc_id` int(11) NOT NULL,
  `zatwierdzil` int(11) DEFAULT NULL,
  `zatwierdzil_data` datetime DEFAULT NULL,
  PRIMARY KEY (`praca_temat_specjalnosc_id`),
  UNIQUE KEY `praca_temat_id` (`praca_temat_id`,`specjalnosc_id`),
  KEY `zatwierdzil` (`zatwierdzil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praca_temat_specjalnosc`
--

LOCK TABLES `praca_temat_specjalnosc` WRITE;
/*!40000 ALTER TABLE `praca_temat_specjalnosc` DISABLE KEYS */;
/*!40000 ALTER TABLE `praca_temat_specjalnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_cytowania`
--

DROP TABLE IF EXISTS `pracownik_cytowania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_cytowania` (
  `pracownik_cytowania_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `cytowania` int(11) NOT NULL,
  `rok` smallint(6) NOT NULL,
  PRIMARY KEY (`pracownik_cytowania_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_cytowania`
--

LOCK TABLES `pracownik_cytowania` WRITE;
/*!40000 ALTER TABLE `pracownik_cytowania` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownik_cytowania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_dodatkowe`
--

DROP TABLE IF EXISTS `pracownik_dodatkowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_dodatkowe` (
  `uzytkownik_id` int(11) NOT NULL,
  `telefon_2` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `telefon_3` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `zdjecie` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `pesel` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `nip` varchar(13) COLLATE utf8_polish_ci DEFAULT NULL,
  `imie_ojca` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `imie_matki` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT 'Polska',
  `us_nazwa` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `us_adres` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `konto_nr` varchar(36) COLLATE utf8_polish_ci DEFAULT NULL,
  `konto_bank` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `obywatelstwo` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `dowod_nr` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `tytul_naukowy_id` smallint(11) DEFAULT NULL,
  `jednostka_id` int(11) DEFAULT NULL,
  `pensum` float DEFAULT NULL,
  `funkcja` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `nr_pokoju` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `grupa_zatrudnienia_id` smallint(6) DEFAULT NULL,
  `doktorant` tinyint(1) DEFAULT NULL,
  `strona_domowa` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `strona_domowa_en` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `profil_naukowy` text COLLATE utf8_polish_ci,
  `profil_naukowy_en` text COLLATE utf8_polish_ci,
  `o_sobie` text COLLATE utf8_polish_ci,
  `o_sobie_en` text COLLATE utf8_polish_ci,
  `sala_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_id`),
  KEY `tytul_naukowy_id` (`tytul_naukowy_id`),
  KEY `jednostka_id` (`jednostka_id`),
  KEY `grupa_zatrudnienia_id` (`grupa_zatrudnienia_id`),
  KEY `sala_id` (`sala_id`),
  CONSTRAINT `pracownik_dodatkowe_ibfk_10` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `pracownik_dodatkowe_ibfk_3` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pracownik_dodatkowe_ibfk_5` FOREIGN KEY (`tytul_naukowy_id`) REFERENCES `sl_tytul_naukowy` (`tytul_naukowy_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pracownik_dodatkowe_ibfk_8` FOREIGN KEY (`jednostka_id`) REFERENCES `sl_wydzial_jednostka` (`jednostka_id`) ON UPDATE CASCADE,
  CONSTRAINT `pracownik_dodatkowe_ibfk_9` FOREIGN KEY (`grupa_zatrudnienia_id`) REFERENCES `sl_grupa_zatrudnienia` (`grupa_zatrudnienia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_dodatkowe`
--

LOCK TABLES `pracownik_dodatkowe` WRITE;
/*!40000 ALTER TABLE `pracownik_dodatkowe` DISABLE KEYS */;
INSERT INTO `pracownik_dodatkowe` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Polska',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pracownik_dodatkowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_if`
--

DROP TABLE IF EXISTS `pracownik_if`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_if` (
  `uzytkownik_id` int(11) NOT NULL,
  `if` float NOT NULL,
  `rok` int(11) NOT NULL,
  PRIMARY KEY (`uzytkownik_id`),
  CONSTRAINT `pracownik_if_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_if`
--

LOCK TABLES `pracownik_if` WRITE;
/*!40000 ALTER TABLE `pracownik_if` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownik_if` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_konsultacje`
--

DROP TABLE IF EXISTS `pracownik_konsultacje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_konsultacje` (
  `konsultacje_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `godzina_od` time NOT NULL,
  `godzina_do` time NOT NULL,
  `dzien_tygodnia_id` smallint(6) NOT NULL,
  PRIMARY KEY (`konsultacje_id`),
  KEY `dzien_tygodnia_id` (`dzien_tygodnia_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `pracownik_konsultacje_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pracownik_konsultacje_ibfk_2` FOREIGN KEY (`dzien_tygodnia_id`) REFERENCES `sl_dzien_tygodnia` (`dzien_tygodnia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_konsultacje`
--

LOCK TABLES `pracownik_konsultacje` WRITE;
/*!40000 ALTER TABLE `pracownik_konsultacje` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownik_konsultacje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_pliki`
--

DROP TABLE IF EXISTS `pracownik_pliki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_pliki` (
  `uzytkownik_plik_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `opis` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `data_zamieszczenia` datetime NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  PRIMARY KEY (`uzytkownik_plik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_pliki`
--

LOCK TABLES `pracownik_pliki` WRITE;
/*!40000 ALTER TABLE `pracownik_pliki` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownik_pliki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_stanowisko`
--

DROP TABLE IF EXISTS `pracownik_stanowisko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_stanowisko` (
  `pracownik_stanowisko_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `stanowisko_id` smallint(6) NOT NULL,
  `data_od` date NOT NULL,
  `data_do` date DEFAULT NULL,
  PRIMARY KEY (`pracownik_stanowisko_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `stanowisko_id` (`stanowisko_id`),
  CONSTRAINT `pracownik_stanowisko_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE,
  CONSTRAINT `pracownik_stanowisko_ibfk_2` FOREIGN KEY (`stanowisko_id`) REFERENCES `sl_stanowisko` (`stanowisko_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_stanowisko`
--

LOCK TABLES `pracownik_stanowisko` WRITE;
/*!40000 ALTER TABLE `pracownik_stanowisko` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownik_stanowisko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik_tytul_naukowy`
--

DROP TABLE IF EXISTS `pracownik_tytul_naukowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik_tytul_naukowy` (
  `pracownik_tytul_naukowy_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `tytul_naukowy_id` smallint(6) NOT NULL,
  `data_nadania` date NOT NULL,
  PRIMARY KEY (`pracownik_tytul_naukowy_id`),
  KEY `tytul_naukowy_id` (`tytul_naukowy_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `data_nadania` (`data_nadania`),
  CONSTRAINT `pracownik_tytul_naukowy_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE,
  CONSTRAINT `pracownik_tytul_naukowy_ibfk_2` FOREIGN KEY (`tytul_naukowy_id`) REFERENCES `sl_tytul_naukowy` (`tytul_naukowy_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik_tytul_naukowy`
--

LOCK TABLES `pracownik_tytul_naukowy` WRITE;
/*!40000 ALTER TABLE `pracownik_tytul_naukowy` DISABLE KEYS */;
/*!40000 ALTER TABLE `pracownik_tytul_naukowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot`
--

DROP TABLE IF EXISTS `przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot` (
  `przedmiot_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_krotka` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `odpowiedzialny_id` int(11) NOT NULL,
  `program_plik` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `cel_przedmiotu` text COLLATE utf8_polish_ci,
  `opis` text COLLATE utf8_polish_ci,
  `bibliografia` text COLLATE utf8_polish_ci,
  `przedmiot_grupa_id` int(11) NOT NULL,
  `wariantowy` tinyint(1) DEFAULT '0',
  `projekt_indywidualny` tinyint(1) NOT NULL DEFAULT '0',
  `akt_konspekt_id` int(11) DEFAULT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`przedmiot_id`),
  UNIQUE KEY `nazwa` (`nazwa`),
  KEY `przedmiot_grupa_id` (`przedmiot_grupa_id`),
  KEY `_wprowadzil` (`_wprowadzil`,`_modyfikowal`),
  KEY `odpowiedzialny_id` (`odpowiedzialny_id`),
  KEY `akt_konspekt_id` (`akt_konspekt_id`),
  CONSTRAINT `przedmiot_ibfk_10` FOREIGN KEY (`przedmiot_grupa_id`) REFERENCES `sl_przedmiot_grupa` (`przedmiot_grupa_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_ibfk_11` FOREIGN KEY (`_wprowadzil`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_ibfk_9` FOREIGN KEY (`odpowiedzialny_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot`
--

LOCK TABLES `przedmiot` WRITE;
/*!40000 ALTER TABLE `przedmiot` DISABLE KEYS */;
INSERT INTO `przedmiot` VALUES (3,'Matematyka Dyskretna','Matematyka dyskretna',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(4,'Matematyka I','Matematyka 1',2,NULL,'Tutaj jest cel przedmtiotu','Tutaj jest opis przedmiotu','Książka 1\r\nKsiążka 2',2,0,0,NULL,3,NULL,NULL,NULL),(5,'Matematyka II','Matematyka 2',2,NULL,'Tutaj jest cel przedmtiotu','Tutaj jest opis przedmiotu','Książka 1\r\nKsiążka 2',2,0,0,NULL,3,NULL,NULL,NULL),(6,'Metody Numeryczne','Metody numeryczne',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(7,'Podstawy Fizyki','Podstawy fizyki',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(8,'Rachunek prawdopodobieństwa i statystyka','Rachunek prawd. i st',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(9,'Podstawy Robotyki','Robotyka',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',2,0,0,NULL,NULL,NULL,NULL,NULL),(10,'Systemy Czasu Rzeczywistego','Systemu wbudowane',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',2,0,0,NULL,NULL,NULL,NULL,NULL),(11,'Automatyzacja Procesów Dyskretnych','Procesy dyskretne',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',2,0,0,NULL,NULL,NULL,NULL,NULL),(12,'Zaawansowane C++','C++',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',2,0,0,NULL,NULL,NULL,NULL,NULL),(13,'Algorytmy i Struktury Danych','Algorytmy',4,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(14,'Architektura systemów komputerowych','Algorytmy',3,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(15,'Bazy danych','Bazy',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(16,'Bezpieczeństwo systemów komputerowych','Bezpieczeństwo',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(17,'Zjazd 1 - Podstawy technologii informacyjnej','Zjazd 1',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(18,'Zjazd 2 - Metody i narzędzia informatyki','Zjazd 2',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(19,'Ergonomia i Bezpieczeństwo Pracy','Ergonomia',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(20,'Podstawy Ekonomii','Ekonomia',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(21,'Podstawy elektrotechniki i elektroniki','Elektrotechnika',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(22,'Przetwarzanie Sygnałów','Sygnały',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(23,'Technika Wysokich Częstotliwości','Częstotliwości',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(24,'Telekomunikacja optofalowa','Optofale',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(25,'Instalacje Inteligentne','Instalacje',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(26,'Podstawy Automatyki','Automatyka',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(27,'Projektowanie urządzeń mechatroniki','Urządzenia mechatron',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(29,'Układy scalone','Scalone',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(30,'Systemy Cyfrowe','Cyfry',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(31,'Podstawy Techniki Dźwiękowej','Dźwięk',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL),(32,'Urządzenia i Systemy Techniki Dźwiękowej','Systemy dźwiękowe',1,NULL,'Tutaj jest cel przedmtiotu\r\nTutaj jest cel przedmtiotu2\r\nTutaj jest cel przedmtiotu3\r\nTutaj jest cel przedmtiotu4\r\nTutaj jest cel przedmtiotu5\r\nTutaj jest cel przedmtiotu6','Tutaj jest opis przedmiotu\r\nTutaj jest opis przedmiotu2\r\nTutaj jest opis przedmiotu3\r\nTutaj jest opis przedmiotu4\r\nTutaj jest opis przedmiotu5\r\nTutaj jest opis przedmiotu6','Książka 1\r\nKsiążka 2',1,0,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_autor`
--

DROP TABLE IF EXISTS `przedmiot_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_autor` (
  `przedmiot_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `pozycja` int(11) DEFAULT NULL,
  PRIMARY KEY (`przedmiot_id`,`uzytkownik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `przedmiot_autor_ibfk_3` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`) ON DELETE CASCADE,
  CONSTRAINT `przedmiot_autor_ibfk_4` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_autor`
--

LOCK TABLES `przedmiot_autor` WRITE;
/*!40000 ALTER TABLE `przedmiot_autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja`
--

DROP TABLE IF EXISTS `przedmiot_edycja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja` (
  `przedmiot_edycja_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_id` int(11) NOT NULL,
  `rok` int(11) DEFAULT NULL,
  `polsemestr` int(11) NOT NULL,
  `rok_akademicki_id` int(11) DEFAULT NULL,
  `ects` int(11) DEFAULT '0',
  `cena` float DEFAULT NULL,
  `opis` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `forma_zaliczenia` text COLLATE utf8_polish_ci,
  `od_autorow` text COLLATE utf8_polish_ci,
  `aktywny` tinyint(1) NOT NULL DEFAULT '1',
  `zapisy` tinyint(1) DEFAULT NULL,
  `ogr_liczby_studentow` int(11) DEFAULT NULL,
  `dodatkowe_ogr` tinyint(1) NOT NULL DEFAULT '0',
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  `modul_pliki` tinyint(1) NOT NULL DEFAULT '1',
  `modul_ogloszenia` tinyint(1) NOT NULL DEFAULT '1',
  `modul_testy` tinyint(1) NOT NULL DEFAULT '1',
  `modul_forum` tinyint(1) NOT NULL DEFAULT '0',
  `modul_artykuly` tinyint(1) NOT NULL DEFAULT '0',
  `modul_podrecznik` tinyint(1) NOT NULL DEFAULT '0',
  `modul_projekty` tinyint(1) DEFAULT NULL,
  `adres_witryny` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `wzor_ocena` text COLLATE utf8_polish_ci,
  `pole_ocena` int(11) DEFAULT NULL,
  `zapisy_na_projekty` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`przedmiot_edycja_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  KEY `_modyfikowal` (`_modyfikowal`),
  CONSTRAINT `przedmiot_edycja_ibfk_1` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja`
--

LOCK TABLES `przedmiot_edycja` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja` DISABLE KEYS */;
INSERT INTO `przedmiot_edycja` VALUES (1,3,NULL,1,3,5,500,'BlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalbaBlablalbalbalbalbalba','1','nananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananananana',1,NULL,NULL,0,0,'0000-00-00 00:00:00',NULL,NULL,1,1,1,0,0,0,NULL,NULL,NULL,NULL,0),(2,9,NULL,2,3,3,300,'qwrqwerqwrqwerqwrqwerqwrqwerqwrqwerqwrqwerqwrqwerqwrqwerqwrqwerqwrqwer',NULL,'hrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnhhrghnh',1,NULL,NULL,0,0,'0000-00-00 00:00:00',NULL,NULL,1,1,1,0,0,0,NULL,NULL,NULL,NULL,0),(3,4,NULL,1,3,4,400,'sfsafasfasfsafdsafsfsafsf','1','mkkmomimomimoimommo',1,NULL,NULL,0,0,'0000-00-00 00:00:00',NULL,NULL,1,1,1,0,0,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `przedmiot_edycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_admin`
--

DROP TABLE IF EXISTS `przedmiot_edycja_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_admin` (
  `przedmiot_edycja_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  PRIMARY KEY (`przedmiot_edycja_id`,`uzytkownik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `przedmiot_edycja_admin_ibfk_2` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`),
  CONSTRAINT `przedmiot_edycja_admin_ibfk_3` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_admin`
--

LOCK TABLES `przedmiot_edycja_admin` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_forum`
--

DROP TABLE IF EXISTS `przedmiot_edycja_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_forum` (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `grupa_nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `grupa_opis` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `moderowane` tinyint(1) NOT NULL COMMENT 'true jesli tak',
  `tematy` int(11) NOT NULL,
  `posty` int(11) NOT NULL,
  `widzial_id` text COLLATE utf8_polish_ci NOT NULL,
  `zalozyl_id` int(11) NOT NULL,
  PRIMARY KEY (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='grupy podzialowe forum a edycje';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_forum`
--

LOCK TABLES `przedmiot_edycja_forum` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_forum_komentarz`
--

DROP TABLE IF EXISTS `przedmiot_edycja_forum_komentarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_forum_komentarz` (
  `komentarz_id` int(11) NOT NULL AUTO_INCREMENT,
  `temat_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `komentarz_data` datetime NOT NULL,
  `komentarz_wpis` text COLLATE utf8_polish_ci NOT NULL,
  `komentarz_plik` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `komentarz_edycja` datetime NOT NULL,
  `sprawdzony` tinyint(1) NOT NULL,
  `usuniety` tinyint(1) NOT NULL,
  PRIMARY KEY (`komentarz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='tabela komentarzy do tematow forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_forum_komentarz`
--

LOCK TABLES `przedmiot_edycja_forum_komentarz` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_forum_komentarz` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_forum_komentarz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_forum_temat`
--

DROP TABLE IF EXISTS `przedmiot_edycja_forum_temat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_forum_temat` (
  `temat_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `temat_data` datetime NOT NULL,
  `temat_tytul` text COLLATE utf8_polish_ci NOT NULL,
  `posty` int(11) NOT NULL,
  `ile_odslon` int(11) NOT NULL,
  `widzial_id` text COLLATE utf8_polish_ci NOT NULL,
  `sprawdzony` tinyint(1) NOT NULL,
  `zamkniety` tinyint(1) NOT NULL,
  `usuniety` tinyint(1) NOT NULL,
  PRIMARY KEY (`temat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='tablea tematow forum';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_forum_temat`
--

LOCK TABLES `przedmiot_edycja_forum_temat` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_forum_temat` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_forum_temat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_grupa_lokalna`
--

DROP TABLE IF EXISTS `przedmiot_edycja_grupa_lokalna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_grupa_lokalna` (
  `grupa_lokalna_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `opiekun_id` int(11) NOT NULL,
  PRIMARY KEY (`grupa_lokalna_id`),
  KEY `przedmiot_edycja_id` (`przedmiot_edycja_id`),
  KEY `opiekun_id` (`opiekun_id`),
  CONSTRAINT `przedmiot_edycja_grupa_lokalna_ibfk_1` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_grupa_lokalna_ibfk_2` FOREIGN KEY (`opiekun_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_grupa_lokalna`
--

LOCK TABLES `przedmiot_edycja_grupa_lokalna` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_grupa_lokalna` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_grupa_lokalna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_grupa_lokalna_student`
--

DROP TABLE IF EXISTS `przedmiot_edycja_grupa_lokalna_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_grupa_lokalna_student` (
  `grupa_lokalna_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `rola` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`grupa_lokalna_id`,`uzytkownik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `przedmiot_edycja_grupa_lokalna_student_ibfk_3` FOREIGN KEY (`grupa_lokalna_id`) REFERENCES `przedmiot_edycja_grupa_lokalna` (`grupa_lokalna_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_grupa_lokalna_student_ibfk_4` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_grupa_lokalna_student`
--

LOCK TABLES `przedmiot_edycja_grupa_lokalna_student` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_grupa_lokalna_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_grupa_lokalna_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_mail`
--

DROP TABLE IF EXISTS `przedmiot_edycja_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `mail_temat` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `mail_tresc` text COLLATE utf8_polish_ci NOT NULL,
  `mail_data` date NOT NULL,
  `mail_nadawca` varchar(150) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`mail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=745 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='tabela pamietajaca historie maili wyslanych do wszystkich uz';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_mail`
--

LOCK TABLES `przedmiot_edycja_mail` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_ocena_czastkowa`
--

DROP TABLE IF EXISTS `przedmiot_edycja_ocena_czastkowa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_ocena_czastkowa` (
  `ocena_czastkowa_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `typ_ocena_czastkowa_id` int(11) DEFAULT NULL,
  `zrodlo` int(11) NOT NULL,
  `wzor` text COLLATE utf8_polish_ci,
  `ocena_max` float NOT NULL,
  `ocena_final_max` float NOT NULL,
  `ocena_final_procent` float NOT NULL,
  `indeks` int(11) NOT NULL,
  PRIMARY KEY (`ocena_czastkowa_id`),
  KEY `przedmiot_edycja_id` (`przedmiot_edycja_id`),
  CONSTRAINT `przedmiot_edycja_ocena_czastkowa_ibfk_1` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_ocena_czastkowa`
--

LOCK TABLES `przedmiot_edycja_ocena_czastkowa` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_ocena_czastkowa` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_ocena_czastkowa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_ocena_czastkowa_stats`
--

DROP TABLE IF EXISTS `przedmiot_edycja_ocena_czastkowa_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_ocena_czastkowa_stats` (
  `ocena_czastkowa_id` int(11) NOT NULL,
  `srednia` float DEFAULT NULL,
  `najmniejsza` float DEFAULT NULL,
  `najwieksza` float DEFAULT NULL,
  PRIMARY KEY (`ocena_czastkowa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_ocena_czastkowa_stats`
--

LOCK TABLES `przedmiot_edycja_ocena_czastkowa_stats` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_ocena_czastkowa_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_ocena_czastkowa_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_ocena_czastkowa_student`
--

DROP TABLE IF EXISTS `przedmiot_edycja_ocena_czastkowa_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_ocena_czastkowa_student` (
  `ocena_czastkowa_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `ocena` float NOT NULL,
  `ocenial_id` int(11) NOT NULL,
  `ocenial_data` datetime NOT NULL,
  PRIMARY KEY (`ocena_czastkowa_id`,`uzytkownik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `przedmiot_edycja_ocena_czastkowa_student_ibfk_1` FOREIGN KEY (`ocena_czastkowa_id`) REFERENCES `przedmiot_edycja_ocena_czastkowa` (`ocena_czastkowa_id`),
  CONSTRAINT `przedmiot_edycja_ocena_czastkowa_student_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_ocena_czastkowa_student`
--

LOCK TABLES `przedmiot_edycja_ocena_czastkowa_student` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_ocena_czastkowa_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_ocena_czastkowa_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_ogloszenia`
--

DROP TABLE IF EXISTS `przedmiot_edycja_ogloszenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_ogloszenia` (
  `ogloszenie_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `tytul` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `data_zamieszczenia` datetime NOT NULL,
  `data_konca` date DEFAULT NULL,
  `widoczne` tinyint(1) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `grupa_lokalna_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ogloszenie_id`),
  KEY `zamiescil_id` (`uzytkownik_id`),
  KEY `data_zamieszczenia` (`data_zamieszczenia`),
  KEY `przedmiot_witryna_id` (`przedmiot_edycja_id`),
  KEY `grupa_lokalna_id` (`grupa_lokalna_id`),
  CONSTRAINT `przedmiot_edycja_ogloszenia_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_ogloszenia_ibfk_3` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_ogloszenia`
--

LOCK TABLES `przedmiot_edycja_ogloszenia` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_ogloszenia` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_ogloszenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_pliki`
--

DROP TABLE IF EXISTS `przedmiot_edycja_pliki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_pliki` (
  `przedmiot_edycja_id` int(11) NOT NULL,
  `uzytkownik_plik_id` int(11) NOT NULL,
  PRIMARY KEY (`przedmiot_edycja_id`,`uzytkownik_plik_id`),
  KEY `uzytkownik_plik_id` (`uzytkownik_plik_id`),
  CONSTRAINT `przedmiot_edycja_pliki_ibfk_2` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_pliki_ibfk_3` FOREIGN KEY (`uzytkownik_plik_id`) REFERENCES `pracownik_pliki` (`uzytkownik_plik_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_pliki`
--

LOCK TABLES `przedmiot_edycja_pliki` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_pliki` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_pliki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_projekt`
--

DROP TABLE IF EXISTS `przedmiot_edycja_projekt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_projekt` (
  `przedmiot_edycja_projekt_id` int(20) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `tytul` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `zapisy` tinyint(1) NOT NULL,
  `projekt_poziom_id` smallint(6) DEFAULT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` int(11) NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`przedmiot_edycja_projekt_id`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `przedmiot_edycja_id` (`przedmiot_edycja_id`),
  KEY `projekt_poziom_id` (`projekt_poziom_id`),
  CONSTRAINT `przedmiot_edycja_projekt_ibfk_1` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`),
  CONSTRAINT `przedmiot_edycja_projekt_ibfk_2` FOREIGN KEY (`_wprowadzil`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_projekt`
--

LOCK TABLES `przedmiot_edycja_projekt` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_projekt_plik`
--

DROP TABLE IF EXISTS `przedmiot_edycja_projekt_plik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_projekt_plik` (
  `pep_plik_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_projekt_id` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `link` varchar(1000) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `plik_typ_id` tinyint(4) NOT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  PRIMARY KEY (`pep_plik_id`),
  KEY `przedmiot_edycja_projekt_id` (`przedmiot_edycja_projekt_id`),
  KEY `plik_typ_id` (`plik_typ_id`),
  CONSTRAINT `przedmiot_edycja_projekt_plik_ibfk_2` FOREIGN KEY (`przedmiot_edycja_projekt_id`) REFERENCES `przedmiot_edycja_projekt` (`przedmiot_edycja_projekt_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_projekt_plik_ibfk_3` FOREIGN KEY (`plik_typ_id`) REFERENCES `sl_projekt_plik_typ` (`plik_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_projekt_plik`
--

LOCK TABLES `przedmiot_edycja_projekt_plik` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt_plik` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt_plik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_projekt_student`
--

DROP TABLE IF EXISTS `przedmiot_edycja_projekt_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_projekt_student` (
  `przedmiot_edycja_projekt_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `data_zapisu` datetime NOT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  PRIMARY KEY (`przedmiot_edycja_projekt_id`,`uzytkownik_id`),
  KEY `przedmiot_edycja_projekt_id` (`przedmiot_edycja_projekt_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `data_zapisu` (`data_zapisu`),
  KEY `_wprowadzil` (`_wprowadzil`),
  CONSTRAINT `przedmiot_edycja_projekt_student_ibfk_1` FOREIGN KEY (`przedmiot_edycja_projekt_id`) REFERENCES `przedmiot_edycja_projekt` (`przedmiot_edycja_projekt_id`),
  CONSTRAINT `przedmiot_edycja_projekt_student_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `przedmiot_edycja_projekt_student_ibfk_3` FOREIGN KEY (`_wprowadzil`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_projekt_student`
--

LOCK TABLES `przedmiot_edycja_projekt_student` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_projekt_zespol`
--

DROP TABLE IF EXISTS `przedmiot_edycja_projekt_zespol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_projekt_zespol` (
  `przedmiot_edycja_projekt_id` int(11) NOT NULL,
  `grupa_lokalna_id` int(11) NOT NULL,
  `data_zapisu` datetime NOT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  PRIMARY KEY (`przedmiot_edycja_projekt_id`,`grupa_lokalna_id`),
  KEY `przedmiot_edycja_projekt_id` (`przedmiot_edycja_projekt_id`),
  KEY `grupa_lokalna_id` (`grupa_lokalna_id`),
  KEY `data_zapisu` (`data_zapisu`),
  KEY `_wprowadzil` (`_wprowadzil`),
  CONSTRAINT `przedmiot_edycja_projekt_zespol_ibfk_1` FOREIGN KEY (`grupa_lokalna_id`) REFERENCES `przedmiot_edycja_grupa_lokalna` (`grupa_lokalna_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_projekt_zespol_ibfk_2` FOREIGN KEY (`_wprowadzil`) REFERENCES `uprawnienia` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_projekt_zespol`
--

LOCK TABLES `przedmiot_edycja_projekt_zespol` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt_zespol` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_projekt_zespol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_przeznaczenie`
--

DROP TABLE IF EXISTS `przedmiot_edycja_przeznaczenie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_przeznaczenie` (
  `przedmiot_edycja_id` int(11) NOT NULL,
  `rok_studiow` int(11) DEFAULT NULL,
  `grupa_id` int(11) DEFAULT NULL,
  `specjalnosc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_przeznaczenie`
--

LOCK TABLES `przedmiot_edycja_przeznaczenie` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_przeznaczenie` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_edycja_przeznaczenie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_edycja_student`
--

DROP TABLE IF EXISTS `przedmiot_edycja_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_edycja_student` (
  `przedmiot_edycja_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `data_zapisu` datetime DEFAULT NULL,
  `ocena` float DEFAULT NULL,
  `ocenial_id` int(11) DEFAULT NULL,
  `ocenial_data` datetime DEFAULT NULL,
  PRIMARY KEY (`przedmiot_edycja_id`,`uzytkownik_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `ocenial_id` (`ocenial_id`),
  KEY `data_zapisu` (`data_zapisu`),
  CONSTRAINT `przedmiot_edycja_student_ibfk_3` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_student_ibfk_4` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_edycja_student_ibfk_5` FOREIGN KEY (`ocenial_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_edycja_student`
--

LOCK TABLES `przedmiot_edycja_student` WRITE;
/*!40000 ALTER TABLE `przedmiot_edycja_student` DISABLE KEYS */;
INSERT INTO `przedmiot_edycja_student` VALUES (1,7,'2016-09-04 17:49:10',NULL,NULL,NULL),(3,7,'2016-09-09 00:00:22',NULL,NULL,NULL);
/*!40000 ALTER TABLE `przedmiot_edycja_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_obieralny_grupa`
--

DROP TABLE IF EXISTS `przedmiot_obieralny_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_obieralny_grupa` (
  `przedmiot_obieralny_grupa_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_obieralny_grupa_nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `przedmiot_obieralny_grupa_opis` text COLLATE utf8_polish_ci NOT NULL,
  `aktywny_od` date DEFAULT NULL,
  `aktywny_do` date DEFAULT NULL,
  `zapisy` tinyint(1) NOT NULL DEFAULT '0',
  `ogr_rok` int(11) DEFAULT '0',
  `ogr_specjalnosc` int(11) DEFAULT '0',
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` date DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` date DEFAULT NULL,
  PRIMARY KEY (`przedmiot_obieralny_grupa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_obieralny_grupa`
--

LOCK TABLES `przedmiot_obieralny_grupa` WRITE;
/*!40000 ALTER TABLE `przedmiot_obieralny_grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_obieralny_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_obieralny_kolejnosc`
--

DROP TABLE IF EXISTS `przedmiot_obieralny_kolejnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_obieralny_kolejnosc` (
  `przedmiot_obieralny_kolejnosc_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_obieralny_grupa_id` int(11) NOT NULL,
  `przedmiot_obieralny_przedmiot_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL DEFAULT '0',
  `pozycja` int(11) DEFAULT NULL,
  `rand` int(11) DEFAULT NULL,
  PRIMARY KEY (`przedmiot_obieralny_kolejnosc_id`),
  KEY `przedmiot_obieralny_grupa_id` (`przedmiot_obieralny_grupa_id`),
  KEY `przedmiot_obieralny_przedmiot_id` (`przedmiot_obieralny_przedmiot_id`),
  CONSTRAINT `przedmiot_obieralny_kolejnosc_ibfk_1` FOREIGN KEY (`przedmiot_obieralny_grupa_id`) REFERENCES `przedmiot_obieralny_grupa` (`przedmiot_obieralny_grupa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_obieralny_kolejnosc_ibfk_2` FOREIGN KEY (`przedmiot_obieralny_przedmiot_id`) REFERENCES `przedmiot_obieralny_przedmiot` (`przedmiot_obieralny_przedmiot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_obieralny_kolejnosc`
--

LOCK TABLES `przedmiot_obieralny_kolejnosc` WRITE;
/*!40000 ALTER TABLE `przedmiot_obieralny_kolejnosc` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_obieralny_kolejnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_obieralny_przedmiot`
--

DROP TABLE IF EXISTS `przedmiot_obieralny_przedmiot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_obieralny_przedmiot` (
  `przedmiot_obieralny_przedmiot_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_obieralny_grupa_id` int(11) NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `ogr_osob_max` int(11) DEFAULT NULL,
  `ogr_osob_min` int(11) DEFAULT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` date NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` date DEFAULT NULL,
  PRIMARY KEY (`przedmiot_obieralny_przedmiot_id`),
  KEY `przedmiot_id` (`przedmiot_id`),
  KEY `przedmiot_obieralny_grupa_id` (`przedmiot_obieralny_grupa_id`),
  CONSTRAINT `przedmiot_obieralny_przedmiot_ibfk_1` FOREIGN KEY (`przedmiot_obieralny_grupa_id`) REFERENCES `przedmiot_obieralny_grupa` (`przedmiot_obieralny_grupa_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_obieralny_przedmiot_ibfk_2` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_obieralny_przedmiot`
--

LOCK TABLES `przedmiot_obieralny_przedmiot` WRITE;
/*!40000 ALTER TABLE `przedmiot_obieralny_przedmiot` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_obieralny_przedmiot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_obieralny_specjalnosc`
--

DROP TABLE IF EXISTS `przedmiot_obieralny_specjalnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_obieralny_specjalnosc` (
  `przedmiot_obieralny_specjalnosc_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_obieralny_grupa_id` int(11) NOT NULL,
  `specjalnosc_id` int(11) NOT NULL,
  PRIMARY KEY (`przedmiot_obieralny_specjalnosc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_obieralny_specjalnosc`
--

LOCK TABLES `przedmiot_obieralny_specjalnosc` WRITE;
/*!40000 ALTER TABLE `przedmiot_obieralny_specjalnosc` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_obieralny_specjalnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_ocena_koncowa`
--

DROP TABLE IF EXISTS `przedmiot_ocena_koncowa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_ocena_koncowa` (
  `przedmiot_ocena_koncowa_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `przedmiot_id` int(11) NOT NULL,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `ocena_typ_id` int(11) NOT NULL,
  `ocena` float NOT NULL,
  `wystawil_id` int(11) NOT NULL,
  `wystawil_data` datetime NOT NULL,
  `zablokowana` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`przedmiot_ocena_koncowa_id`),
  KEY `przedmiot_edycja_id` (`przedmiot_id`),
  KEY `wystawil` (`wystawil_id`),
  KEY `ocena_typ_id` (`ocena_typ_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  KEY `przedmiot_edycja_id_2` (`przedmiot_edycja_id`),
  CONSTRAINT `przedmiot_ocena_koncowa_ibfk_13` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_ocena_koncowa_ibfk_14` FOREIGN KEY (`przedmiot_edycja_id`) REFERENCES `przedmiot_edycja` (`przedmiot_edycja_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_ocena_koncowa_ibfk_15` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_ocena_koncowa_ibfk_16` FOREIGN KEY (`ocena_typ_id`) REFERENCES `sl_ocena_typ` (`ocena_typ_id`) ON UPDATE CASCADE,
  CONSTRAINT `przedmiot_ocena_koncowa_ibfk_17` FOREIGN KEY (`wystawil_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_ocena_koncowa`
--

LOCK TABLES `przedmiot_ocena_koncowa` WRITE;
/*!40000 ALTER TABLE `przedmiot_ocena_koncowa` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_ocena_koncowa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_podrecznik`
--

DROP TABLE IF EXISTS `przedmiot_podrecznik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_podrecznik` (
  `przedmiot_podrecznik_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `podrecznik_www` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `podrecznik_iso` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `podrecznik_pdf` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`przedmiot_podrecznik_id`),
  UNIQUE KEY `nazwa` (`nazwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_podrecznik`
--

LOCK TABLES `przedmiot_podrecznik` WRITE;
/*!40000 ALTER TABLE `przedmiot_podrecznik` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_podrecznik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_specjalnosc`
--

DROP TABLE IF EXISTS `przedmiot_specjalnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_specjalnosc` (
  `przedmiot_specjalnosc_id` int(11) NOT NULL AUTO_INCREMENT,
  `syllabus_id` int(11) NOT NULL,
  `specjalnosc_id` int(11) NOT NULL,
  `semestr` tinyint(4) DEFAULT NULL,
  `lp` tinyint(4) DEFAULT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`przedmiot_specjalnosc_id`),
  KEY `_wprowadzil` (`_wprowadzil`,`_modyfikowal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_specjalnosc`
--

LOCK TABLES `przedmiot_specjalnosc` WRITE;
/*!40000 ALTER TABLE `przedmiot_specjalnosc` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_specjalnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_stacjonarne`
--

DROP TABLE IF EXISTS `przedmiot_stacjonarne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_stacjonarne` (
  `przedmiot_id` int(11) NOT NULL,
  `nazwa_ang` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `wersja_ang` tinyint(1) DEFAULT NULL,
  `jednostka_id` int(11) DEFAULT NULL,
  `obciazenie_dodatkowe` int(11) DEFAULT NULL,
  `wyklad` int(11) DEFAULT NULL,
  `cwiczenia` int(11) DEFAULT NULL,
  `laboratorium` int(11) DEFAULT NULL,
  `projekt` int(11) DEFAULT NULL,
  `seminarium` int(11) DEFAULT NULL,
  PRIMARY KEY (`przedmiot_id`),
  CONSTRAINT `przedmiot_stacjonarne_ibfk_1` FOREIGN KEY (`przedmiot_id`) REFERENCES `przedmiot` (`przedmiot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_stacjonarne`
--

LOCK TABLES `przedmiot_stacjonarne` WRITE;
/*!40000 ALTER TABLE `przedmiot_stacjonarne` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_stacjonarne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_syllabus`
--

DROP TABLE IF EXISTS `przedmiot_syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_syllabus` (
  `syllabus_id` int(11) NOT NULL AUTO_INCREMENT,
  `przedmiot_id` int(11) DEFAULT NULL,
  `nazwa_pl` varchar(150) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(150) COLLATE utf8_polish_ci DEFAULT NULL,
  `syl_typ_przedmiotu_id` int(11) NOT NULL,
  `syl_poziom_id` int(11) DEFAULT NULL,
  `ects` int(11) DEFAULT NULL,
  `kod_przedmiotu` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `wymagania_pl` varchar(900) COLLATE utf8_polish_ci DEFAULT NULL,
  `wymagania_en` varchar(900) COLLATE utf8_polish_ci DEFAULT NULL,
  `cel_pl` varchar(240) COLLATE utf8_polish_ci DEFAULT NULL,
  `cel_en` varchar(240) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis_standard_pl` varchar(1800) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis_standard_en` varchar(1800) COLLATE utf8_polish_ci DEFAULT NULL,
  `bibliografia_pl` text COLLATE utf8_polish_ci,
  `bibliografia_en` text COLLATE utf8_polish_ci,
  `metody_oceny_pl` varchar(900) COLLATE utf8_polish_ci DEFAULT NULL,
  `metody_oceny_en` varchar(900) COLLATE utf8_polish_ci DEFAULT NULL,
  `przedmiot_grupa_id` int(11) DEFAULT NULL,
  `odpowiedzialny_id` int(11) NOT NULL,
  `syl_stan_id` int(11) DEFAULT '1',
  `widoczny` tinyint(1) DEFAULT '1',
  `data_zatwierdzenia` date DEFAULT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`syllabus_id`),
  UNIQUE KEY `nazwa` (`nazwa_pl`),
  KEY `przedmiot_grupa_id` (`przedmiot_grupa_id`),
  KEY `_wprowadzil` (`_wprowadzil`,`_modyfikowal`),
  KEY `odpowiedzialny_id` (`odpowiedzialny_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_syllabus`
--

LOCK TABLES `przedmiot_syllabus` WRITE;
/*!40000 ALTER TABLE `przedmiot_syllabus` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_syllabus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_syllabus_blok`
--

DROP TABLE IF EXISTS `przedmiot_syllabus_blok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_syllabus_blok` (
  `syllabus_blok_id` int(11) NOT NULL AUTO_INCREMENT,
  `syllabus_id` int(11) NOT NULL,
  `typ_zajec_id` int(11) NOT NULL,
  `numer` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  `wymiar` float NOT NULL,
  PRIMARY KEY (`syllabus_blok_id`),
  KEY `syllabus_id` (`syllabus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_syllabus_blok`
--

LOCK TABLES `przedmiot_syllabus_blok` WRITE;
/*!40000 ALTER TABLE `przedmiot_syllabus_blok` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_syllabus_blok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_syllabus_harmonogram`
--

DROP TABLE IF EXISTS `przedmiot_syllabus_harmonogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_syllabus_harmonogram` (
  `syllabus_harmonogram_id` int(11) NOT NULL AUTO_INCREMENT,
  `syllabus_id` int(11) NOT NULL,
  `tydzien` int(11) NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`syllabus_harmonogram_id`),
  KEY `syllabus_id` (`syllabus_id`),
  CONSTRAINT `przedmiot_syllabus_harmonogram_ibfk_1` FOREIGN KEY (`syllabus_id`) REFERENCES `przedmiot_syllabus` (`syllabus_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_syllabus_harmonogram`
--

LOCK TABLES `przedmiot_syllabus_harmonogram` WRITE;
/*!40000 ALTER TABLE `przedmiot_syllabus_harmonogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_syllabus_harmonogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_syllabus_sk_tresc`
--

DROP TABLE IF EXISTS `przedmiot_syllabus_sk_tresc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_syllabus_sk_tresc` (
  `syllabus_id` int(11) NOT NULL,
  `sk_tresc_id` int(11) NOT NULL,
  PRIMARY KEY (`syllabus_id`,`sk_tresc_id`),
  CONSTRAINT `przedmiot_syllabus_sk_tresc_ibfk_1` FOREIGN KEY (`syllabus_id`) REFERENCES `przedmiot_syllabus` (`syllabus_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_syllabus_sk_tresc`
--

LOCK TABLES `przedmiot_syllabus_sk_tresc` WRITE;
/*!40000 ALTER TABLE `przedmiot_syllabus_sk_tresc` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_syllabus_sk_tresc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_wariant`
--

DROP TABLE IF EXISTS `przedmiot_wariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_wariant` (
  `przedmiot_id` int(11) NOT NULL,
  `przedmiot_wariant_id` int(11) NOT NULL,
  PRIMARY KEY (`przedmiot_id`,`przedmiot_wariant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_wariant`
--

LOCK TABLES `przedmiot_wariant` WRITE;
/*!40000 ALTER TABLE `przedmiot_wariant` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_wariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `przedmiot_wykladowca`
--

DROP TABLE IF EXISTS `przedmiot_wykladowca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `przedmiot_wykladowca` (
  `przedmiot_wykladowca_id` int(11) NOT NULL AUTO_INCREMENT,
  `syllabus_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`przedmiot_wykladowca_id`),
  KEY `_wprowadzil` (`_wprowadzil`,`_modyfikowal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `przedmiot_wykladowca`
--

LOCK TABLES `przedmiot_wykladowca` WRITE;
/*!40000 ALTER TABLE `przedmiot_wykladowca` DISABLE KEYS */;
/*!40000 ALTER TABLE `przedmiot_wykladowca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `sala_id` int(11) NOT NULL AUTO_INCREMENT,
  `jednostka_id` int(11) NOT NULL,
  `nazwa` varchar(250) COLLATE utf8_polish_ci NOT NULL,
  `numer` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `kierownik_id` int(11) DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `zdjecie` varchar(400) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_sali_id` smallint(6) NOT NULL,
  `pojemnosc` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sala_id`),
  KEY `jednostka_id` (`jednostka_id`,`nazwa`,`numer`,`kierownik_id`,`typ_sali_id`),
  KEY `pojemnosc` (`pojemnosc`),
  KEY `typ_sali_id` (`typ_sali_id`),
  KEY `kierownik_id` (`kierownik_id`),
  CONSTRAINT `sala_ibfk_6` FOREIGN KEY (`jednostka_id`) REFERENCES `sl_wydzial_jednostka` (`jednostka_id`),
  CONSTRAINT `sala_ibfk_7` FOREIGN KEY (`kierownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `sala_ibfk_8` FOREIGN KEY (`typ_sali_id`) REFERENCES `sl_typ_sali` (`typ_sali_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekcja`
--

DROP TABLE IF EXISTS `sekcja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sekcja` (
  `sekcja_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_sekcji_id` smallint(6) NOT NULL,
  `jednostka_id` int(11) DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `opis_en` text COLLATE utf8_polish_ci,
  `zdjecie` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`sekcja_id`),
  KEY `nazwa` (`nazwa`),
  KEY `typ_sekcji_id` (`typ_sekcji_id`),
  KEY `nazwa_en` (`nazwa_en`),
  CONSTRAINT `sekcja_ibfk_1` FOREIGN KEY (`typ_sekcji_id`) REFERENCES `sl_typ_sekcji` (`typ_sekcji_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekcja`
--

LOCK TABLES `sekcja` WRITE;
/*!40000 ALTER TABLE `sekcja` DISABLE KEYS */;
/*!40000 ALTER TABLE `sekcja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekcja_opiekun`
--

DROP TABLE IF EXISTS `sekcja_opiekun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sekcja_opiekun` (
  `sekcja_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  PRIMARY KEY (`sekcja_id`,`uzytkownik_id`),
  KEY `sekcja_id` (`sekcja_id`),
  KEY `opiekun_id` (`uzytkownik_id`),
  CONSTRAINT `sekcja_opiekun_ibfk_1` FOREIGN KEY (`sekcja_id`) REFERENCES `sekcja` (`sekcja_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sekcja_opiekun_ibfk_2` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekcja_opiekun`
--

LOCK TABLES `sekcja_opiekun` WRITE;
/*!40000 ALTER TABLE `sekcja_opiekun` DISABLE KEYS */;
/*!40000 ALTER TABLE `sekcja_opiekun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekcja_sala`
--

DROP TABLE IF EXISTS `sekcja_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sekcja_sala` (
  `sekcja_id` int(11) NOT NULL,
  `sala_id` int(11) NOT NULL,
  PRIMARY KEY (`sekcja_id`,`sala_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekcja_sala`
--

LOCK TABLES `sekcja_sala` WRITE;
/*!40000 ALTER TABLE `sekcja_sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sekcja_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_definicja`
--

DROP TABLE IF EXISTS `sk_definicja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_definicja` (
  `sk_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`sk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_definicja`
--

LOCK TABLES `sk_definicja` WRITE;
/*!40000 ALTER TABLE `sk_definicja` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_definicja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_efekty`
--

DROP TABLE IF EXISTS `sk_efekty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_efekty` (
  `sk_efekt_id` int(11) NOT NULL AUTO_INCREMENT,
  `sk_ksztalcenie_id` int(11) NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`sk_efekt_id`),
  KEY `sk_ksztalcenie_id` (`sk_ksztalcenie_id`),
  CONSTRAINT `sk_efekty_ibfk_1` FOREIGN KEY (`sk_ksztalcenie_id`) REFERENCES `sk_ksztalcenie` (`sk_ksztalcenie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_efekty`
--

LOCK TABLES `sk_efekty` WRITE;
/*!40000 ALTER TABLE `sk_efekty` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_efekty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_grupa_tresci`
--

DROP TABLE IF EXISTS `sk_grupa_tresci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_grupa_tresci` (
  `sk_grupa_tresci_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`sk_grupa_tresci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_grupa_tresci`
--

LOCK TABLES `sk_grupa_tresci` WRITE;
/*!40000 ALTER TABLE `sk_grupa_tresci` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_grupa_tresci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_ksztalcenie`
--

DROP TABLE IF EXISTS `sk_ksztalcenie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_ksztalcenie` (
  `sk_ksztalcenie_id` int(11) NOT NULL AUTO_INCREMENT,
  `sk_id` int(11) NOT NULL,
  `sk_grupa_tresci_id` int(11) NOT NULL,
  `sk_poziom_id` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`sk_ksztalcenie_id`),
  KEY `sk_id` (`sk_id`),
  KEY `sk_grupa_tresci_id` (`sk_grupa_tresci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_ksztalcenie`
--

LOCK TABLES `sk_ksztalcenie` WRITE;
/*!40000 ALTER TABLE `sk_ksztalcenie` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_ksztalcenie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_poziom`
--

DROP TABLE IF EXISTS `sk_poziom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_poziom` (
  `sk_poziom_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`sk_poziom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_poziom`
--

LOCK TABLES `sk_poziom` WRITE;
/*!40000 ALTER TABLE `sk_poziom` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_poziom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sk_tresci`
--

DROP TABLE IF EXISTS `sk_tresci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sk_tresci` (
  `sk_tresc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sk_ksztalcenie_id` int(11) NOT NULL,
  `opis` text COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`sk_tresc_id`),
  KEY `sk_ksztalcenie_id` (`sk_ksztalcenie_id`),
  CONSTRAINT `sk_tresci_ibfk_1` FOREIGN KEY (`sk_ksztalcenie_id`) REFERENCES `sk_ksztalcenie` (`sk_ksztalcenie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sk_tresci`
--

LOCK TABLES `sk_tresci` WRITE;
/*!40000 ALTER TABLE `sk_tresci` DISABLE KEYS */;
/*!40000 ALTER TABLE `sk_tresci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_dochod_typ`
--

DROP TABLE IF EXISTS `sl_dochod_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_dochod_typ` (
  `dochod_typ_id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`dochod_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_dochod_typ`
--

LOCK TABLES `sl_dochod_typ` WRITE;
/*!40000 ALTER TABLE `sl_dochod_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_dochod_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_dyplom_1_stopien`
--

DROP TABLE IF EXISTS `sl_dyplom_1_stopien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_dyplom_1_stopien` (
  `dyplom_1_stopien_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`dyplom_1_stopien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_dyplom_1_stopien`
--

LOCK TABLES `sl_dyplom_1_stopien` WRITE;
/*!40000 ALTER TABLE `sl_dyplom_1_stopien` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_dyplom_1_stopien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_dzien_tygodnia`
--

DROP TABLE IF EXISTS `sl_dzien_tygodnia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_dzien_tygodnia` (
  `dzien_tygodnia_id` smallint(6) NOT NULL,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `skrot_en` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`dzien_tygodnia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_dzien_tygodnia`
--

LOCK TABLES `sl_dzien_tygodnia` WRITE;
/*!40000 ALTER TABLE `sl_dzien_tygodnia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_dzien_tygodnia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_grupa_przedmiotow`
--

DROP TABLE IF EXISTS `sl_grupa_przedmiotow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_grupa_przedmiotow` (
  `grupa_przedmiotow_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`grupa_przedmiotow_id`),
  KEY `plan_id` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_grupa_przedmiotow`
--

LOCK TABLES `sl_grupa_przedmiotow` WRITE;
/*!40000 ALTER TABLE `sl_grupa_przedmiotow` DISABLE KEYS */;
INSERT INTO `sl_grupa_przedmiotow` VALUES (1,'Języki obce'),(3,'Przedmioty kierunkowe'),(2,'Przedmioty podstawowe');
/*!40000 ALTER TABLE `sl_grupa_przedmiotow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_grupa_zatrudnienia`
--

DROP TABLE IF EXISTS `sl_grupa_zatrudnienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_grupa_zatrudnienia` (
  `grupa_zatrudnienia_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `skrot` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `kolejnosc` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`grupa_zatrudnienia_id`),
  UNIQUE KEY `nazwa` (`nazwa`,`skrot`),
  KEY `nazwa_en` (`nazwa_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_grupa_zatrudnienia`
--

LOCK TABLES `sl_grupa_zatrudnienia` WRITE;
/*!40000 ALTER TABLE `sl_grupa_zatrudnienia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_grupa_zatrudnienia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_kandydat_status`
--

DROP TABLE IF EXISTS `sl_kandydat_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_kandydat_status` (
  `kandydat_status_id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `opis` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`kandydat_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_kandydat_status`
--

LOCK TABLES `sl_kandydat_status` WRITE;
/*!40000 ALTER TABLE `sl_kandydat_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_kandydat_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_kierunek`
--

DROP TABLE IF EXISTS `sl_kierunek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_kierunek` (
  `kierunek_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `data_rozp` date NOT NULL,
  PRIMARY KEY (`kierunek_id`),
  KEY `nazwa` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_kierunek`
--

LOCK TABLES `sl_kierunek` WRITE;
/*!40000 ALTER TABLE `sl_kierunek` DISABLE KEYS */;
INSERT INTO `sl_kierunek` VALUES (1,'Wydział Elektrotechniki','EiTI','2015-08-01'),(2,'Wydział Elektryczny','Elektronik','2015-08-05'),(3,'Wydział Mechatroniki','Mech.','2015-08-18');
/*!40000 ALTER TABLE `sl_kierunek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_msc_zam_typ`
--

DROP TABLE IF EXISTS `sl_msc_zam_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_msc_zam_typ` (
  `msc_zam_typ_id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_standard` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`msc_zam_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_msc_zam_typ`
--

LOCK TABLES `sl_msc_zam_typ` WRITE;
/*!40000 ALTER TABLE `sl_msc_zam_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_msc_zam_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_obciazenia_wspolczynnik`
--

DROP TABLE IF EXISTS `sl_obciazenia_wspolczynnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_obciazenia_wspolczynnik` (
  `wspolczynnik_id` int(11) NOT NULL AUTO_INCREMENT,
  `wartosc` float NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`wspolczynnik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_obciazenia_wspolczynnik`
--

LOCK TABLES `sl_obciazenia_wspolczynnik` WRITE;
/*!40000 ALTER TABLE `sl_obciazenia_wspolczynnik` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_obciazenia_wspolczynnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_ocena_typ`
--

DROP TABLE IF EXISTS `sl_ocena_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_ocena_typ` (
  `ocena_typ_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `typ` int(11) NOT NULL,
  PRIMARY KEY (`ocena_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_ocena_typ`
--

LOCK TABLES `sl_ocena_typ` WRITE;
/*!40000 ALTER TABLE `sl_ocena_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_ocena_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_powod_skreslenia`
--

DROP TABLE IF EXISTS `sl_powod_skreslenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_powod_skreslenia` (
  `powod_skreslenia_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(500) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`powod_skreslenia_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_powod_skreslenia`
--

LOCK TABLES `sl_powod_skreslenia` WRITE;
/*!40000 ALTER TABLE `sl_powod_skreslenia` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_powod_skreslenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_projekt_plik_typ`
--

DROP TABLE IF EXISTS `sl_projekt_plik_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_projekt_plik_typ` (
  `plik_typ_id` tinyint(4) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`plik_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_projekt_plik_typ`
--

LOCK TABLES `sl_projekt_plik_typ` WRITE;
/*!40000 ALTER TABLE `sl_projekt_plik_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_projekt_plik_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_projekt_poziom`
--

DROP TABLE IF EXISTS `sl_projekt_poziom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_projekt_poziom` (
  `projekt_poziom_id` smallint(6) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`projekt_poziom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_projekt_poziom`
--

LOCK TABLES `sl_projekt_poziom` WRITE;
/*!40000 ALTER TABLE `sl_projekt_poziom` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_projekt_poziom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_przedmiot_grupa`
--

DROP TABLE IF EXISTS `sl_przedmiot_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_przedmiot_grupa` (
  `przedmiot_grupa_id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`przedmiot_grupa_id`),
  UNIQUE KEY `nazwa` (`nazwa`),
  UNIQUE KEY `skrot` (`skrot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_przedmiot_grupa`
--

LOCK TABLES `sl_przedmiot_grupa` WRITE;
/*!40000 ALTER TABLE `sl_przedmiot_grupa` DISABLE KEYS */;
INSERT INTO `sl_przedmiot_grupa` VALUES (1,'Języki obce - nazwa','Języki obc'),(2,'Nazwa grupy','Skrót grup');
/*!40000 ALTER TABLE `sl_przedmiot_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_rodzaj_matury`
--

DROP TABLE IF EXISTS `sl_rodzaj_matury`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_rodzaj_matury` (
  `rodzaj_matury_id` tinyint(4) NOT NULL,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`rodzaj_matury_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_rodzaj_matury`
--

LOCK TABLES `sl_rodzaj_matury` WRITE;
/*!40000 ALTER TABLE `sl_rodzaj_matury` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_rodzaj_matury` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_rok_akademicki`
--

DROP TABLE IF EXISTS `sl_rok_akademicki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_rok_akademicki` (
  `rok_akademicki_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `data_od` date NOT NULL,
  `data_do` date NOT NULL,
  PRIMARY KEY (`rok_akademicki_id`),
  UNIQUE KEY `nazwa` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_rok_akademicki`
--

LOCK TABLES `sl_rok_akademicki` WRITE;
/*!40000 ALTER TABLE `sl_rok_akademicki` DISABLE KEYS */;
INSERT INTO `sl_rok_akademicki` VALUES (1,'2014/2015','2014-10-01','2015-05-31'),(2,'2013/2014','2013-10-01','2014-05-31'),(3,'2015/2016','2015-10-01','2016-10-31');
/*!40000 ALTER TABLE `sl_rok_akademicki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_semestr`
--

DROP TABLE IF EXISTS `sl_semestr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_semestr` (
  `semestr_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(4) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`semestr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_semestr`
--

LOCK TABLES `sl_semestr` WRITE;
/*!40000 ALTER TABLE `sl_semestr` DISABLE KEYS */;
INSERT INTO `sl_semestr` VALUES (1,'jesień-zima','JZ'),(2,'wiosna-lato','WL');
/*!40000 ALTER TABLE `sl_semestr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_stanowisko`
--

DROP TABLE IF EXISTS `sl_stanowisko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_stanowisko` (
  `stanowisko_id` smallint(6) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`stanowisko_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_stanowisko`
--

LOCK TABLES `sl_stanowisko` WRITE;
/*!40000 ALTER TABLE `sl_stanowisko` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_stanowisko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_syl_poziom`
--

DROP TABLE IF EXISTS `sl_syl_poziom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_syl_poziom` (
  `syl_poziom_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_pl` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`syl_poziom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_syl_poziom`
--

LOCK TABLES `sl_syl_poziom` WRITE;
/*!40000 ALTER TABLE `sl_syl_poziom` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_syl_poziom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_syl_stan`
--

DROP TABLE IF EXISTS `sl_syl_stan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_syl_stan` (
  `syl_stan_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`syl_stan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_syl_stan`
--

LOCK TABLES `sl_syl_stan` WRITE;
/*!40000 ALTER TABLE `sl_syl_stan` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_syl_stan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_syl_typ_przedmiotu`
--

DROP TABLE IF EXISTS `sl_syl_typ_przedmiotu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_syl_typ_przedmiotu` (
  `syl_typ_przedmiotu_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_pl` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`syl_typ_przedmiotu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_syl_typ_przedmiotu`
--

LOCK TABLES `sl_syl_typ_przedmiotu` WRITE;
/*!40000 ALTER TABLE `sl_syl_typ_przedmiotu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_syl_typ_przedmiotu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_syl_typ_zajec`
--

DROP TABLE IF EXISTS `sl_syl_typ_zajec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_syl_typ_zajec` (
  `typ_zajec_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_pl` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot_pl` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `skrot_en` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_zajec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_syl_typ_zajec`
--

LOCK TABLES `sl_syl_typ_zajec` WRITE;
/*!40000 ALTER TABLE `sl_syl_typ_zajec` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_syl_typ_zajec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_system`
--

DROP TABLE IF EXISTS `sl_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_system` (
  `system_id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_system`
--

LOCK TABLES `sl_system` WRITE;
/*!40000 ALTER TABLE `sl_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_system_poziom`
--

DROP TABLE IF EXISTS `sl_system_poziom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_system_poziom` (
  `poziom_id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`poziom_id`,`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_system_poziom`
--

LOCK TABLES `sl_system_poziom` WRITE;
/*!40000 ALTER TABLE `sl_system_poziom` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_system_poziom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_szkola_srednia_typ`
--

DROP TABLE IF EXISTS `sl_szkola_srednia_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_szkola_srednia_typ` (
  `szkola_srednia_typ_id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`szkola_srednia_typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_szkola_srednia_typ`
--

LOCK TABLES `sl_szkola_srednia_typ` WRITE;
/*!40000 ALTER TABLE `sl_szkola_srednia_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_szkola_srednia_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_test_typ`
--

DROP TABLE IF EXISTS `sl_test_typ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_test_typ` (
  `test_typ_id` int(11) NOT NULL,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`test_typ_id`),
  UNIQUE KEY `nazwa` (`nazwa`,`skrot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_test_typ`
--

LOCK TABLES `sl_test_typ` WRITE;
/*!40000 ALTER TABLE `sl_test_typ` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_test_typ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_ocena_czastkowa`
--

DROP TABLE IF EXISTS `sl_typ_ocena_czastkowa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_ocena_czastkowa` (
  `typ_ocena_czastkowa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_ocena_czastkowa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_ocena_czastkowa`
--

LOCK TABLES `sl_typ_ocena_czastkowa` WRITE;
/*!40000 ALTER TABLE `sl_typ_ocena_czastkowa` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_typ_ocena_czastkowa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_plan_pozycja`
--

DROP TABLE IF EXISTS `sl_typ_plan_pozycja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_plan_pozycja` (
  `typ_plan_pozycja_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_plan_pozycja_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_plan_pozycja`
--

LOCK TABLES `sl_typ_plan_pozycja` WRITE;
/*!40000 ALTER TABLE `sl_typ_plan_pozycja` DISABLE KEYS */;
INSERT INTO `sl_typ_plan_pozycja` VALUES (1,'Nazwa typu 1','T1'),(2,'Nazwa typu 2','NT2');
/*!40000 ALTER TABLE `sl_typ_plan_pozycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_praca`
--

DROP TABLE IF EXISTS `sl_typ_praca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_praca` (
  `typ_praca_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_studiow_id` smallint(6) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `godzin` float NOT NULL,
  PRIMARY KEY (`typ_praca_id`),
  KEY `typ_studiow_id` (`typ_studiow_id`),
  CONSTRAINT `sl_typ_praca_ibfk_1` FOREIGN KEY (`typ_studiow_id`) REFERENCES `sl_typ_studiow` (`typ_studiow_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_praca`
--

LOCK TABLES `sl_typ_praca` WRITE;
/*!40000 ALTER TABLE `sl_typ_praca` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_typ_praca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_sali`
--

DROP TABLE IF EXISTS `sl_typ_sali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_sali` (
  `typ_sali_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_sali_id`),
  KEY `nazwa` (`nazwa`),
  KEY `skrot` (`skrot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_sali`
--

LOCK TABLES `sl_typ_sali` WRITE;
/*!40000 ALTER TABLE `sl_typ_sali` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_typ_sali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_sekcji`
--

DROP TABLE IF EXISTS `sl_typ_sekcji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_sekcji` (
  `typ_sekcji_id` smallint(6) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_sekcji_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_sekcji`
--

LOCK TABLES `sl_typ_sekcji` WRITE;
/*!40000 ALTER TABLE `sl_typ_sekcji` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_typ_sekcji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_studiow`
--

DROP TABLE IF EXISTS `sl_typ_studiow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_studiow` (
  `typ_studiow_id` smallint(6) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `druk_czas_trwania` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `druk_nazwa` varchar(40) COLLATE utf8_polish_ci DEFAULT NULL,
  `druk_czas_trwania_sem` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`typ_studiow_id`),
  UNIQUE KEY `nazwa` (`nazwa`,`skrot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_studiow`
--

LOCK TABLES `sl_typ_studiow` WRITE;
/*!40000 ALTER TABLE `sl_typ_studiow` DISABLE KEYS */;
INSERT INTO `sl_typ_studiow` VALUES (1,'Studia zaoczne','SZ',NULL,NULL,NULL,NULL),(2,'Studia dzienne','SD',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sl_typ_studiow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_studiow_dziekanat`
--

DROP TABLE IF EXISTS `sl_typ_studiow_dziekanat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_studiow_dziekanat` (
  `typ_studiow_dziekanat_id` int(11) NOT NULL AUTO_INCREMENT,
  `wydzial_id` int(11) NOT NULL,
  `typ_studiow_id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `adres_miasto` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `adres_ulica` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `fax` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_studiow_dziekanat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_studiow_dziekanat`
--

LOCK TABLES `sl_typ_studiow_dziekanat` WRITE;
/*!40000 ALTER TABLE `sl_typ_studiow_dziekanat` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_typ_studiow_dziekanat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_uzytkownika`
--

DROP TABLE IF EXISTS `sl_typ_uzytkownika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_uzytkownika` (
  `typ_uzytkownika_id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`typ_uzytkownika_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_uzytkownika`
--

LOCK TABLES `sl_typ_uzytkownika` WRITE;
/*!40000 ALTER TABLE `sl_typ_uzytkownika` DISABLE KEYS */;
INSERT INTO `sl_typ_uzytkownika` VALUES (0,'administrator','ADM'),(1,'wykładowca','WYK'),(2,'student','STU');
/*!40000 ALTER TABLE `sl_typ_uzytkownika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_zajec`
--

DROP TABLE IF EXISTS `sl_typ_zajec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_zajec` (
  `typ_zajec_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(1) COLLATE utf8_polish_ci NOT NULL,
  `studenci_min` int(11) NOT NULL,
  `studenci_max` int(11) NOT NULL,
  PRIMARY KEY (`typ_zajec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_zajec`
--

LOCK TABLES `sl_typ_zajec` WRITE;
/*!40000 ALTER TABLE `sl_typ_zajec` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_typ_zajec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_typ_zaliczenie`
--

DROP TABLE IF EXISTS `sl_typ_zaliczenie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_typ_zaliczenie` (
  `typ_zaliczenie_id` int(11) NOT NULL,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`typ_zaliczenie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_typ_zaliczenie`
--

LOCK TABLES `sl_typ_zaliczenie` WRITE;
/*!40000 ALTER TABLE `sl_typ_zaliczenie` DISABLE KEYS */;
INSERT INTO `sl_typ_zaliczenie` VALUES (1,'Egzamin pisemny',NULL),(2,'Egzamin ustny',NULL);
/*!40000 ALTER TABLE `sl_typ_zaliczenie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_tytul_naukowy`
--

DROP TABLE IF EXISTS `sl_tytul_naukowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_tytul_naukowy` (
  `tytul_naukowy_id` smallint(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(26) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(26) COLLATE utf8_polish_ci DEFAULT NULL,
  `kolejnosc` smallint(6) NOT NULL,
  PRIMARY KEY (`tytul_naukowy_id`),
  KEY `nazwa_en` (`nazwa_en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_tytul_naukowy`
--

LOCK TABLES `sl_tytul_naukowy` WRITE;
/*!40000 ALTER TABLE `sl_tytul_naukowy` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_tytul_naukowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_wojewodztwo`
--

DROP TABLE IF EXISTS `sl_wojewodztwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_wojewodztwo` (
  `wojewodztwo_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`wojewodztwo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_wojewodztwo`
--

LOCK TABLES `sl_wojewodztwo` WRITE;
/*!40000 ALTER TABLE `sl_wojewodztwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_wojewodztwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_wydzial`
--

DROP TABLE IF EXISTS `sl_wydzial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_wydzial` (
  `wydzial_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `adres_miasto` varchar(75) COLLATE utf8_polish_ci NOT NULL,
  `adres_kod` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `adres_ulica` varchar(75) COLLATE utf8_polish_ci NOT NULL,
  `telefon_dziekanat` varchar(11) COLLATE utf8_polish_ci NOT NULL,
  `dziekan` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_odmiana_1` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_odmiana_2` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `wkr_sekretarz` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `wkr_przewodniczacy` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`wydzial_id`),
  KEY `nazwa` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_wydzial`
--

LOCK TABLES `sl_wydzial` WRITE;
/*!40000 ALTER TABLE `sl_wydzial` DISABLE KEYS */;
INSERT INTO `sl_wydzial` VALUES (1,'Wydział Elektroniki i Technik Informacyjnych','EiTI','http://www.elka.pw.edu.pl/','Warszawa','00-665','Nowowiejska 15/19','+48 22 234 ','prof. dr hab. inż. Krzysztof Zaremba','','','prof. dr hab. inż. Piotr Tatjewski','dr inż. Dariusz Turlej'),(2,'Wydział Elektryczny','Elka','http://www.elka.pw.edu.pl/','Warszawa','00-665','Nowowiejska 15/19','+48 22 234 ','prof. dr hab. inż. Krzysztof Zaremba','','','prof. dr hab. inż. Piotr Tatjewski','dr inż. Dariusz Turlej'),(3,'Wydział Mechatroniki','Mech','http://www.elka.pw.edu.pl/','Warszawa','00-665','Nowowiejska 15/19','+48 22 234 ','prof. dr hab. inż. Krzysztof Zaremba','','','prof. dr hab. inż. Piotr Tatjewski','dr inż. Dariusz Turlej'),(100,'','','','','','','','','','',NULL,'');
/*!40000 ALTER TABLE `sl_wydzial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_wydzial_jednostka`
--

DROP TABLE IF EXISTS `sl_wydzial_jednostka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sl_wydzial_jednostka` (
  `jednostka_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `nazwa_en` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `skrot` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `adres` text COLLATE utf8_polish_ci,
  `strona_www` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `wydzial_id` int(11) DEFAULT NULL,
  `jednostka_nadrzedna_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`jednostka_id`),
  KEY `wydzial_id` (`wydzial_id`),
  KEY `jednostka_nadrzedna_id` (`jednostka_nadrzedna_id`),
  KEY `nazwa` (`nazwa`),
  CONSTRAINT `sl_wydzial_jednostka_ibfk_1` FOREIGN KEY (`wydzial_id`) REFERENCES `sl_wydzial` (`wydzial_id`) ON UPDATE CASCADE,
  CONSTRAINT `sl_wydzial_jednostka_ibfk_2` FOREIGN KEY (`jednostka_nadrzedna_id`) REFERENCES `sl_wydzial_jednostka` (`jednostka_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_wydzial_jednostka`
--

LOCK TABLES `sl_wydzial_jednostka` WRITE;
/*!40000 ALTER TABLE `sl_wydzial_jednostka` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_wydzial_jednostka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specjalnosc`
--

DROP TABLE IF EXISTS `specjalnosc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specjalnosc` (
  `specjalnosc_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `skrot` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `data_rozp` date NOT NULL,
  `program` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis_www` varchar(255) COLLATE utf8_polish_ci DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `sylwetka_absolwenta` text COLLATE utf8_polish_ci,
  `program_ksztalcenia` text COLLATE utf8_polish_ci,
  `typ_studiow_id` smallint(6) NOT NULL,
  `wydzial_id` int(11) NOT NULL,
  `kierunek_id` int(11) NOT NULL,
  `opiekun_id` int(11) DEFAULT NULL,
  `poziom` smallint(6) NOT NULL DEFAULT '1',
  `zapisy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`specjalnosc_id`),
  UNIQUE KEY `nazwa_2` (`nazwa`,`typ_studiow_id`),
  KEY `wydzial_id` (`wydzial_id`),
  KEY `kierunek_id` (`kierunek_id`),
  KEY `typ_studiow_id` (`typ_studiow_id`),
  KEY `opiekun_id` (`opiekun_id`),
  CONSTRAINT `specjalnosc_ibfk_10` FOREIGN KEY (`wydzial_id`) REFERENCES `sl_wydzial` (`wydzial_id`) ON UPDATE CASCADE,
  CONSTRAINT `specjalnosc_ibfk_11` FOREIGN KEY (`kierunek_id`) REFERENCES `sl_kierunek` (`kierunek_id`) ON UPDATE CASCADE,
  CONSTRAINT `specjalnosc_ibfk_12` FOREIGN KEY (`opiekun_id`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `specjalnosc_ibfk_9` FOREIGN KEY (`typ_studiow_id`) REFERENCES `sl_typ_studiow` (`typ_studiow_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specjalnosc`
--

LOCK TABLES `specjalnosc` WRITE;
/*!40000 ALTER TABLE `specjalnosc` DISABLE KEYS */;
INSERT INTO `specjalnosc` VALUES (1,'Inżynieria Komputerowa','IK','2015-08-18','Program specjalności .........................................','Opis www .........................................','Opis ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Od absolwenta wymagamy ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Program kształcenia obejmuje ................................................................................................................................................................................................................................................................................................................................................................................. i tyle',1,3,1,1,1,0),(2,'Techniki Multimedialne ','TM','2015-08-18','Program specjalności .........................................','Opis www .........................................','Opis ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Od absolwenta wymagamy ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Program kształcenia obejmuje ................................................................................................................................................................................................................................................................................................................................................................................. i tyle',1,1,2,2,1,0),(3,'Informatyka Stosowana ','IS','2015-08-18','Program specjalności .........................................','Opis www .........................................','Opis ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Od absolwenta wymagamy ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Program kształcenia obejmuje ................................................................................................................................................................................................................................................................................................................................................................................. i tyle',1,1,3,3,1,0),(4,'Informatyka Przemysłowa ','IP','2015-08-18','Program specjalności .........................................','Opis www .........................................','Opis ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Od absolwenta wymagamy ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Program kształcenia obejmuje ................................................................................................................................................................................................................................................................................................................................................................................. i tyle',1,3,1,4,1,0),(5,'Teleinformatyka ','TI','2015-08-18','Program specjalności .........................................','Opis www .........................................','Opis ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Od absolwenta wymagamy ................................................................................................................................................................................................................................................................................................................................................................................. i tyle','Program kształcenia obejmuje ................................................................................................................................................................................................................................................................................................................................................................................. i tyle',2,2,3,4,1,0);
/*!40000 ALTER TABLE `specjalnosc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specjalnosc_plan`
--

DROP TABLE IF EXISTS `specjalnosc_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specjalnosc_plan` (
  `specjalnosc_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `specjalnosc_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `od` date NOT NULL,
  `do` date DEFAULT NULL,
  PRIMARY KEY (`specjalnosc_plan_id`),
  UNIQUE KEY `specjalnosc_id` (`specjalnosc_id`,`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specjalnosc_plan`
--

LOCK TABLES `specjalnosc_plan` WRITE;
/*!40000 ALTER TABLE `specjalnosc_plan` DISABLE KEYS */;
INSERT INTO `specjalnosc_plan` VALUES (1,1,1,'2015-08-12',NULL),(2,1,2,'2015-08-12',NULL),(3,1,3,'2015-08-12',NULL),(4,2,4,'2015-08-12',NULL),(5,2,5,'2015-08-12',NULL),(6,2,6,'2015-08-12',NULL),(7,3,7,'2015-08-12',NULL),(8,1,8,'2015-08-12',NULL),(9,1,5,'2015-08-12',NULL),(10,2,1,'2015-08-12',NULL),(11,3,3,'2015-08-12',NULL),(12,1,4,'2015-08-12',NULL),(14,2,2,'2015-08-12',NULL),(15,2,3,'2015-08-12',NULL),(16,3,1,'2015-08-12',NULL),(17,3,2,'2015-08-12',NULL),(19,3,4,'2015-08-12',NULL),(20,3,5,'2015-08-12',NULL),(21,4,1,'2015-08-12',NULL),(22,4,2,'2015-08-04',NULL),(23,4,3,'2015-08-11',NULL),(24,4,4,'2015-08-14',NULL),(25,4,5,'2015-08-28',NULL),(26,5,1,'2015-08-30',NULL),(27,5,2,'2015-08-26',NULL),(28,5,3,'2015-08-20',NULL),(29,5,4,'2015-08-14',NULL),(30,5,7,'2015-05-20',NULL),(33,4,8,'2015-08-12',NULL),(34,1,9,'2015-08-12',NULL),(35,2,10,'2015-08-12',NULL);
/*!40000 ALTER TABLE `specjalnosc_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_dodatkowe`
--

DROP TABLE IF EXISTS `student_dodatkowe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_dodatkowe` (
  `uzytkownik_id` int(11) NOT NULL,
  `wydzial_id` int(11) NOT NULL,
  `specjalnosc_id` int(11) DEFAULT NULL,
  `nr_indeks` int(11) DEFAULT NULL,
  `rok_studiow` int(11) DEFAULT NULL,
  `rok_startu` int(11) DEFAULT NULL,
  `ips` tinyint(1) DEFAULT NULL,
  `data_skreslenia` date DEFAULT NULL,
  `dodatkowy_email` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_rozp` date DEFAULT NULL,
  `imie_ojca` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `imie_matki` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_ulica` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_dom` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_lokal` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_wojewodztwo_id` smallint(6) DEFAULT NULL,
  `adres_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_ulica` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_dom` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_lokal` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_wojewodztwo_id` smallint(6) DEFAULT NULL,
  `adr_kor_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_zam` text COLLATE utf8_polish_ci,
  `adres_koresp` text COLLATE utf8_polish_ci,
  `szkola_srednia` text COLLATE utf8_polish_ci,
  `pesel` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `nip` varchar(13) COLLATE utf8_polish_ci DEFAULT NULL,
  `dowod_nr` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `dodatkowy_telefon` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_studiow_id` smallint(6) NOT NULL,
  `grupa_id` int(11) DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  `punkty_wstepne` int(11) DEFAULT NULL,
  `rok_matury` int(11) DEFAULT NULL,
  `rodzaj_matury_id` tinyint(4) DEFAULT NULL,
  `wku` text COLLATE utf8_polish_ci,
  `obywatelstwo` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_id`),
  UNIQUE KEY `nip` (`nip`),
  KEY `wydzial_id` (`wydzial_id`),
  KEY `typ_studiow_id` (`typ_studiow_id`),
  KEY `specjalnosc_id` (`specjalnosc_id`),
  KEY `grupa_id` (`grupa_id`),
  KEY `specjalnosc_id_2` (`specjalnosc_id`),
  CONSTRAINT `student_dodatkowe_ibfk_16` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_dodatkowe_ibfk_19` FOREIGN KEY (`wydzial_id`) REFERENCES `sl_wydzial` (`wydzial_id`) ON UPDATE CASCADE,
  CONSTRAINT `student_dodatkowe_ibfk_20` FOREIGN KEY (`specjalnosc_id`) REFERENCES `specjalnosc` (`specjalnosc_id`),
  CONSTRAINT `student_dodatkowe_ibfk_21` FOREIGN KEY (`typ_studiow_id`) REFERENCES `sl_typ_studiow` (`typ_studiow_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='InnoDB free: 3072 kB; (`student_id`) REFER `nowa_okno/studen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_dodatkowe`
--

LOCK TABLES `student_dodatkowe` WRITE;
/*!40000 ALTER TABLE `student_dodatkowe` DISABLE KEYS */;
INSERT INTO `student_dodatkowe` VALUES (5,1,2,123456,3,2011,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,3,213456,2,2013,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,5,213756,2,2013,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,3,NULL,123876,3,2011,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,3,4,193897,3,2011,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student_dodatkowe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_dodatkowe_archiwum`
--

DROP TABLE IF EXISTS `student_dodatkowe_archiwum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_dodatkowe_archiwum` (
  `uzytkownik_id` int(11) NOT NULL,
  `wydzial_id` int(11) NOT NULL,
  `specjalnosc_id` int(11) DEFAULT NULL,
  `nr_indeks` int(11) DEFAULT NULL,
  `rok_studiow` int(11) DEFAULT NULL,
  `rok_startu` int(11) DEFAULT NULL,
  `ips` tinyint(1) DEFAULT NULL,
  `data_skreslenia` date DEFAULT NULL,
  `dodatkowy_email` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_rozp` date DEFAULT NULL,
  `imie_ojca` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `imie_matki` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_wojewodztwo_id` smallint(6) DEFAULT NULL,
  `adres_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_1` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_2` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_kod` varchar(6) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_poczta` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adr_kor_wojewodztwo_id` smallint(6) DEFAULT NULL,
  `adr_kor_kraj` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `adres_zam` text COLLATE utf8_polish_ci,
  `adres_koresp` text COLLATE utf8_polish_ci,
  `szkola_srednia` text COLLATE utf8_polish_ci,
  `pesel` varchar(11) COLLATE utf8_polish_ci DEFAULT NULL,
  `nip` varchar(13) COLLATE utf8_polish_ci DEFAULT NULL,
  `dowod_nr` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `dodatkowy_telefon` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_studiow_id` int(11) NOT NULL,
  `grupa_id` int(11) DEFAULT NULL,
  `opis` text COLLATE utf8_polish_ci,
  PRIMARY KEY (`uzytkownik_id`),
  UNIQUE KEY `nip` (`nip`),
  KEY `wydzial_id` (`wydzial_id`),
  KEY `typ_studiow_id` (`typ_studiow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci COMMENT='InnoDB free: 3072 kB; (`student_id`) REFER `nowa_okno/studen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_dodatkowe_archiwum`
--

LOCK TABLES `student_dodatkowe_archiwum` WRITE;
/*!40000 ALTER TABLE `student_dodatkowe_archiwum` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_dodatkowe_archiwum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grupa`
--

DROP TABLE IF EXISTS `student_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_grupa` (
  `uzytkownik_id` int(11) NOT NULL,
  `grupa_id` int(11) NOT NULL,
  `data_zapisania` date NOT NULL,
  KEY `fk_grupa_id` (`grupa_id`),
  KEY `fk_uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `student_grupa_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `student_grupa_ibfk_2` FOREIGN KEY (`grupa_id`) REFERENCES `grupa` (`grupa_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grupa`
--

LOCK TABLES `student_grupa` WRITE;
/*!40000 ALTER TABLE `student_grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `system_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `komunikat` varchar(200) COLLATE utf8_polish_ci NOT NULL,
  `fail_sql` varchar(1024) COLLATE utf8_polish_ci DEFAULT NULL,
  `podsystem` int(11) NOT NULL,
  `poziom` int(11) NOT NULL,
  `detale` text COLLATE utf8_polish_ci,
  `_utw_id` int(11) NOT NULL,
  `_utw_ts` datetime NOT NULL,
  PRIMARY KEY (`system_log_id`),
  KEY `podsystem` (`podsystem`)
) ENGINE=MyISAM AUTO_INCREMENT=101931 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_params`
--

DROP TABLE IF EXISTS `system_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_params` (
  `system_params_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(250) COLLATE utf8_polish_ci NOT NULL,
  `tekst` varchar(250) COLLATE utf8_polish_ci DEFAULT NULL,
  `liczba` float DEFAULT NULL,
  `logika` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`system_params_id`),
  UNIQUE KEY `nazwa` (`nazwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_params`
--

LOCK TABLES `system_params` WRITE;
/*!40000 ALTER TABLE `system_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_grupa`
--

DROP TABLE IF EXISTS `test_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_grupa` (
  `test_grupa_id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `przedmiot_id` int(11) NOT NULL,
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`test_grupa_id`),
  KEY `opis` (`opis`,`przedmiot_id`,`_wprowadzil`,`_modyfikowal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_grupa`
--

LOCK TABLES `test_grupa` WRITE;
/*!40000 ALTER TABLE `test_grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_odpowiedzi`
--

DROP TABLE IF EXISTS `test_odpowiedzi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_odpowiedzi` (
  `uzytkownik_id` int(11) NOT NULL,
  `pytanie_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `odpowiedz` text COLLATE utf8_polish_ci NOT NULL,
  `komentarz` text COLLATE utf8_polish_ci,
  `ocena` float DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_id`,`pytanie_id`,`test_id`),
  KEY `pytanie_id` (`pytanie_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `test_odpowiedzi_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `test_odpowiedzi_ibfk_2` FOREIGN KEY (`pytanie_id`) REFERENCES `test_pytania` (`pytanie_id`),
  CONSTRAINT `test_odpowiedzi_ibfk_3` FOREIGN KEY (`test_id`) REFERENCES `test_test` (`test_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_odpowiedzi`
--

LOCK TABLES `test_odpowiedzi` WRITE;
/*!40000 ALTER TABLE `test_odpowiedzi` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_odpowiedzi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_pozwolenie`
--

DROP TABLE IF EXISTS `test_pozwolenie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_pozwolenie` (
  `test_pozwolenie_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_realizacja_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `data_od` datetime NOT NULL,
  `data_do` datetime NOT NULL,
  PRIMARY KEY (`test_pozwolenie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_pozwolenie`
--

LOCK TABLES `test_pozwolenie` WRITE;
/*!40000 ALTER TABLE `test_pozwolenie` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_pozwolenie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_pytania`
--

DROP TABLE IF EXISTS `test_pytania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_pytania` (
  `pytanie_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ` int(11) NOT NULL,
  `test_grupa_id` int(11) NOT NULL,
  `tresc_przed` text COLLATE utf8_polish_ci NOT NULL,
  `tresc_w` text COLLATE utf8_polish_ci NOT NULL,
  `aktywne` tinyint(1) NOT NULL DEFAULT '1',
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`pytanie_id`),
  KEY `przedmiot_id` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_pytania`
--

LOCK TABLES `test_pytania` WRITE;
/*!40000 ALTER TABLE `test_pytania` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_pytania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_pytanie_odpowiedz`
--

DROP TABLE IF EXISTS `test_pytanie_odpowiedz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_pytanie_odpowiedz` (
  `pytanie_odpowiedz_id` int(11) NOT NULL AUTO_INCREMENT,
  `pytanie_id` int(11) NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `prawidlowa` tinyint(1) NOT NULL,
  PRIMARY KEY (`pytanie_odpowiedz_id`),
  KEY `pytanie_id` (`pytanie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_pytanie_odpowiedz`
--

LOCK TABLES `test_pytanie_odpowiedz` WRITE;
/*!40000 ALTER TABLE `test_pytanie_odpowiedz` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_pytanie_odpowiedz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_realizacja`
--

DROP TABLE IF EXISTS `test_realizacja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_realizacja` (
  `test_realizacja_id` int(11) NOT NULL AUTO_INCREMENT,
  `opis` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `data_od` datetime NOT NULL,
  `data_do` datetime NOT NULL,
  `czas` int(11) NOT NULL,
  `aktywny` tinyint(1) NOT NULL DEFAULT '0',
  `opiekun_id` int(11) DEFAULT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  `wyniki_widoczne` int(11) DEFAULT NULL,
  `ocena_dobrze` float DEFAULT NULL,
  `ocena_zle` float DEFAULT NULL,
  PRIMARY KEY (`test_realizacja_id`),
  KEY `_modyfikowal` (`_modyfikowal`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `przedmiot_edycja_id` (`przedmiot_edycja_id`),
  KEY `opiekun_id` (`opiekun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_realizacja`
--

LOCK TABLES `test_realizacja` WRITE;
/*!40000 ALTER TABLE `test_realizacja` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_realizacja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_realizacja_grupy`
--

DROP TABLE IF EXISTS `test_realizacja_grupy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_realizacja_grupy` (
  `test_realizacja_id` int(11) NOT NULL,
  `test_grupa_id` int(11) NOT NULL,
  `max_pkt` float NOT NULL,
  PRIMARY KEY (`test_realizacja_id`,`test_grupa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_realizacja_grupy`
--

LOCK TABLES `test_realizacja_grupy` WRITE;
/*!40000 ALTER TABLE `test_realizacja_grupy` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_realizacja_grupy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_test`
--

DROP TABLE IF EXISTS `test_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `test_realizacja_id` int(11) NOT NULL,
  `typ_id` int(11) NOT NULL,
  `data_rozp` datetime NOT NULL,
  `data_zak` datetime DEFAULT NULL,
  `host_rozp` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `host_zak` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `oceniony` tinyint(1) DEFAULT NULL,
  `ocena` float DEFAULT NULL,
  `ocenial_id` int(11) DEFAULT NULL,
  `ocenial_data` datetime DEFAULT NULL,
  `komentarz` text COLLATE utf8_polish_ci,
  `_usuniety` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`test_id`),
  UNIQUE KEY `student_id` (`uzytkownik_id`,`test_realizacja_id`),
  KEY `ocenial_id` (`ocenial_id`),
  CONSTRAINT `test_test_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_test`
--

LOCK TABLES `test_test` WRITE;
/*!40000 ALTER TABLE `test_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_zestaw`
--

DROP TABLE IF EXISTS `test_zestaw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_zestaw` (
  `test_id` int(11) NOT NULL,
  `pytanie_id` int(11) NOT NULL,
  PRIMARY KEY (`test_id`,`pytanie_id`),
  KEY `pytanie_id` (`pytanie_id`),
  CONSTRAINT `test_zestaw_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test_test` (`test_id`) ON DELETE CASCADE,
  CONSTRAINT `test_zestaw_ibfk_2` FOREIGN KEY (`pytanie_id`) REFERENCES `test_pytania` (`pytanie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_zestaw`
--

LOCK TABLES `test_zestaw` WRITE;
/*!40000 ALTER TABLE `test_zestaw` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_zestaw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_haslo`
--

DROP TABLE IF EXISTS `token_haslo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_haslo` (
  `token_haslo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `token` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`token_haslo_id`),
  UNIQUE KEY `uzytkownik_id` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_haslo`
--

LOCK TABLES `token_haslo` WRITE;
/*!40000 ALTER TABLE `token_haslo` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_haslo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uprawnienia`
--

DROP TABLE IF EXISTS `uprawnienia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uprawnienia` (
  `system_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `poziom_id` int(11) NOT NULL,
  PRIMARY KEY (`system_id`,`uzytkownik_id`,`poziom_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `uprawnienia_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uprawnienia`
--

LOCK TABLES `uprawnienia` WRITE;
/*!40000 ALTER TABLE `uprawnienia` DISABLE KEYS */;
/*!40000 ALTER TABLE `uprawnienia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uprawnienia_grupa`
--

DROP TABLE IF EXISTS `uprawnienia_grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uprawnienia_grupa` (
  `system_id` int(11) NOT NULL,
  `grupa_id` int(11) NOT NULL,
  `poziom` int(11) NOT NULL,
  PRIMARY KEY (`system_id`,`grupa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uprawnienia_grupa`
--

LOCK TABLES `uprawnienia_grupa` WRITE;
/*!40000 ALTER TABLE `uprawnienia_grupa` DISABLE KEYS */;
/*!40000 ALTER TABLE `uprawnienia_grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzytkownik` (
  `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwisko` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `imie_1` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `imie_2` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `miejsce_urodzenia` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `plec` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_uzytkownika_id` int(11) NOT NULL,
  `aktywny` tinyint(1) NOT NULL DEFAULT '0',
  `usuniety` tinyint(1) NOT NULL DEFAULT '0',
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_id`),
  UNIQUE KEY `login` (`login`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`),
  KEY `nazwisko` (`nazwisko`,`imie_1`,`imie_2`) USING BTREE,
  KEY `typ_uzytkownika_fk` (`typ_uzytkownika_id`),
  CONSTRAINT `typ_uzytkownika_fk` FOREIGN KEY (`typ_uzytkownika_id`) REFERENCES `sl_typ_uzytkownika` (`typ_uzytkownika_id`),
  CONSTRAINT `uzytkownik_ibfk_1` FOREIGN KEY (`_wprowadzil`) REFERENCES `uzytkownik` (`uzytkownik_id`),
  CONSTRAINT `uzytkownik_ibfk_2` FOREIGN KEY (`_modyfikowal`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik`
--

LOCK TABLES `uzytkownik` WRITE;
/*!40000 ALTER TABLE `uzytkownik` DISABLE KEYS */;
INSERT INTO `uzytkownik` VALUES (1,'Doe','Hana',NULL,'hana.doe','207023ccb44feb4d7dadca005ce29a64','hana.doe@mail.com','123456789','1970-01-01','Warszawa','k',1,1,0,NULL,NULL,NULL,NULL),(2,'Doe','Darius',NULL,'darius.doe','207023ccb44feb4d7dadca005ce29a64','darius.doe@mail.com','987654321','1970-01-02','Warszawa','m',1,1,0,NULL,NULL,NULL,NULL),(3,'Doe','Mario',NULL,'mario.doe','207023ccb44feb4d7dadca005ce29a64','mario.doe@mail.com','123456789','1970-01-03','Warszawa','m',1,1,0,NULL,NULL,NULL,NULL),(4,'Stone','Bono','','bono.stone','207023ccb44feb4d7dadca005ce29a64','bono.stone@mail.com','987654321','1970-01-04','Gdańsk','m',1,1,0,NULL,NULL,NULL,NULL),(5,'Stone','Kate','','kate.stone','207023ccb44feb4d7dadca005ce29a64','kate.stone@mail.com','987654321','1970-01-05','Gdańsk','k',2,1,0,NULL,NULL,NULL,NULL),(6,'Doe','Anet','','anet.doe','207023ccb44feb4d7dadca005ce29a64','anet.doe@mail.com','123456789','1970-01-06','Gdańsk','k',2,1,0,NULL,NULL,NULL,NULL),(7,'Doe','John','','john.doe','207023ccb44feb4d7dadca005ce29a64','john.doe@mail.com','123456789','1970-01-07','Warszawa','m',2,1,0,NULL,NULL,NULL,NULL),(8,'Doe','Victoria','','victoria.doe','207023ccb44feb4d7dadca005ce29a64','victoria.doe@mail.com','123456789','1970-01-08','Gdańsk','m',2,1,0,NULL,NULL,NULL,NULL),(9,'Doe','Juliet','','juliet.doe','haslo','juliet.doe@mail.com','987654321','1970-01-09','Warszawa','k',2,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik_archiwum`
--

DROP TABLE IF EXISTS `uzytkownik_archiwum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzytkownik_archiwum` (
  `uzytkownik_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwisko` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `imie_1` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `imie_2` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `haslo` varchar(32) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  `miejsce_urodzenia` varchar(100) COLLATE utf8_polish_ci DEFAULT NULL,
  `plec` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `typ_uzytkownika_id` int(11) NOT NULL,
  `aktywny` tinyint(1) NOT NULL DEFAULT '0',
  `usuniety` tinyint(1) NOT NULL DEFAULT '0',
  `_wprowadzil` int(11) DEFAULT NULL,
  `_wprowadzil_data` datetime DEFAULT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_id`),
  UNIQUE KEY `login` (`login`),
  KEY `_wprowadzil` (`_wprowadzil`),
  KEY `_modyfikowal` (`_modyfikowal`),
  KEY `nazwisko` (`nazwisko`,`imie_1`,`imie_2`) USING BTREE,
  KEY `typ_uzytkownika_fk` (`typ_uzytkownika_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik_archiwum`
--

LOCK TABLES `uzytkownik_archiwum` WRITE;
/*!40000 ALTER TABLE `uzytkownik_archiwum` DISABLE KEYS */;
/*!40000 ALTER TABLE `uzytkownik_archiwum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik_log_info`
--

DROP TABLE IF EXISTS `uzytkownik_log_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzytkownik_log_info` (
  `uzytkownik_log_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `login_sukces` datetime DEFAULT NULL,
  `login_sukces_ip` varchar(60) COLLATE utf8_polish_ci DEFAULT NULL,
  `login_fail` datetime DEFAULT NULL,
  `login_fail_ip` varchar(60) COLLATE utf8_polish_ci DEFAULT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uzytkownik_log_info_id`),
  UNIQUE KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `uzytkownik_log_info_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik_log_info`
--

LOCK TABLES `uzytkownik_log_info` WRITE;
/*!40000 ALTER TABLE `uzytkownik_log_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `uzytkownik_log_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik_notatka`
--

DROP TABLE IF EXISTS `uzytkownik_notatka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uzytkownik_notatka` (
  `uzytkownik_notatka_id` int(11) NOT NULL AUTO_INCREMENT,
  `uzytkownik_id` int(11) NOT NULL,
  `tresc` text COLLATE utf8_polish_ci NOT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`uzytkownik_notatka_id`),
  KEY `uzytkownik_id` (`uzytkownik_id`),
  CONSTRAINT `uzytkownik_notatka_ibfk_1` FOREIGN KEY (`uzytkownik_id`) REFERENCES `uzytkownik` (`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik_notatka`
--

LOCK TABLES `uzytkownik_notatka` WRITE;
/*!40000 ALTER TABLE `uzytkownik_notatka` DISABLE KEYS */;
/*!40000 ALTER TABLE `uzytkownik_notatka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_plan`
--

DROP TABLE IF EXISTS `view_plan`;
/*!50001 DROP VIEW IF EXISTS `view_plan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_plan` AS SELECT 
 1 AS `nazwa_pl`,
 1 AS `ects`,
 1 AS `kod_przedmiotu`,
 1 AS `wymagania_pl`,
 1 AS `cel_pl`,
 1 AS `opis_standard_pl`,
 1 AS `bibliografia_pl`,
 1 AS `metody_oceny_pl`,
 1 AS `nazwisko`,
 1 AS `imie_1`,
 1 AS `imie_2`,
 1 AS `nazwa`,
 1 AS `odpowiedzialny_disp`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_przedmiot_edycja_projekt_student`
--

DROP TABLE IF EXISTS `view_przedmiot_edycja_projekt_student`;
/*!50001 DROP VIEW IF EXISTS `view_przedmiot_edycja_projekt_student`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_przedmiot_edycja_projekt_student` AS SELECT 
 1 AS `przedmiot_edycja_projekt_id`,
 1 AS `uzytkownik_id`,
 1 AS `data_zapisu`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_www_laboratoria`
--

DROP TABLE IF EXISTS `view_www_laboratoria`;
/*!50001 DROP VIEW IF EXISTS `view_www_laboratoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_www_laboratoria` AS SELECT 
 1 AS `sekcja_id`,
 1 AS `jednostka_id`,
 1 AS `nazwa`,
 1 AS `sala`,
 1 AS `opiekun_id`,
 1 AS `opiekun`,
 1 AS `opis`,
 1 AS `zdjecie`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_www_laboratoria_en`
--

DROP TABLE IF EXISTS `view_www_laboratoria_en`;
/*!50001 DROP VIEW IF EXISTS `view_www_laboratoria_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_www_laboratoria_en` AS SELECT 
 1 AS `sekcja_id`,
 1 AS `jednostka_id`,
 1 AS `nazwa`,
 1 AS `sala`,
 1 AS `opiekun_id`,
 1 AS `opiekun`,
 1 AS `opis`,
 1 AS `zdjecie`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_www_pracownicy`
--

DROP TABLE IF EXISTS `view_www_pracownicy`;
/*!50001 DROP VIEW IF EXISTS `view_www_pracownicy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_www_pracownicy` AS SELECT 
 1 AS `uzytkownik_id`,
 1 AS `nazwisko`,
 1 AS `imie`,
 1 AS `tytul`,
 1 AS `email`,
 1 AS `pokoj`,
 1 AS `telefon`,
 1 AS `grupa_zatrudnienia_id`,
 1 AS `doktorant`,
 1 AS `grupa_zatrudnienia`,
 1 AS `jednostka_id`,
 1 AS `strona_domowa`,
 1 AS `profil_naukowy`,
 1 AS `o_sobie`,
 1 AS `konsultacje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_www_pracownicy_en`
--

DROP TABLE IF EXISTS `view_www_pracownicy_en`;
/*!50001 DROP VIEW IF EXISTS `view_www_pracownicy_en`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_www_pracownicy_en` AS SELECT 
 1 AS `uzytkownik_id`,
 1 AS `pracownik`,
 1 AS `tytul`,
 1 AS `email`,
 1 AS `pokoj`,
 1 AS `telefon`,
 1 AS `grupa_zatrudnienia_id`,
 1 AS `grupa_zatrudnienia`,
 1 AS `jednostka_id`,
 1 AS `strona_domowa`,
 1 AS `profil_naukowy`,
 1 AS `o_sobie`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zobowiazanie`
--

DROP TABLE IF EXISTS `zobowiazanie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zobowiazanie` (
  `zobowiazanie_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `przedmiot_edycja_id` int(11) NOT NULL,
  `uzytkownik_id` int(11) NOT NULL,
  `kwota` int(11) DEFAULT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`zobowiazanie_id`),
  KEY `przedmiot_edycja_id` (`przedmiot_edycja_id`,`uzytkownik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zobowiazanie`
--

LOCK TABLES `zobowiazanie` WRITE;
/*!40000 ALTER TABLE `zobowiazanie` DISABLE KEYS */;
/*!40000 ALTER TABLE `zobowiazanie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zobowiazanie_oplata`
--

DROP TABLE IF EXISTS `zobowiazanie_oplata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zobowiazanie_oplata` (
  `zobowiazanie_oplata_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zobowiazanie_id` int(11) NOT NULL,
  `platnosc_id` int(11) NOT NULL,
  `kwota` float NOT NULL,
  `_wprowadzil` int(11) NOT NULL,
  `_wprowadzil_data` datetime NOT NULL,
  `_modyfikowal` int(11) DEFAULT NULL,
  `_modyfikowal_data` datetime DEFAULT NULL,
  PRIMARY KEY (`zobowiazanie_oplata_id`),
  KEY `zobowiazanie_id` (`zobowiazanie_id`,`platnosc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zobowiazanie_oplata`
--

LOCK TABLES `zobowiazanie_oplata` WRITE;
/*!40000 ALTER TABLE `zobowiazanie_oplata` DISABLE KEYS */;
/*!40000 ALTER TABLE `zobowiazanie_oplata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `eksport`
--

/*!50001 DROP VIEW IF EXISTS `eksport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eksport` AS select `uzytkownik`.`uzytkownik_id` AS `uzytkownik_id`,`student_dodatkowe`.`rok_startu` AS `rok_startu`,NULL AS `NULL`,`student_dodatkowe`.`nr_indeks` AS `nr_indeks`,`uzytkownik`.`nazwisko` AS `nazwisko`,`uzytkownik`.`imie_1` AS `imie_1`,`uzytkownik`.`imie_2` AS `imie_2`,`student_dodatkowe`.`imie_ojca` AS `imie_ojca`,`student_dodatkowe`.`imie_matki` AS `imie_matki`,`student_dodatkowe`.`pesel` AS `pesel`,NULL AS `My_exp_NULL`,`uzytkownik`.`plec` AS `plec`,`uzytkownik`.`data_urodzenia` AS `data_urodzenia`,`uzytkownik`.`miejsce_urodzenia` AS `miejsce_urodzenia`,`student_dodatkowe`.`adres_kod` AS `adres_kod`,`student_dodatkowe`.`adres_poczta` AS `adres_poczta`,`student_dodatkowe`.`adres_2` AS `adres_2`,`student_dodatkowe`.`adres_1` AS `adres_1`,NULL AS `My_exp_1_NULL`,NULL AS `My_exp_2_NULL`,`uzytkownik`.`telefon` AS `telefon`,`uzytkownik`.`email` AS `email`,`student_dodatkowe`.`adr_kor_kod` AS `adr_kor_kod`,`student_dodatkowe`.`adr_kor_poczta` AS `adr_kor_poczta`,`student_dodatkowe`.`adr_kor_2` AS `adr_kor_2`,`student_dodatkowe`.`adr_kor_1` AS `adr_kor_1`,NULL AS `My_exp_3_NULL`,NULL AS `My_exp_4_NULL`,`student_dodatkowe`.`dodatkowy_telefon` AS `dodatkowy_telefon`,`student_dodatkowe`.`dodatkowy_email` AS `dodatkowy_email`,NULL AS `My_exp_5_NULL`,`student_dodatkowe`.`wku` AS `wku`,`student_dodatkowe`.`rok_matury` AS `rok_matury` from (`uzytkownik` join `student_dodatkowe` on((`uzytkownik`.`uzytkownik_id` = `student_dodatkowe`.`uzytkownik_id`))) where ((`student_dodatkowe`.`data_rozp` > _utf8'2009-09-01') and (`student_dodatkowe`.`typ_studiow_id` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_plan`
--

/*!50001 DROP VIEW IF EXISTS `view_plan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_plan` AS select `s`.`nazwa_pl` AS `nazwa_pl`,`s`.`ects` AS `ects`,`s`.`kod_przedmiotu` AS `kod_przedmiotu`,`s`.`wymagania_pl` AS `wymagania_pl`,`s`.`cel_pl` AS `cel_pl`,`s`.`opis_standard_pl` AS `opis_standard_pl`,`s`.`bibliografia_pl` AS `bibliografia_pl`,`s`.`metody_oceny_pl` AS `metody_oceny_pl`,`u`.`nazwisko` AS `nazwisko`,`u`.`imie_1` AS `imie_1`,`u`.`imie_2` AS `imie_2`,`slt`.`nazwa` AS `nazwa`,concat(`slt`.`nazwa`,_utf8' ',`u`.`imie_1`,_utf8' ',if((`u`.`imie_2` is not null),`u`.`imie_2`,_utf8''),_utf8' ',`u`.`nazwisko`) AS `odpowiedzialny_disp` from (((`przedmiot_syllabus` `s` join `uzytkownik` `u` on((`s`.`odpowiedzialny_id` = `u`.`uzytkownik_id`))) join `pracownik_dodatkowe` `pd` on((`pd`.`uzytkownik_id` = `u`.`uzytkownik_id`))) left join `sl_tytul_naukowy` `slt` on((`pd`.`tytul_naukowy_id` = `slt`.`tytul_naukowy_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_przedmiot_edycja_projekt_student`
--

/*!50001 DROP VIEW IF EXISTS `view_przedmiot_edycja_projekt_student`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`msyfert`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_przedmiot_edycja_projekt_student` AS (select `okno`.`przedmiot_edycja_projekt_student`.`przedmiot_edycja_projekt_id` AS `przedmiot_edycja_projekt_id`,`okno`.`przedmiot_edycja_projekt_student`.`uzytkownik_id` AS `uzytkownik_id`,`okno`.`przedmiot_edycja_projekt_student`.`data_zapisu` AS `data_zapisu` from `przedmiot_edycja_projekt_student`) union (select `pepz`.`przedmiot_edycja_projekt_id` AS `przedmiot_edycja_projekt_id`,`pegls`.`uzytkownik_id` AS `uzytkownik_id`,`pepz`.`data_zapisu` AS `data_zapisu` from (`przedmiot_edycja_projekt_zespol` `pepz` join `przedmiot_edycja_grupa_lokalna_student` `pegls` on((`pepz`.`grupa_lokalna_id` = `pegls`.`grupa_lokalna_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_www_laboratoria`
--

/*!50001 DROP VIEW IF EXISTS `view_www_laboratoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_www_laboratoria` AS select `se`.`sekcja_id` AS `sekcja_id`,`se`.`jednostka_id` AS `jednostka_id`,`se`.`nazwa` AS `nazwa`,group_concat(`sa`.`numer` separator ', ') AS `sala`,`seop`.`uzytkownik_id` AS `opiekun_id`,concat_ws(_utf8' ',`u`.`nazwisko`,`u`.`imie_1`) AS `opiekun`,`se`.`opis` AS `opis`,`se`.`zdjecie` AS `zdjecie` from ((((`sekcja` `se` left join `sekcja_sala` on((`se`.`sekcja_id` = `sekcja_sala`.`sekcja_id`))) left join `sala` `sa` on((`sekcja_sala`.`sala_id` = `sa`.`sala_id`))) left join `sekcja_opiekun` `seop` on((`se`.`sekcja_id` = `seop`.`sekcja_id`))) left join `uzytkownik` `u` on((`seop`.`uzytkownik_id` = `u`.`uzytkownik_id`))) where (`se`.`typ_sekcji_id` = 1) group by `se`.`sekcja_id` order by `se`.`nazwa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_www_laboratoria_en`
--

/*!50001 DROP VIEW IF EXISTS `view_www_laboratoria_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_www_laboratoria_en` AS select `se`.`sekcja_id` AS `sekcja_id`,`se`.`jednostka_id` AS `jednostka_id`,`se`.`nazwa_en` AS `nazwa`,group_concat(`sa`.`numer` separator ', ') AS `sala`,`seop`.`uzytkownik_id` AS `opiekun_id`,concat_ws(_utf8' ',`u`.`nazwisko`,`u`.`imie_1`) AS `opiekun`,`se`.`opis_en` AS `opis`,`se`.`zdjecie` AS `zdjecie` from ((((`sekcja` `se` left join `sekcja_sala` on((`se`.`sekcja_id` = `sekcja_sala`.`sekcja_id`))) left join `sala` `sa` on((`sekcja_sala`.`sala_id` = `sa`.`sala_id`))) left join `sekcja_opiekun` `seop` on((`se`.`sekcja_id` = `seop`.`sekcja_id`))) left join `uzytkownik` `u` on((`seop`.`uzytkownik_id` = `u`.`uzytkownik_id`))) where (`se`.`typ_sekcji_id` = 1) group by `se`.`sekcja_id` order by `se`.`nazwa_en` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_www_pracownicy`
--

/*!50001 DROP VIEW IF EXISTS `view_www_pracownicy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_www_pracownicy` AS select `u`.`uzytkownik_id` AS `uzytkownik_id`,`u`.`nazwisko` AS `nazwisko`,`u`.`imie_1` AS `imie`,`tn`.`nazwa` AS `tytul`,`u`.`email` AS `email`,`sa`.`numer` AS `pokoj`,`u`.`telefon` AS `telefon`,`pd`.`grupa_zatrudnienia_id` AS `grupa_zatrudnienia_id`,`pd`.`doktorant` AS `doktorant`,`gz`.`nazwa` AS `grupa_zatrudnienia`,`pd`.`jednostka_id` AS `jednostka_id`,`pd`.`strona_domowa` AS `strona_domowa`,`pd`.`profil_naukowy` AS `profil_naukowy`,`pd`.`o_sobie` AS `o_sobie`,group_concat(concat(`sd`.`skrot`,_utf8' ',convert(time_format(`pk`.`godzina_od`,_utf8'%k:%i') using utf8),_utf8'-',convert(time_format(`pk`.`godzina_do`,_utf8'%k:%i') using utf8)) separator '; ') AS `konsultacje` from ((((((`uzytkownik` `u` left join `pracownik_dodatkowe` `pd` on((`u`.`uzytkownik_id` = `pd`.`uzytkownik_id`))) left join `sl_tytul_naukowy` `tn` on((`pd`.`tytul_naukowy_id` = `tn`.`tytul_naukowy_id`))) left join `sala` `sa` on((`pd`.`sala_id` = `sa`.`sala_id`))) left join `sl_grupa_zatrudnienia` `gz` on((`pd`.`grupa_zatrudnienia_id` = `gz`.`grupa_zatrudnienia_id`))) left join `pracownik_konsultacje` `pk` on((`u`.`uzytkownik_id` = `pk`.`uzytkownik_id`))) left join `sl_dzien_tygodnia` `sd` on((`pk`.`dzien_tygodnia_id` = `sd`.`dzien_tygodnia_id`))) where ((`u`.`usuniety` = 0) and (`pd`.`grupa_zatrudnienia_id` is not null) and (`u`.`typ_uzytkownika_id` in (2,3,4))) group by `u`.`uzytkownik_id` order by `gz`.`kolejnosc`,`u`.`nazwisko`,`u`.`imie_1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_www_pracownicy_en`
--

/*!50001 DROP VIEW IF EXISTS `view_www_pracownicy_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_www_pracownicy_en` AS select `u`.`uzytkownik_id` AS `uzytkownik_id`,concat_ws(_utf8' ',`u`.`nazwisko`,`u`.`imie_1`) AS `pracownik`,`tn`.`nazwa_en` AS `tytul`,`u`.`email` AS `email`,`sa`.`numer` AS `pokoj`,`u`.`telefon` AS `telefon`,`pd`.`grupa_zatrudnienia_id` AS `grupa_zatrudnienia_id`,`gz`.`nazwa_en` AS `grupa_zatrudnienia`,`pd`.`jednostka_id` AS `jednostka_id`,`pd`.`strona_domowa_en` AS `strona_domowa`,`pd`.`profil_naukowy_en` AS `profil_naukowy`,`pd`.`o_sobie_en` AS `o_sobie` from ((((`uzytkownik` `u` left join `pracownik_dodatkowe` `pd` on((`u`.`uzytkownik_id` = `pd`.`uzytkownik_id`))) left join `sl_tytul_naukowy` `tn` on((`pd`.`tytul_naukowy_id` = `tn`.`tytul_naukowy_id`))) left join `sala` `sa` on((`pd`.`sala_id` = `sa`.`sala_id`))) left join `sl_grupa_zatrudnienia` `gz` on((`pd`.`grupa_zatrudnienia_id` = `gz`.`grupa_zatrudnienia_id`))) where ((`u`.`usuniety` = 0) and (`pd`.`grupa_zatrudnienia_id` is not null) and (`u`.`typ_uzytkownika_id` in (2,3,4))) order by `gz`.`kolejnosc`,concat_ws(_utf8' ',`u`.`nazwisko`,`u`.`imie_1`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-06 15:20:54
