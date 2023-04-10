CREATE DATABASE  IF NOT EXISTS `BookReviewDatabase`;
USE `BookReviewDatabase`;

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`(
`book_id` int not null,
`title` varchar (255),
`length` int not null, 
primary key (`book_id`)
);

DROP TABLE IF EXISTS `summary`;
CREATE TABLE `summary`(
`summary_id` int not null, 
`book_id` int not null,
`summary_text` varchar (2000), 
primary key (`summary_id`),
CONSTRAINT `FK_booksummary` FOREIGN KEY (`book_id`) REFERENCES `book` 
(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre`(
`genre_id` int not null, 
`book_id` int not null,
`genre_type` varchar (2000), 
primary key (`genre_id`),
CONSTRAINT `FK_bookgenre` FOREIGN KEY (`book_id`) REFERENCES `book` 
(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`(
`user_id` int not null,
`name` varchar (255),
`age` int not null,
`username` varchar (255),
`password` varchar (255),
primary key (`user_id`)
);

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`(
`review_id` int not null, 
`book_id` int not null,
`user_id` int not null,
`review_summary` varchar (2000), 
primary key (`review_id`),
CONSTRAINT `FK_bookreview` FOREIGN KEY (`book_id`) REFERENCES `book` 
(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_userreview` FOREIGN KEY (`user_id`) REFERENCES `user` 
(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating`(
`rating_id` int not null, 
`review_id` int not null,
`user_id` int not null,
`rating_number` int not null, 
primary key (`rating_id`),
CONSTRAINT `FK_ratingforreview` FOREIGN KEY (`review_id`) REFERENCES `review` 
(`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_userrating` FOREIGN KEY (`user_id`) REFERENCES `user` 
(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`(
`author_id` int not null, 
`rating_id` int not null,
`book_id` int not null,
`name` varchar (255), 
primary key (`author_id`),
CONSTRAINT `FK_authorrating` FOREIGN KEY (`rating_id`) REFERENCES `rating` 
(`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_bookauthor` FOREIGN KEY (`book_id`) REFERENCES `book` 
(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

/*
got confused making this table so please fix if it is wrong.
*/
DROP TABLE IF EXISTS `favorite_book`;
CREATE TABLE `favorite_book`(
`user_id` int not null,
`book_id` int not null,
CONSTRAINT `FK_favbook` FOREIGN KEY (`book_id`) REFERENCES `book` 
(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_user` FOREIGN KEY (`user_id`) REFERENCES `user` 
(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `motion_media`;
CREATE TABLE `motion_media`(
`motion_id` int not null, 
`book_id` int not null,
`if_exists` boolean,
`actors` varchar (2000), 
primary key (`motion_id`),
CONSTRAINT `FK_bookmotion` FOREIGN KEY (`book_id`) REFERENCES `book` 
(`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `producers`;
CREATE TABLE `producers`(
`producer_id` int not null, 
`motion_id` int not null, 
`rating_id` int not null,
`name` varchar(255),
primary key (`producer_id`),
CONSTRAINT `FK_producerrating` FOREIGN KEY (`rating_id`) REFERENCES `rating` 
(`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_motionproducer` FOREIGN KEY (`motion_id`) REFERENCES `motion_media` 
(`motion_id`) ON DELETE CASCADE ON UPDATE CASCADE
);












