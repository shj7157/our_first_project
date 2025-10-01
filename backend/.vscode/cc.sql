-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: cc
-- ------------------------------------------------------
-- Server version	11.3.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_tb`
--

DROP TABLE IF EXISTS `cart_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_tb` (
  `cart_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `goods_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Goods_q` int(20) NOT NULL,
  PRIMARY KEY (`cart_no`),
  KEY `FK_cart_tb_user_tb` (`user_id`),
  KEY `FK_cart_tb_goods_tb` (`goods_no`),
  CONSTRAINT `FK_cart_tb_goods_tb` FOREIGN KEY (`goods_no`) REFERENCES `goods_tb` (`Goods_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_tb_user_tb` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='사용자들의 결제 예정의 상품배열';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_tb`
--

LOCK TABLES `cart_tb` WRITE;
/*!40000 ALTER TABLE `cart_tb` DISABLE KEYS */;
INSERT INTO `cart_tb` VALUES (46,'asas0130','top3',21),(51,NULL,'bottom3',12);
/*!40000 ALTER TABLE `cart_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_tb`
--

DROP TABLE IF EXISTS `goods_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_tb` (
  `Goods_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `Goods_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_croatian_ci DEFAULT NULL,
  `inv` int(30) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `Goods_img_src` varchar(30) DEFAULT NULL,
 `explain` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Goods_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='상품의 상품 정보를 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_tb`
--

LOCK TABLES `goods_tb` WRITE;
/*!40000 ALTER TABLE `goods_tb` DISABLE KEYS */;
INSERT INTO `goods_tb` VALUES ('bottom1','데님워싱',54,59000,'/images/bottom1','데님 워싱 청바지 사이즈 허리 30in , 총장 106 , 허벅지 40cm 스트릿한 무드가 넘치는 데님 워싱 바지입니다.'),('bottom10','스트링추리닝',72,59000,'/images/bottom10','스트링 추리닝 허리 28~36in , 총장 107 , 허벅지 45cm 다리 옆 부분에 스트링을 달아놓아 통을 조절할 수 있는 스트링 추리닝 입니다.'),('bottom11','데님백바지',174,64000,'/images/bottom11','데님 백바지 허리 31in , 총장 107 ,허벅지 40cm 데님자켓과 셋업으로 판매하는 데님 백바지입니다.'),('bottom12','생지바지',142,62000,'/images/bottom12','생지 바지 허리 30in , 총장 106 , 허벅지 40cm 작년부터 쭉 사랑받고 있는 생지바지입니다.'),('bottom13','워싱연청바지',53,52000,'/images/bottom13','워싱 연청바지 허리 31in , 총장 107 , 허벅지 40cm 2023년도 가장 많은 사람들이 입는 무드의 워싱 연청바지입니다.'),('bottom14','면바지',140,50000,'/images/bottom14','면바지 허리 31in , 총장 106 , 허벅지 40cm 가장 기본적인 무드의 면바지입니다.'),('bottom15','흑면바지',182,56000,'/images/bottom15','흑면바지 허리 31in , 총장 106 , 허벅지 40cm 가장 기본적인 무드의 흑면바지입니다.'),('bottom16','스트링조거츄리닝',121,45000,'/images/bottom16','스트링 조거 츄리닝 28~36in , 총장 107 , 허벅지 45cm 츄리닝 바지 밑에 스트링을 추가해 조거 바지로도 입을 수 있는 스트링 조거 츄리닝입니다.'),('bottom2','스판슬렉스',33,49000,'/images/bottom2','스판 슬렉스 사이즈 허리 31in , 총장 108 , 허벅지 39cm 편안함을 추구하시는 분들께 추천드리는 슬렉스입니다.'),('bottom3','츄리닝바지',38,37000,'/images/bottom3','츄리닝 바지 사이즈 허리 28~36in , 총장 105 , 허벅지 45cm 기본적인 츄리닝을 찾으시는 분들이 원하시던 그 츄리닝입니다.'),('bottom4','백바지',43,52000,'/images/bottom4','백바지 사이즈 허리 30in , 총장 107 , 허벅지 40cm 패션을 좋아하시는 분들이라면 하나씩은 꼭 있다는 흰 바지입니다.'),('bottom5','워싱청바지',71,54000,'/images/bottom5','워싱 청바지 허리 31in , 총장 107 , 허벅지 40cm 2023년도 가장 많은 사람들이 입는 무드의 워싱 청바지입니다.'),('bottom6','워싱흑청바지',185,64000,'/images/bottom6','워싱 흑청바지 허리 31in , 총장 107 , 허벅지 40cm 2023년도 가장 많은 사람들이 입는 무드의 워싱 흑청바지입니다.'),('bottom7','카고워싱청바지',87,75000,'/images/bottom7','카고 워싱 청바지 허리 32in , 총장 108 , 허벅지 42cm 2023년 후반기에 유행을 하고있는 카고바지에 워싱이 들어간 청바지입니다.'),('bottom8','카고워싱데님바지',321,74000,'/images/bottom8','카고 워싱 데님바지 허리 32in, 총장 108 , 허벅지 42cm 2023년 후반기에 유행을 하고있는 카고바지에 워싱이 들어간 데님바지입니다.'),('bottom9','카고면바지',185,67000,'/images/bottom9','카고 면바지 허리 32in , 총장 108 , 허벅지 42cm 2023년 후반기에 유행을 하고있는 카고바지를 면바지에 적용한 카고 면바지입니다.'),('outer1','패딩',54,68000,'/images/outer1','패딩 어깨 65cm , 가슴 69cm , 소매 60cm , 총길이 69cm 가장 대중적인 솜 패딩입니다.'),('outer10','데님워싱자켓',46,65000,'/images/outer10','데님 워싱 자켓 어깨 57cm , 가슴 69cm 소매 68cm , 총길이 69cm 2023년도 많은 대중들이 입는 워싱이 들어간 데님 워싱 자켓입니다.'),('outer11','구스패딩',152,98000,'/images/outer11','구스 패딩 어깨 65cm , 가슴 69cm , 소매 60cm , 총길이 69cm 가장 대중적인 솜 패딩에서 솜을 거위 털로 바꾼 구스 패딩입니다.'),('outer12','스웨이드자켓',49,89000,'/images/outer12','스웨이드 자켓 어깨 56cm , 가슴 69cm , 소매 65cm , 총길이 68cm 많은 사람들이 선호하는 스웨이드 재질의 자켓입니다.'),('outer13','레더패딩',162,99000,'/images/outer13','레더 패딩 어깨 65cm , 가슴 69cm , 소매 60cm , 총길이 69cm 2023년도 기본적인 패딩에서 겉재질을 가죽으로 바꾼 레더 패딩입니다.'),('outer14','모헤어집업',265,72000,'/images/outer14','모헤어 집업 어깨 56cm , 가슴 69cm , 소매 63cm , 총길이 68cm 모헤어 재질의 투웨이 집업인 모헤어 집업입니다.'),('outer15','숏레더패딩',132,95000,'/images/outer15','레더 패딩 어깨 65cm , 가슴 69cm , 소매 60cm , 총길이 60cm 2023년도  재질을 가죽으로 바꾼 크롭한 기장의 숏 레더 패딩입니다.'),('outer16','바이커레더자켓',532,98000,'/images/outer16','바이커 레더 자켓 어깨 57cm , 가슴 67cm , 소매 65cm , 총길이 65cm 2023년도 유행하는 레더자켓에 스트릿한 무드를 담은 바이커 레더 자켓입니다.'),('outer2','조끼패딩',45,65000,'/images/outer2','조끼 패딩 어깨 65cm , 가슴 69cm , 총길이 69cm 2023년도 기본적인 패딩에서 팔 부분을 절개해 없앤 조끼 형태의 패딩입니다.'),('outer3','목폴라 가디건',85,70000,'/images/outer3','목폴라 가디건 어깨 56cm , 가슴 63cm , 소매 63cm , 총길이 64cm 기본 가디건에서 더 따듯하게 만들기 위해 목폴라를 추가한 목폴라 가디건입니다.'),('outer4','배색레더자켓',87,73000,'/images/outer4','배색 레더 자켓 어깨 57cm , 가슴 67cm , 소매 66cm , 총길이 63cm 숏한 기장의 레더 자켓에 배색을 추가해 스트릿한 무드를 연출한 배색 레더 자켓입니다.'),('outer5','무스탕',98,100000,'/images/outer5','무스탕 어깨 63cm , 가슴 68cm , 소매 66cm , 총길이 65cm 겨울철 필수템 남자들의 로망인 무스탕입니다.'),('outer6','모헤어가디건',216,85000,'/images/outer6','모헤어 가디건 어깨 56cm , 가슴 69cm , 소매 63cm , 총길이 68cm 모헤어 재질의 가디건을 새롭게 디자인한 모헤어 가디건입니다.'),('outer7','투웨이집업가디건',165,60000,'/images/outer7','투웨이 집업 가디건 어깨 56cm , 가슴 69cm , 소매 63cm , 총길이 67cm 가디건에 투웨이 집업을 단 투웨이 집업 가디건입니다.'),('outer8','후리스',235,63000,'/images/outer8','후리스 어깨 60cm , 가슴 63cm , 소매 63cm , 총길이 66cm 겨울철 데일리하게 입을 수 있는 후리스입니다.'),('outer9','모헤어집업',215,80000,'/images/outer9','모헤어 집업 어깨 56cm , 가슴 69cm , 소매 63cm , 총길이 63cm 모헤어 재질의 숏한 기장의 투웨이 집업인 모헤어 집업입니다.'),('top1','목폴라니트',40,23000,'/images/top1','목폴라 니트 어깨 48cm , 가슴 60cm , 소매 65cm , 총길이 65cm 겨울철 기본템인 목폴라 니트입니다.'),('top10','앙고라니트',53,68000,'/images/top10','앙고라 니트 어깨 50cm , 가슴 63cm , 소매 67cm , 총길이 65cm 유행하는 앙고라를 니트에 입힌 앙고라 니트입니다.'),('top11','어깨절개슬리브',135,39000,'/images/top11','어깨 절개 슬리브 어깨 50cm , 가슴 60cm 소매 65cm , 총길이 65cm 슬리브티에 어깨에 절개를 더해 퇴폐미를 낼 수 있는 어깨 절개 슬리브입니다.'),('top12','프린팅맨투맨',280,35000,'/images/top12','프린팅 맨투맨 어깨 49cm , 가슴 62cm , 소매 65cm , 총길이 63cm 맨투맨에 프린팅을 더해 캐쥬얼한 무드를 뽐낸 프린팅 맨투맨입니다.'),('top13','브이넥슬리브',83,28000,'/images/top13','브이넥 슬리브 어깨 50cm , 가슴 63cm , 소매 67cm , 총길이 64cm 기본 슬리브에서 넥라인을 브이넥으로 만든 브이넥 슬리브입니다.'),('top14','레터링후드티',180,34000,'/images/top14','레터링 후드티 어깨 51cm , 가슴 63cm , 소매 64cm , 총길이 62cm 후드티에 레터링을 더해 스트릿한 무드를 낸 레터링 후드티입니다.'),('top15','케이블긴팔니트',75,36000,'/images/top15','케이블 긴팔 니트 어깨 49cm , 가슴 60cm , 소매 63cm , 총길이 65cm 겨울철 기본템인 케이블 긴팔 니트입니다. '),('top16','배색슬리브',63,29000,'/images/top16','배색 슬리브 어깨 50cm , 가슴 63cm , 소매 67cm , 총길이 64cm 기본 슬리브에서 배색을 더한 배색 슬리브입니다.'),('top2','백호니트',30,40000,'/images/top2','백호 니트 어깨 50cm , 가슴 62cm , 소매 67cm , 총길이 65cm 니트에 여러색들을 섞어 스트릿한 무드를 더한 백호 니트입니다.'),('top3','슬리브니트',35,35000,'/images/top3','슬리브 니트 어깨 50cm , 가슴 63cm , 소매 67cm , 총길이 64cm 기본 슬리브에 재질을 니트재질로 만들어 더 따듯한 느낌의 슬리브 니트입니다.'),('top4','케이블니트',25,38000,'/images/top4','케이블 긴팔 니트 어깨 49cm , 가슴 60cm , 소매 63cm , 총길이 65cm 겨울철 기본템인 케이블 니트입니다. '),('top5','윈드브레이커',138,53000,'/images/top5','윈드브레이커 어깨 51cm , 가슴 61cm , 소매 63cm , 총길이 66cm 기본적인 바람막이 재질의 윈드브레이커입니다.'),('top6','꽈배기니트',46,43000,'/images/top6','꽈배기 니트 어깨 50cm , 가슴 60cm , 소매 62cm , 총길이 64cm 니트에 꽈배기와 비슷한 디자인을 추가해 캐쥬얼한 무드의 꽈배기 니트입니다.'),('top7','루즈핏니트',230,28000,'/images/top7','루즈핏 니트 어개 53cm , 가슴 63cm , 소매 67cm , 총길이 67cm 루즈한 핏을 내기 위해 만들어낸 루즈핏 니트입니다.'),('top8','목폴라기모니트',89,45000,'/images/top8','목폴라 기모 니트 어깨 48cm , 가슴 60cm , 소매 65cm , 총길이 65cm 겨울철 기본템인 목폴라 니트에 기모를 추가한 목폴라 기모 니트입니다.'),('top9','브이넥니트',65,39000,'/images/top9','브이넥 니트 어깨 50cm , 가슴 64cm , 소매 66cm , 총길이 64cm 기본 니트에서 넥라인을 브이넥으로 만든 브이넥 니트입니다.');
/*!40000 ALTER TABLE `goods_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_tb`
--

DROP TABLE IF EXISTS `order_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_tb` (
  `or_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `goods_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `or_q` int(30) NOT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`or_no`) USING BTREE,
  KEY `FK_order_tb_goods_tb` (`goods_no`),
  KEY `FK_order_tb_user_tb` (`user_id`),
  CONSTRAINT `FK_order_tb_goods_tb` FOREIGN KEY (`goods_no`) REFERENCES `goods_tb` (`Goods_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_tb_user_tb` FOREIGN KEY (`user_id`) REFERENCES `user_tb` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='회원이 상품을 주문하는 것을 관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_tb`
--

LOCK TABLES `order_tb` WRITE;
/*!40000 ALTER TABLE `order_tb` DISABLE KEYS */;
INSERT INTO `order_tb` VALUES (206,'asas0130','outer14',21,'2023-12-03 20:20:38'),(207,'asas0130','top2',4,'2023-12-03 20:29:10'),(208,'asas0130','bottom2',21,'2023-12-03 20:29:10'),(209,'asas0130','outer3',32,'2023-12-04 00:38:27'),(210,'asas0130','bottom1',45,'2023-12-04 00:39:08'),(211,'asas0130','outer2',12,'2023-12-04 00:39:08'),(212,'asas0130','outer10',12,'2023-12-04 00:39:08'),(213,'asas0130','top1',3,'2023-12-04 15:47:08'),(214,'asas0130','bottom3',21,'2023-12-04 15:47:55'),(215,'asas0130','top3',12,'2023-12-04 15:47:55'),(216,'asas0130','top2',3,'2023-12-10 22:02:57');
/*!40000 ALTER TABLE `order_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tb`
--

DROP TABLE IF EXISTS `user_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_tb` (
  `ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `psw` varchar(20) NOT NULL,
  `user_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `addr` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birth` varchar(90) NOT NULL,
  `phone` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='사용자들의 회원 정보를 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tb`
--

LOCK TABLES `user_tb` WRITE;
/*!40000 ALTER TABLE `user_tb` DISABLE KEYS */;
INSERT INTO `user_tb` VALUES ('asas0130','0104155a','서현진','소사로202번길28','011015','01094867157'),('asas013010','123456','서현진','소사로','011015','01094867157'),('asas01309','0104155a','서현진','소사로 202번길','010101','01090727157'),('minseong0422','dlalstjd12?','이민성','은평구 ','030422','01030357714'),('shj7157','0104155a','서현진','소사','011015','01094867157');
/*!40000 ALTER TABLE `user_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-01 17:48:53
