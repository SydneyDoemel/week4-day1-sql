--1. How many actors are there with the last name ‘Wahlberg’?
-- 2
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
-- 4764
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- film_id=200 (store has 9 copies)
SELECT COUNT(film_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- name of film is 'Curtain Videotape'
SELECT film_id, title
FROM film
WHERE film_id = 200;


-- 4. How many customers have the last name ‘William’?
-- 0
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- staff id = 1
SELECT COUNT(staff_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;


-- 6. How many different district names are there?
-- 378
SELECT COUNT(DISTINCT district)
FROM address;


7. What film has the most actors in it? (use film_actor table and get film_id)
-- film_id= 508
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id)DESC;



-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 13
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
AND store_id = 1;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 3
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250;
-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
-- 5 categories
SELECT COUNT(DISTINCT rating)
FROM film;
-- PG-13
SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;