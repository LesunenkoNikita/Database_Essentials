-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: library2
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `biography` text,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `book_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,'John Smith','1975-08-15','American','John Smith is a prolific author with over 20 published books.',NULL),(2,'Jane Doe','1980-04-20','British','Jane Doe is an award-winning author known for her captivating storytelling.',NULL),(3,'Michael Johnson','1992-11-30','Canadian','Michael Johnson is a new author making waves in the literary world.',NULL),(4,'Emily Wilson','1985-06-25','Australian','Emily Wilson writes gripping mysteries that keep readers on the edge of their seats.',NULL),(5,'David Brown','1970-01-10','Irish','David Brown is known for his epic fantasy series set in a richly imagined world.',NULL),(6,'Jane Austen','1775-12-16','British','Jane Austen was an English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century.',NULL),(7,'Charles Dickens','1812-02-07','British','Charles Dickens was an English writer and social critic. He created some of the world\'s best-known fictional characters and is regarded by many as the greatest novelist of the Victorian era.',NULL),(8,'Ernest Hemingway','1899-07-21','American','Ernest Hemingway was an American novelist, short-story writer, and journalist. His economical and understated style had a strong influence on 20th-century fiction, while his adventurous lifestyle and his public image brought him admiration from later generations.',NULL),(9,'Agatha Christie','1890-09-15','British','Agatha Christie was an English writer known for her 66 detective novels and 14 short story collections, particularly those revolving around fictional detectives Hercule Poirot and Miss Marple.',NULL),(10,'Toni Morrison','1931-02-18','American','Toni Morrison was an American novelist, essayist, editor, teacher, and professor emeritus at Princeton University. Her novels are known for their epic themes, vivid dialogue, and richly detailed characters.',NULL),(11,'J.R.R. Tolkien','1892-01-03','British','J.R.R. Tolkien was an English writer, poet, philologist, and academic, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings.',NULL),(12,'Gabriel García Márquez','1927-03-06','Colombian','Gabriel García Márquez was a Colombian novelist, short-story writer, screenwriter, and journalist, known affectionately as Gabo throughout Latin America. He was considered one of the most significant authors of the 20th century and was awarded the Nobel Prize in Literature in 1982.',NULL);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors_mtm`
--

DROP TABLE IF EXISTS `book_authors_mtm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors_mtm` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_authors_mtm_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `book_authors_mtm_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `book_authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors_mtm`
--

LOCK TABLES `book_authors_mtm` WRITE;
/*!40000 ALTER TABLE `book_authors_mtm` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_authors_mtm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `edition` int DEFAULT NULL,
  `release_year` year DEFAULT NULL,
  `price` double DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Journey of Self-Discovery','978-1234567890',1,2020,19.99,1,1),(2,'Secrets Unveiled: A Detective Memoir','978-0987654321',2,2018,15.99,2,2),(3,'Recipes for Success: Business Strategies Unveiled','978-9876543210',1,2022,24.99,1,3),(4,'Thriving in the Digital Age: Strategies for Success','978-5432109876',1,2021,29.99,3,4),(5,'The Art of Mindfulness: Living in the Present','978-1357924680',3,2019,12.99,4,5),(6,'Pride and Prejudice','9780141439518',1,2000,9.99,1,1),(7,'Great Expectations','9780141439563',1,2001,12.99,2,1),(8,'The Old Man and the Sea','9780684801223',1,2002,10.99,3,1),(9,'Murder on the Orient Express','9780062693662',1,2002,11.99,4,3),(10,'The Fellowship of the Ring','9780547928210',1,2004,15.99,5,5),(11,'Beloved','9781400033416',1,2005,14.99,6,1),(12,'One Hundred Years of Solitude','9780060883287',1,2006,13.99,7,2);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice Johnson','123 Maple St, Smalltown','555-123-4567','alice.johnson@gmail.com','SecurePass123!'),(2,'Bob Smith','456 Oak St, Villagetown','555-987-6543','bob.smith@yahoo.com','StrongPass456$'),(3,'Charlie Brown','789 Pine St, Hamletville','555-111-2222','charlie.brown@hotmail.com','SafePassword789!'),(4,'David Davis','654 Elm St, Countryside','555-333-4444','david.davis@example.com','ProtectedPassABC$'),(5,'Emma Wilson','987 Cedar St, Cityville','555-555-5555','emma.wilson@outlook.com','SecretPassDEF!'),(6,'Emma Johnson','789 Elm Road, Village, Country','+1122334455','emma@example.com','new_hashed_password_1'),(7,'Oliver Brown','101 Pine Lane, City, Country','+1122334455','oliver@example.com','new_hashed_password_2'),(8,'Ava Wilson','202 Maple Street, Town, Country','+9988776655','ava@example.com','new_hashed_password_3'),(9,'Liam Anderson','303 Cedar Avenue, Village, Country','+5544332211','liam@example.com','new_hashed_password_4'),(10,'Charlotte Taylor','404 Birch Road, City, Country','+7711223344','charlotte@example.com','new_hashed_password_5'),(11,'Noah Smith','123 Main Street, City, Country','+1234567890','noah@example.com','new_hashed_password_6'),(12,'Isabella Doe','456 Oak Avenue, Town, Country','+1987654321','isabella@example.com','new_hashed_password_7');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_mtm`
