USE `BookReviewDatabase`;
DROP PROCEDURE IF EXISTS getSummary;
DROP PROCEDURE IF EXISTS createReview;
DROP PROCEDURE IF EXISTS updateFavBook;
DROP PROCEDURE IF EXISTS deleteReview
GO











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
CALL getSummary('The Great Gatsby');
CALL getSummary('The Hobbit');

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
CALL createReview('The Great Gatsby', 'p_daley', 'good book');
CALL createReview('The Lightning Thief', 'b_ojuko', 'Good read!');


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

#tests for updateFavBook
CALL updateFavBook('The Alchemist', 'b_ojuko');
CALL updateFavBook('War and Peace', 'j_neutron');
SELECT * FROM `favorite_book`

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
CALL deleteReview('The Great Gatsby', 'p_daley');
CALL deleteReview('The Lightning Thief', 'b_ojuko');

SELECT * FROM `review`