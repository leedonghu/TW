use tw;
CREATE TABLE MOVIE_INFO
(
movie_name VARCHAR(50),
movie_start_time VARCHAR(5),
movie_end_time VARCHAR(5),
hall_number int,
PRIMARY KEY(movie_name, hall_number, movie_start_time),
FOREIGN KEY (hall_number) REFERENCES theater_info(hall_number)

);
INSERT INTO movie_info
(movie_name, movie_start_time, movie_end_time, hall_number)
VALUES
("차트", "19:00", "21:06", 8);

select count(a.movie_name) cnt FROM (SELECT movie_name, count(movie_name) from movie_info GROUP BY movie_name) a;


SELECT GROUP_CONCAT(movie_start_time, ' ') as a FROM movie_info  where movie_name = '거미' and hall_number=7 ;
select count(a.movie_start_time) cnt FROM (SELECT movie_start_time, movie_name from movie_info where movie_name = '회전' GROUP BY hall_number) a;

SELECT movie_start_time, movie_name, hall_number from movie_info  where movie_name = '회전' ;
SELECT hall_number from movie_info  where movie_name = '회전' GROUP BY hall_number;

SELECT movie_start_time from movie_info WHERE movie_name = '회전' and hall_number = 5;

SELECT COUNT(*)
FROM information_schema.columns
WHERE table_name='movie_info';

SELECT * from movie_info where movie_name = '거미';
SELECT movie_name from movie_info GROUP BY movie_name;

UPDATE movie_info
set movie_end_time = "18:40"
WHERE movie_name = "회전" and movie_start_time = "16:45";