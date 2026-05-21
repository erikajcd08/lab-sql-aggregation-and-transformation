SHOW DATABASES;
USE sakila;

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration
FROM film;

SELECT 
    FLOOR(AVG(length) / 60) AS avg_hours,
    FLOOR(AVG(length) % 60) AS avg_minutes
FROM film;

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS earliest_date
FROM rental;

SELECT 
    *,
    MONTH(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT 
    *,
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM rental
LIMIT 20;

SELECT title, IFNULL(rental_duration, 'Not Available') AS null_replace
FROM film
ORDER BY title ASC;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    LEFT(email, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC;

SELECT COUNT(*) AS total_films FROM film;

SELECT rating, COUNT(*) AS total_films 
FROM film
GROUP BY rating;

SELECT rating, COUNT(*) AS total_films 
FROM film
GROUP BY rating
ORDER BY total_films DESC;

SELECT 
    rating,
    ROUND(AVG(length), 2) AS film_duration
FROM film
GROUP BY rating
ORDER BY film_duration DESC;

SELECT 
    rating,
    ROUND(AVG(length), 2) AS film_duration
FROM film
GROUP BY rating
HAVING AVG(length)>120
ORDER BY film_duration DESC;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;
