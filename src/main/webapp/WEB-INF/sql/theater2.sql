use tw;
SELECT * FROM theater_info;
UPDATE theater_info
SET hall_size = 60
WHERE hall_number = 8;
SHOW COLUMNS FROM theater_info;