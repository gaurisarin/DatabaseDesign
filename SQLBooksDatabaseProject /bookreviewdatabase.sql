CREATE DATABASE  IF NOT EXISTS `bookreviewdatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bookreviewdatabase`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bookreviewdatabase
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL,
  `rating_id` int DEFAULT NULL,
  `book_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `FK_authorrating` (`rating_id`),
  KEY `FK_bookauthor` (`book_id`),
  CONSTRAINT `FK_authorrating` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bookauthor` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,1,1,'Leo Tolstoy'),(2,2,2,'F. Scott Fitzgerald'),(3,NULL,3,'Herman Melville'),(4,4,4,'Suzanne Collins'),(5,5,5,'Rick Riordan'),(6,6,6,'J. R. R. Tolkien'),(7,7,7,'Paulo Coelho'),(8,8,8,'George Orwell'),(9,NULL,9,'James Clear'),(10,10,10,'J. D. Salinger');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `length` int NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'War and Peace',1225),(2,'The Great Gatsby',208),(3,'Moby Dick',752),(4,'The Hunger Games',374),(5,'The Lightning Thief',377),(6,'The Hobbit',304),(7,'The Alchemist',208),(8,'1984',328),(9,'Atomic Habits',320),(10,'The Catcher in the Rye',277);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_book`
--

DROP TABLE IF EXISTS `favorite_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_book` (
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  KEY `FK_favbook` (`book_id`),
  KEY `FK_user` (`user_id`),
  CONSTRAINT `FK_favbook` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_book`
--

LOCK TABLES `favorite_book` WRITE;
/*!40000 ALTER TABLE `favorite_book` DISABLE KEYS */;
INSERT INTO `favorite_book` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `favorite_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `genre_type` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `FK_bookgenre` (`book_id`),
  CONSTRAINT `FK_bookgenre` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,1,'Novel, Historical Novel, Historical Fiction, Romance Novel, War Story, Philosophical Fiction'),(2,2,'Fiction, Tragedy, Novel'),(3,3,'Epic, Adventure Fiction, Nautical Fiction'),(4,4,'Novel, Young Adult Fiction, Science Fiction, Childrens Literature, Dystopian Fiction, Apocalyptic Fiction, Adventure Fiction'),(5,5,'Greek Mythology, Novel, Young Adult Fiction, Fantasy Fiction, High Fantasy'),(6,6,'Novel, Fantasy Fiction, Childrens Literature, High Fantasy, Epic'),(7,7,'Novel, Drama, Quest, Fantasy Fiction, Adventure Fiction'),(8,8,'Science Fiction, Social Science Fiction, Dystopian Fiction, Political Fiction'),(9,9,'Self-help'),(10,10,'Novel, Literary Realism, Young Adult Fiction, Coming-of-age Story');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motion_media`
--

