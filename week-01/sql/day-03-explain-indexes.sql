-- Day 3 - EXPLAIN ANALYZE and indexes

-- 1. Baseline: inefficient pattern search
EXPLAIN ANALYZE
SELECT *
FROM films
WHERE title ILIKE '%99%';

-- 2. Baseline: city-based join query
EXPLAIN ANALYZE
SELECT c.first_name, c.last_name, f.title, r.rented_at, r.amount
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN films f ON r.film_id = f.film_id
WHERE c.city = 'Brisbane'
ORDER BY r.rented_at DESC;

-- 3. Add index for customer city filtering
CREATE INDEX idx_customers_city ON customers(city);

-- 4. Add index for rental customer joins
CREATE INDEX idx_rentals_customer_id ON rentals(customer_id);

-- 5. Add index for rental film joins
CREATE INDEX idx_rentals_film_id ON rentals(film_id);

-- 6. Add index for rental date sorting
CREATE INDEX idx_rentals_rented_at ON rentals(rented_at DESC);

-- 7. Re-test city-based join query
EXPLAIN ANALYZE
SELECT c.first_name, c.last_name, f.title, r.rented_at, r.amount
FROM rentals r
JOIN customers c ON r.customer_id = c.customer_id
JOIN films f ON r.film_id = f.film_id
WHERE c.city = 'Brisbane'
ORDER BY r.rented_at DESC;

-- 8. Inspect indexes
SELECT
    schemaname,
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename IN ('films', 'customers', 'rentals')
ORDER BY tablename, indexname;
