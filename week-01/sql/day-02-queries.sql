-- Day 2 - Basic PostgreSQL queries

SELECT COUNT(*) FROM films;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM rentals;

SELECT * FROM films LIMIT 10;

SELECT title, category, rental_rate
FROM films
WHERE rental_rate > 4
ORDER BY rental_rate DESC
LIMIT 10;

SELECT c.city, COUNT(r.rental_id) AS rental_count
FROM customers c
JOIN rentals r ON c.customer_id = r.customer_id
GROUP BY c.city
ORDER BY rental_count DESC;

-- Deliberately inefficient query for Day 3
SELECT *
FROM films
WHERE title ILIKE '%99%';

-- Deliberately join-heavy query for Day 3
SELECT c.first_name, c.last_name, f.title, r.rented_at, r.amount
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN films f ON r.film_id = f.film_id
WHERE c.city = 'Brisbane'
ORDER BY r.rented_at DESC;