--

DROP TABLE IF EXISTS `customers_mtm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_mtm` (
  `customer_id` int NOT NULL,
  `loan_id` int NOT NULL,
  PRIMARY KEY (`customer_id`,`loan_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `customers_mtm_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customers_mtm_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_mtm`
--

LOCK TABLES `customers_mtm` WRITE;
/*!40000 ALTER TABLE `customers_mtm` DISABLE KEYS */;
INSERT INTO `customers_mtm` VALUES (1,1),(2,2),(1,3),(4,4),(5,5),(1,6),(7,7),(8,8),(9,9),(10,10),(1,11),(12,12);
/*!40000 ALTER TABLE `customers_mtm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Fiction','Books that are not based on real events or people'),(2,'Non-Fiction','Books that are based on real events or people'),(3,'Science Fiction','Books that speculate on scientific discoveries or technologies'),(4,'Mystery','Books that involve solving a crime or puzzle'),(5,'Fantasy','Books that involve magical or supernatural elements'),(6,'Thriller','A genre of literature, film, or television that is designed to excite the audience.'),(7,'Romance','Focuses on romantic love relationships between characters.'),(8,'Historical Fiction','Set in the past and often incorporates real historical events or people.'),(9,'Horror','Intended to scare, shock, or disgust the audience with supernatural elements, violence, or gore.'),(10,'Biography','An account of someones life written by someone else.'),(11,'Self-Help','Books offering guidance on personal growth, self-improvement, or self-help.'),(12,'Poetry','Literary work that uses aesthetic and rhythmic qualities of language to evoke meanings.');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres_mtm`
--

DROP TABLE IF EXISTS `genres_mtm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres_mtm` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `genres_mtm_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `genres_mtm_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres_mtm`
--

LOCK TABLES `genres_mtm` WRITE;
/*!40000 ALTER TABLE `genres_mtm` DISABLE KEYS */;
INSERT INTO `genres_mtm` VALUES (1,1),(6,1),(7,1),(8,1),(11,1),(1,2),(2,2),(9,2),(12,2),(3,3),(4,4),(5,5),(10,5);
/*!40000 ALTER TABLE `genres_mtm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,1,1,'2024-01-01','2024-01-15','2024-01-14'),(2,2,2,'2024-01-05','2024-01-20',NULL),(3,3,3,'2024-01-10','2024-01-25',NULL),(4,4,4,'2024-01-15','2024-01-30',NULL),(5,1,5,'2024-01-20','2024-02-04',NULL),(6,6,6,'2024-02-01','2024-02-15',NULL),(7,7,7,'2024-02-02','2024-02-16',NULL),(8,1,8,'2024-02-03','2024-02-17',NULL),(9,9,9,'2024-02-04','2024-02-18',NULL),(10,10,10,'2024-02-05','2024-02-19',NULL),(11,1,11,'2024-02-06','2024-02-20',NULL),(12,12,12,'2024-02-07','2024-02-21',NULL);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans_mtm`
--

DROP TABLE IF EXISTS `loans_mtm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans_mtm` (
  `book_id` int NOT NULL,
  `loan_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`loan_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `loans_mtm_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `loans_mtm_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans_mtm`
--

LOCK TABLES `loans_mtm` WRITE;
/*!40000 ALTER TABLE `loans_mtm` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans_mtm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Random House','123 Main St, Cityville','123-456-7890','www.randomhouse.com'),(2,'HarperCollins','456 Elm St, Townsville','987-654-3210','www.harpercollins.com'),(3,'Simon & Schuster','789 Oak St, Villagetown','555-123-4567','www.simonschuster.com'),(4,'Penguin Books','321 Pine St, Hamletville','555-987-6543','www.penguinbooks.com'),(5,'Hachette Book Group','654 Maple St, Countryside','111-222-3333','www.hachettebookgroup.com'),(6,'Penguin Random House','1745 Broadway, New York, NY, USA','+1 212-782-9000','www.penguinrandomhouse.com'),(7,'HarperCollins Publishers','195 Broadway, New York, NY, USA','+1 212-207-7000','www.harpercollins.com'),(8,'Simon & Schuster','1230 Avenue of the Americas, New York, NY, USA','+1 212-698-7000','www.simonandschuster.com'),(9,'Macmillan Publishers','120 Broadway, New York, NY, USA','+1 212-226-7525','us.macmillan.com'),(10,'Hachette Book Group','1290 Avenue of the Americas, New York, NY, USA','+1 212-364-1100','www.hachettebookgroup.com'),(11,'Scholastic Corporation','557 Broadway, New York, NY, USA','+1 212-343-6100','www.scholastic.com'),(12,'Pearson Education','330 Hudson Street, New York, NY, USA','+1 212-414-6000','www.pearson.com');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-08 15:03:20
