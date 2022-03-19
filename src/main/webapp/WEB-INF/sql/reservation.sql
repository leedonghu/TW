use tw;
CREATE TABLE MOVIE_RESERVATION
(
userId VARCHAR(50),
movie_name VARCHAR(50),
movie_start_time VARCHAR(5),
movie_end_time VARCHAR(5),
hall_number int,
seat_number VARCHAR(5),
FOREIGN KEY(userId) REFERENCES USER (userId)
);


SELECT * FROM movie_reservation;
DESC user;