USE bookreviewdatabase;
#CHECK USER-------------------------------------------------------------------------------------------
SELECT * FROM user;
DROP PROCEDURE IF EXISTS checkUser;
DELIMITER $$
CREATE PROCEDURE checkUser(IN username VARCHAR(64), IN password VARCHAR(64))
BEGIN
	SELECT COUNT(*)
    FROM user
    WHERE (user.username = username) AND (user.password = password);
END$$
DELIMITER ;
CALL checkUser("jim","pass");
CALL checkUser("p_daley","password123");
CALL checkUser("p_daley","pass");
CALL checkUser("jim","password123");

#ADD USER-------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS addUser;
DELIMITER $$
CREATE PROCEDURE addUser(IN username VARCHAR(64), IN password VARCHAR(64), IN name VARCHAR(64), IN age INT)
BEGIN
	INSERT INTO user (user.username,user.password,user.name,user.age) 
    VALUES(username, password, name, age);
END$$
DELIMITER ;

SELECT * FROM user;
CALL addUser('jim','jimpass','jimmy',22);
SELECT * FROM user;
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
CALL getReviewsBy('p_daley');
CALL getReviewsBy('g_sarin');

SELECT * FROM motion_media
INNER JOIN book ON book.book_id = motion_media.book_id;
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
CALL deleteMotionMedia('The Great Gatsby');
CALL deleteMotionMedia('War and Peace');

SELECT * from motion_media;
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

CALL createMotionMedia('War and Peace','Leo');

SELECT * FROM motion_media; 
SELECT * FROM rating;
SELECT * FROM review;
SELECT book.title, AVG(rating.rating_number) AS Average_Rating FROM rating
INNER JOIN review ON rating.review_id = review.review_id
INNER JOIN book ON review.book_id = book.book_id
GROUP BY book.title
ORDER BY Average_Rating DESC LIMIT 5;
 
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

CALL getTopFive();
#UPDATE RATING -------------------------------------------------------------------------------------------
select * from rating;
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

select * from rating;

CALL updateRating('The Hunger Games', 8, 'g_sarin');

select * 
from review
INNER JOIN user ON review.user_id = user.user_id
INNER JOIN rating ON rating.review_id = review.review_id;

select * from rating;
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

CALL getAllBooksByAuthor('Suzanne Collins');