DROP TABLE IF EXISTS `motion_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motion_media` (
  `motion_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `if_exists` tinyint(1) DEFAULT NULL,
  `actors` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`motion_id`),
  KEY `FK_bookmotion` (`book_id`),
  CONSTRAINT `FK_bookmotion` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motion_media`
--

LOCK TABLES `motion_media` WRITE;
/*!40000 ALTER TABLE `motion_media` DISABLE KEYS */;
INSERT INTO `motion_media` VALUES (1,1,1,'Audrey Hepburn, Henry Fonda, Mel Ferrer, Vittorio Gassman, Herbert Lon'),(2,2,1,'Leonardo DiCaprio, Tobey Maguire, Carey Mulligan, Joel Edgerton, Elizabeth Debicki'),(3,3,1,'Gregory Peck, Richard Basehart, Orson Welles, Leo Genn'),(4,4,1,'Jennifer Lawrence, Josh Hutchinson, Liam Hemsworth, Woody Harrelson, Elizabth Banks'),(5,5,1,'Logan Lerman, Brandon T. Jackson, Alexandra Daddario, Jake Abel, Pierce Brosnan'),(6,6,1,'Peter Jackson, Martin Freeman, Richard Armitage, Ian McKellen, Andy Serkis'),(7,7,0,NULL),(8,8,1,'John Hurt, Suzanna Hamilton, Richard Burton, Rupert Baderman, Cyril Cusack'),(9,9,0,NULL),(10,10,0,NULL);
/*!40000 ALTER TABLE `motion_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producers` (
  `producer_id` int NOT NULL AUTO_INCREMENT,
  `motion_id` int NOT NULL,
  `rating_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`producer_id`),
  KEY `FK_producerrating` (`rating_id`),
  KEY `FK_motionproducer` (`motion_id`),
  CONSTRAINT `FK_motionproducer` FOREIGN KEY (`motion_id`) REFERENCES `motion_media` (`motion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_producerrating` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,1,1,'King Vidor'),(2,2,2,'Baz Luhrmann'),(3,3,NULL,'John Huston'),(4,4,4,'Gary Ross'),(5,5,5,'Chris Columbus'),(6,6,6,'Peter Jackson'),(7,7,7,NULL),(8,8,8,'Michael Radford'),(9,9,NULL,NULL),(10,10,10,NULL);
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating_number` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `FK_ratingforreview` (`review_id`),
  KEY `FK_userrating` (`user_id`),
  CONSTRAINT `FK_ratingforreview` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userrating` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,1,5),(2,2,1,5),(3,3,2,4),(4,4,2,5),(5,5,2,4),(6,6,2,5),(7,7,3,4),(8,8,6,5),(9,9,9,5),(10,10,9,1);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `review_summary` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `FK_bookreview` (`book_id`),
  KEY `FK_userreview` (`user_id`),
  CONSTRAINT `FK_bookreview` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_userreview` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'Warts and Pepperoni by Leo Toystory is probably my favorite novel of all time, the characters were displayed so beautifully and sexy that my hand got a workout as I was reading. My top 5 favorites moments were hard to rank but when Mario got his man part stuck in the forklift it really provided for a good Segway into Rosa Parks high school graduation speech. The emotions I felt towards Patrick Star when he went skydiving naked really shivered my timbers in a manner that isn’t even comparable to when Nemo and Barry B Benson went to trial for vehicular manslaughter towards the elderly women who lived a life of jellybean and gummy worm snorting addiction. These events really got me down in the dumps but probably the best event I can recall was when Mr Krabs bought a run down and decrepit dungeon where he kid his Israeli orphans, he taught them ancient forms of botany and native Americans chicken dueling techniques, For the naked mma fight against Voldemort and his army of neglected animals. All of these events made for a wonderful story that changed my perspective on Modern day prostitution and workouts routines, I hope people reading this review find it relatable and totally relevant to the story'),(2,2,1,'This book was fantastic. Truly, utterly fantastic. It’s literary gold.There’s something so fascinating about old English and classics. They’re written with such profound emotion and professionalism. If you’re looking for a book that’ll really have you reeled in, look no further. If I was too explain why this is such a great book, I’d be here forever. That is how much I enjoyed it. The plot is fabulous, the odd and mysterious man of riches, Jay Gatsby, and his time in one gorgeous Long Island summer on the Gold Coast, falling in love with a long lost lover, a beautiful part of his past. There’s so much allusion in this book, the characters are so unique, the plot will really have you up in arms. If you want a classy, short but blissful read, this book IS for you. Ps: Do not watch the movie. It seriously does the book so much injustice'),(3,1,2,'Leo Tolstoy has masterfully depicted the pathetic reality of wars. The descriptions of the sufferings, wounds and casualties are emotionally provoking. He made the story turn from pleasure to patriotism, luxury to bravery, aristocracy to extremity. The picturesque beauty of love and life fill the readers heart with fresh blossoming buds of hope and divine goodness. The characters learn from the merry  as well as bitter experiences of life in peace and during wars. The translation that I read (by Louise and Aylmer Maude) has successfully borne Tolstoys understanding of the different shades of life and history.In short, War and Peace, with its short chapters, lucid narrative, merry ideas, attractive character building capacity, and educational values is an interesting read and I would advise this timeless novel to any regular reader.'),(4,4,2,'The Hunger Games is no question the absolute greatest book of all time. I am 21 years old and when I finished this book I couldnt help but immediately start the next. Its packed with action, romance, emotion, and so much more. And every time you feel ready to put down the book, something happens and you just have to keep reading! Not to mention all of the characters personalities are wonderfully laid out. Katniss is such an amazing role model too! She reflects so much determination, passion, courage, and love. I highly suggest that if you havent read this book that you immediately open up amazon and order it. You wont regret it!'),(5,5,2,'I think the book is super. From my point of view, it is incredible how the author created such a marvelous nobel. I never realy liked Greek gods and all that stuff, but now, i cant spend a day without thinking about Artemis or Hades or all the other gods.  I also love the fact that as Percy is the one telling the story, and that he is 12 in the first book, just like me, it made like another BOOM, because im reading something another 12 years old boy would have, so i completly got it the way he describes everything. In resume, i loved the story, the characters (Clarisse in particular), and the mesage it lives. I super recomend it. At least, give it a try.'),(6,6,2,'The Hobbit is a fantasy book about an introverted Hobbit that goes on an large adventure with Gandalf the wizard and 13 dwarves. Bilbo the Hobbit goes involuntary on the adventure to kill and steal gold from Smaug the dragon. I personally really enjoyed the book, I typically didnt believe that I was going to enjoy it, due to the amount of mythical creatures that appear in the book, but I was surprised. J.R.R Tolkien uses almost all the language features, which makes you want to read more. I also really love the moral. (You dont have to be special/brave to go on big adventures.) Although this book was made in 1937, its still a classic. Definitely recommend it.'),(7,7,3,'As per as a understood the book tells every reader that we must not run away from our destiny this book is full of ideas about life destiny, dreams ,goals. I would like to highly recommend to the people those who want the dreams to be chased by them. This book highly suggest that we should follow our heart and pursue our Dreams, aims and goals rather them listening to others around us what they like to do . I would like to to  stick to the point that we should follow our heart and pursue their career and desire. I would highly like to point out the fact that this is the first book which I have read and I am completely happy with this book and I want to recommend this book to all the beginners who wanted want to read just start reading and there will be one time that you cant stop  reading  other books this book language is so easy that beginners can thoroughly read this book the favourite LINE which I like the most in this book is \"everyone seems to have a clear idea of how other people should lead their lives but none about his or her own.....\"'),(8,8,6,'This book is by far one of the best books ever written. Overall, 1984 conceptualises a future which is gloomy, sad and controlling. It is a classic book and will forever be timeless and relevant as it correctly reflects our world today in many aspects; for that reason those who are interested in relevant discussions regarding censorship, power, control and authoritarianism, should very much read this book - just for its political analysis alone even.'),(9,4,9,'This book, along with the others in the series, have truly taken my breath away. The Hunger Games is definitely my favourite book I’ve ever read (and I read a lot of books). I loved it so much I read the whole series twice in less than 2 weeks. I’m planning on reading them again at least 3 more times. I highly recommend these books! 5 Stars for sure'),(10,10,9,'I was forced to read this book and it felt like a personal attack on my mental health. The book does not have and plot or character development but instead, a whiny teenager who complains about everything and whose vocabulary is limited to \"Phony\" \"fake\" and \"Hate\". The whole book is a miserable compilation of Holden wandering aimlessly around New York while being extremely negative about everything and everyone. It got to the point where I legitimately considered burning the book and getting a 0 on my assignment. I cannot even begin to imagine reading this book voluntarily. The author of this book must have Schizophrenia, Dementia, or Alzheimers possibly even a combination of all three. This book has no meaning or purpose and I was more interested in the grass growing in my backyard than the character development of this book. Books like this make me wish I could rate it less than 1 star. Somehow this book reviewed good criticism from popular critics and the only explanation I can provide is that they got so bored reading this book that they simply didnt finish it and assume it got better at some point or they simply quit rather than having to read this absolute disgrace of a \"book\". If it was shorter and portrayed as a comedy then I would think that this author went overboard making it bad for the joke. This book alone was the driving factor in abandoning all dreams and hopes I had in pursuing a career in the literary field. The only way this book was published was by accident.');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `summary`
--

DROP TABLE IF EXISTS `summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `summary` (
  `summary_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `summary_text` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`summary_id`),
  KEY `FK_booksummary` (`book_id`),
  CONSTRAINT `FK_booksummary` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `summary`
--

LOCK TABLES `summary` WRITE;
/*!40000 ALTER TABLE `summary` DISABLE KEYS */;
INSERT INTO `summary` VALUES (1,1,'War and Peace broadly focuses on Napoleon’s invasion of Russia in 1812 and follows three of the most well-known characters in literature: Pierre Bezukhov, the illegitimate son of a count who is fighting for his inheritance and yearning for spiritual fulfillment; Prince Andrei Bolkonsky, who leaves his family behind to fight in the war against Napoleon; and Natasha Rostov, the beautiful young daughter of a nobleman who intrigues both men.A s Napoleon’s army invades, Tolstoy brilliantly follows characters from diverse backgrounds—peasants and nobility, civilians and soldiers—as they struggle with the problems unique to their era, their history, and their culture. And as the novel progresses, these characters transcend their specificity, becoming some of the most moving—and human—figures in world literature.'),(2,2,'This classic work encapsulating the decadence and excess of the 1920s “Jazz Age” follows the unassuming Nick Carraway on his search for the American Dream, which leads him to the doorstep of Jay Gatsby, an enigmatic millionaire known for both his lavish parties and his undying love for Nick’s cousin, the married Daisy Buchanan. With a mixture of envy and dismay, Nick observes Gatsby and his flamboyant life in the Long Island town of West Egg, while Gatsby yearns for Daisy and all that shimmers across the Sound in East Egg. The result is a chronicle of the drama and deceit that swirl around the lives of the wealthy, which cemented Fitzgerals’s reputation as the voice of his generation.'),(3,3,'First published in 1851, Herman Melville’s masterpiece is, in Elizabeth Hardwick’s words, “the greatest novel in American literature.” The saga of Captain Ahab and his monomaniacal pursuit of the white whale remains a peerless adventure story but one full of mythic grandeur, poetic majesty, and symbolic power. Filtered through the consciousness of the novel’s narrator, Ishmael, Moby-Dick draws us into a universe full of fascinating characters and stories, from the noble cannibal Queequeg to the natural history of whales, while reaching existential depths that excite debate and contemplation to this day.'),(4,4,'During the annual “reaping” in the post-apocalyptic nation of Panem, one male and one female child aged between 12 and 18 are chosen as tributes for The Hunger Games. In the 74th edition of the Hunger Games, Katniss Everdeen, a young self-sufficient 16-year-old girl offers herself as a tribute from District 12 in place of her younger sister, Primrose. Peeta Mellark, a boy who went to school with Katniss is chosen as the male tribute. Katniss and Peeta make their way to the Capitol, where the Games are always held. They try to make themselves presentable with the help of various stylists and advisors – to gain sponsors during the Games for food and tools for survival. During the Games, Katniss and Peeta undergo several chilling trials in their attempt to stay alive. They end up winning the hearts of the public as “star-crossed lovers” but the oppressive Capitol is not too happy when they begin rebelling.'),(5,5,'Twelve-year-old Percy Jackson is about to be kicked out of boarding school . . . again. No matter how hard he tries, he can’t seem to stay out of trouble. But can he really be expected to stand by and watch while a bully picks on his scrawny best friend? Or not defend himself against his pre-algebra teacher when she turns into a monster and tries to kill him? Of course, no one believes Percy about the monster incident; he’s not even sure he believes himself. Until the Minotaur chases him to summer camp. Suddenly, mythical creatures seem to be walking straight out of the pages of Percy’s Greek mythology textbook and into his life. The gods of Mount Olympus, he’s coming to realize, are very much alive in the twenty-first century. And worse, he’s angered a few of them: Zeus’s master lightning bolt has been stolen, and Percy is the prime suspect. Now Percy has just ten days to find and return Zeus’s stolen property, and bring peace to a warring Mount Olympus. On a daring road trip from their summer camp in New York to the gates of the Underworld in Los Angeles, Percy and his friends–one a satyr and the other the demigod daughter of Athena–will face a host of enemies determined to stop them. To succeed on his quest, Percy will have to do more than catch the true thief: he must come to terms with the father who abandoned him; solve the riddle of the Oracle, which warns him of failure and betrayal by a friend; and unravel a treachery more powerful than the gods themselves.'),(6,6,'When Thorin Oakenshield and his band of dwarves embark upon a dangerous quest to reclaim the hoard of gold stolen from them by the evil dragon Smaug, Gandalf the wizard suggests an unlikely accomplice: Bilbo Baggins, an unassuming Hobbit dwelling in peaceful Hobbiton. Along the way, the company faces trolls, goblins, giant spiders, and worse. But as they journey from the wonders of Rivendell to the terrors of Mirkwood and beyond, Bilbo will find that there is more to him than anyone—himself included—ever dreamed. Unexpected qualities of courage and cunning, and a love of adventure, propel Bilbo toward his great destiny . . . a destiny that waits in the dark caverns beneath the Misty Mountains, where a twisted creature known as Gollum jealously guards a precious magic ring.'),(7,7,'On an upper floor of a plush, high-security building on Central Park West, an elegant man sits in the office of Dr. Anne Kramer, confessing to the heinous murder that has horrified the modern world. Randolf Sontime is renowned for his personal charm, and Dr. Kramer is fighting to keep from falling victim to it. For the first time in her life, she truly understands the meaning of the word “charisma.” Not knowing that her own destiny is irrevocably tied to his, Anne Kramer listens to the story of Sontime’s life. “It began with the magic, you see. And so, perforce, must I.” As a boy named Han at the House of Ra, an isolated oasis in the Egyptian desert of a far ancient time, Sontime lived in privilege. There the chosen were trained in the science of alchemy–magic, philosophy, miracles. Only two other initiates were as skilled as he: Akan, quiet and studious, a boy whose thirst for knowledge was matched only by his hunger for truth; and Nefar, beautiful and brilliant, a girl as filled with wonder and unfathomable ambition as Han himself. Together they discovered that in union, theirs was a power unmatched in the physical world. But even in the House of Ra, there were boundaries to be observed, knowledge that only the masters understood and feared. As the threesome’s thirst for answers–and for each other–deepened, they were tempted by the dark arts that they had sworn to avoid. “Look at three magnificent youths who stand astride your world and scoff at the rules you must obey. . . . Look at us, and call us gods.” Their power was palpable, their desire total–until the fateful moment when their alliance was forever damned, their gifts horribly corrupted. A seductive work that seethes with mystery and passion, The Alchemist hurtles readers back through time to an era when magic was sacred and the workings of the world lay in the hands of a few gifted, but tortured souls. In a stunning feat of unbridled imagination, Donna Boyd has created her most hypnotic novel to date.'),(8,8,'“The Party told you to reject the evidence of your eyes and ears. It was their final, most essential command.” Winston Smith toes the Party line, rewriting history to satisfy the demands of the Ministry of Truth. With each lie he writes, Winston grows to hate the Party that seeks power for its own sake and persecutes those who dare to commit thoughtcrimes. But as he starts to think for himself, Winston can’t escape the fact that Big Brother is always watching… A startling and haunting vision of the world, 1984 is so powerful that it is completely convincing from start to finish. No one can deny the influence of this novel, its hold on the imaginations of multiple generations of readers, or the resiliency of its admonitions—a legacy that seems only to grow with the passage of time.'),(9,9,'No matter your goals, Atomic Habits offers a proven framework for improving–every day. James Clear, one of the world’s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results. Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits–whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal.'),(10,10,'When The Catcher in the Rye begins, Holden Caulfield has just been expelled from another prep school with failing grades. Anger at his roommate causes him to storm out of the school early and travel home without telling anyone. In Manhattan, he drifts from place to place. He encounters people from his past, some of whom he can hardly stand, others who can’t stand him. These include his wise young sister, a prostitute and her pimp, and a past girlfriend. Through these interactions, Holden’s opinion about the world and its people is fleshed out. His anger with life and his role becomes quite clear, and he expresses a desire to run away from his life entirely.');
/*!40000 ALTER TABLE `summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Patrick Daley',22,'p_daley','password123'),(2,'Gauri Sarin',21,'g_sarin','password321'),(3,'Bolu Ojuko',21,'b_ojuko','login'),(4,'Patrick Star',NULL,'p_star','rock'),(5,'Sandy Cheeks',NULL,'s_cheeks','texas'),(6,'Jimmy Neutron',NULL,'j_neutron','smart'),(7,'Timmy Turner',NULL,'t_turner','magic'),(8,NULL,NULL,'octopus789','ocean'),(9,NULL,NULL,'bookfan1','reading'),(10,NULL,NULL,'anonymous','anon');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 15:45:25

#SELECT * FROM user;
DROP PROCEDURE IF EXISTS checkUser;
DELIMITER $$
CREATE PROCEDURE checkUser(IN username VARCHAR(64), IN password VARCHAR(64))
BEGIN
	SELECT COUNT(*)
    FROM user
    WHERE (user.username = username) AND (user.password = password);
END$$
DELIMITER ;
#CALL checkUser("jim","pass");
#CALL checkUser("p_daley","password123");
#CALL checkUser("p_daley","pass");
#CALL checkUser("jim","password123");

DROP PROCEDURE IF EXISTS addUser;
DELIMITER $$
CREATE PROCEDURE addUser(IN username VARCHAR(64), IN password VARCHAR(64), IN name VARCHAR(64), IN age INT)
BEGIN
	INSERT INTO user (user.username,user.password,user.name,user.age) 
    VALUES(username, password, name, age);
END$$
DELIMITER ;

#SELECT * FROM user;
#CALL addUser('jim','jimpass','jimmy',22);
#SELECT * FROM user;

DROP PROCEDURE IF EXISTS getReviewsBy;
DELIMITER $$
CREATE PROCEDURE getReviewsBy(
IN username VARCHAR(64)
)
BEGIN
	SELECT book.title, review.review_summary
	FROM review
	INNER JOIN user ON user.user_id = review.user_id
    INNER JOIN book ON review.book_id = book.book_id
	WHERE user.username = username;
END$$
DELIMITER ;
#CALL getReviewsBy('p_daley');
#CALL getReviewsBy('g_sarin');

DROP PROCEDURE IF EXISTS getSummary;
DROP PROCEDURE IF EXISTS createReview;
DROP PROCEDURE IF EXISTS updateFavBook;
DROP PROCEDURE IF EXISTS deleteReview;

#Read procedure to get a book summary 
DELIMITER //
CREATE PROCEDURE getSummary 
(
IN book_title VARCHAR(64)
)
BEGIN
SELECT * 
FROM  (SELECT `title` as title,`summary_text` as summary 
FROM `summary` 
INNER JOIN `book` 
ON `summary`.`book_id` = `book`.`book_id` 
WHERE (`title` = book_title)) as summary_table;
END//
DELIMITER ;

#Tests for getSummary
#CALL getSummary('The Great Gatsby');
#CALL getSummary('The Hobbit');

#Creating Procedure to add a review

DELIMITER //
CREATE PROCEDURE createReview 
(
IN book_title VARCHAR(255),
IN user_name VARCHAR(255),
IN review_words VARCHAR(2000)
)
BEGIN
DECLARE user_id_num INT;
DECLARE book_id_num INT;
SELECT book_id INTO book_id_num FROM `book` where `title` = book_title;
SELECT user_id INTO user_id_num FROM `user` where `username`= user_name;
INSERT INTO `review` (`book_id`,`user_id`,`review_summary`)
VALUES(book_id_num, user_id_num, review_words);

END//
DELIMITER ;

#tests for createReview
#CALL createReview('The Great Gatsby', 'p_daley', 'good book');
#CALL createReview('The Lightning Thief', 'b_ojuko', 'Good read!');

#SELECT * FROM user;

#SELECT review_summary
#FROM review
#INNER JOIN user ON user.user_id = review.user_id
#WHERE user.username = 'p_daley';


#Creating procedure to update favorite_book table
DELIMITER //
CREATE PROCEDURE updateFavBook
(
IN book_title VARCHAR(255),
IN user_name VARCHAR(255)
)
BEGIN
DECLARE book_id_num INT;
DECLARE user_id_num INT;
SELECT book_id INTO book_id_num FROM `book` where `title` = book_title;
SELECT user_id INTO user_id_num FROM `user` where `username`= user_name;
UPDATE `favorite_book` set book_id = book_id_num WHERE user_id = user_id_num;
END//
DELIMITER ;
#tests for updateFavBook
#CALL updateFavBook('The Alchemist', 'b_ojuko');
#CALL updateFavBook('War and Peace', 'j_neutron');
#SELECT * FROM `favorite_book`

#Creating procedure to delete from review table

DELIMITER //
CREATE PROCEDURE deleteReview 
(
IN book_title VARCHAR(255),
IN user_name VARCHAR(255)
)
BEGIN
DECLARE user_id_num INT;
DECLARE book_id_num INT;
SELECT book_id INTO book_id_num FROM `book` where `title` = book_title;
SELECT user_id INTO user_id_num FROM `user` where `username`= user_name;
DELETE from `review` WHERE book_id_num = book_id AND user_id_num = user_id;

END//
DELIMITER ;

#tests for deleteReview
#CALL deleteReview('The Great Gatsby', 'p_daley');
#CALL deleteReview('The Lightning Thief', 'b_ojuko');

#SELECT * FROM `review`;

#CHECK USER-------------------------------------------------------------------------------------------
#SELECT * FROM user;
DROP PROCEDURE IF EXISTS checkUser;
DELIMITER $$
CREATE PROCEDURE checkUser(IN username VARCHAR(64), IN password VARCHAR(64))
BEGIN
	SELECT COUNT(*)
    FROM user
    WHERE (user.username = username) AND (user.password = password);
END$$
DELIMITER ;
#CALL checkUser("jim","pass");
#CALL checkUser("p_daley","password123");
#CALL checkUser("p_daley","pass");
#CALL checkUser("jim","password123");

#ADD USER-------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS addUser;
DELIMITER $$
CREATE PROCEDURE addUser(IN username VARCHAR(64), IN password VARCHAR(64), IN name VARCHAR(64), IN age INT)
BEGIN
	INSERT INTO user (user.username,user.password,user.name,user.age) 
    VALUES(username, password, name, age);
END$$
DELIMITER ;

#SELECT * FROM user;
#CALL addUser('jim','jimpass','jimmy',22);
#SELECT * FROM user;
#GET REVIEWS BY-------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getReviewsBy;
DELIMITER $$
CREATE PROCEDURE getReviewsBy(
IN username VARCHAR(64)
)
BEGIN
	SELECT book.title, review.review_summary
	FROM review
	INNER JOIN user ON user.user_id = review.user_id
    INNER JOIN book ON review.book_id = book.book_id
	WHERE user.username = username;
END$$
DELIMITER ;
#CALL getReviewsBy('p_daley');
#CALL getReviewsBy('g_sarin');

#SELECT * FROM motion_media
#INNER JOIN book ON book.book_id = motion_media.book_id;
#DELETE MOTIONMEDIA-------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS deleteMotionMedia;
DELIMITER $$
CREATE PROCEDURE deleteMotionMedia(
IN book_title VARCHAR(64)
)
BEGIN
	DECLARE book_id_num INT;
	SELECT book_id INTO book_id_num FROM `book` where `title` = book_title;
	DELETE FROM `motion_media` WHERE book_id_num = book_id;
END$$
DELIMITER ;
#CALL deleteMotionMedia('The Great Gatsby');
#CALL deleteMotionMedia('War and Peace');

#SELECT * from motion_media;
#CREATE MOTIONMEDIA-------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS createMotionMedia;
DELIMITER $$
CREATE PROCEDURE createMotionMedia
(
IN book_title VARCHAR(255),
IN actors VARCHAR(2000)
)
BEGIN
DECLARE user_id_num INT;
DECLARE book_id_num INT;
SELECT book_id INTO book_id_num FROM `book` where `title` = book_title;
INSERT INTO `motion_media` (`book_id`,`if_exists`,`actors`)
VALUES(book_id_num, 1, actors);

END$$
DELIMITER ;

#CALL createMotionMedia('War and Peace','Leo');

#SELECT * FROM motion_media; 
#SELECT * FROM rating;
#SELECT * FROM review;
#SELECT book.title, AVG(rating.rating_number) AS Average_Rating FROM rating
#INNER JOIN review ON rating.review_id = review.review_id
#INNER JOIN book ON review.book_id = book.book_id
#GROUP BY book.title
#ORDER BY Average_Rating DESC LIMIT 5;
 
#READ TOP FIVE -------------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS getTopFive;
DELIMITER $$
CREATE PROCEDURE getTopFive()
BEGIN
	SELECT book.title, AVG(rating.rating_number) AS Average_Rating FROM rating
	INNER JOIN review ON rating.review_id = review.review_id
	INNER JOIN book ON review.book_id = book.book_id
	GROUP BY book.title
	ORDER BY Average_Rating DESC LIMIT 5;
END$$
DELIMITER ;

#CALL getTopFive();
#UPDATE RATING -------------------------------------------------------------------------------------------
#select * from rating;
DROP PROCEDURE IF EXISTS updateRating;
DELIMITER $$
CREATE PROCEDURE updateRating
(
IN book_title VARCHAR(255),
IN new_rating FLOAT,
IN user_name VARCHAR(255)
)
BEGIN
DECLARE review_id_num INT;
DECLARE user_id_num INT;
DECLARE book_id_num INT;
SELECT book_id INTO book_id_num FROM `book` where `title` = book_title;
SELECT user_id INTO user_id_num FROM `user` where `username` = user_name;
SELECT review_id INTO review_id_num FROM `review` where `book_id` = book_id_num AND user_id_num = user_id;
UPDATE `rating` set rating_number = new_rating WHERE review_id = review_id_num;
END$$
DELIMITER ;

#select * from rating;

#CALL updateRating('The Hunger Games', 8, 'g_sarin');

#select * 
#from review
#INNER JOIN user ON review.user_id = user.user_id
#INNER JOIN rating ON rating.review_id = review.review_id;

#select * from rating;
#GET ALL BOOKS BY AUTHOR -------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS getAllBooksByAuthor;
DELIMITER $$
CREATE PROCEDURE getAllBooksByAuthor(IN name_v varchar(255))
BEGIN
SELECT b.*, a.name FROM book as b join author as a 
on b.book_id = a.book_id
WHERE name = name_v;
END $$
DELIMITER ;

#CALL getAllBooksByAuthor('Suzanne Collins');