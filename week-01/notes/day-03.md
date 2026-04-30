# Day 3 - EXPLAIN ANALYZE and indexes

## Goal
Understand how PostgreSQL executes queries before and after adding indexes.

## Queries tested
1. Pattern search on films.title using ILIKE '%99%'
2. Join query across rentals, customers, and films filtered by customer city

## Indexes added
- idx_customers_city on customers(city)
- idx_rentals_customer_id on rentals(customer_id)
- idx_rentals_film_id on rentals(film_id)
- idx_rentals_rented_at on rentals(rented_at DESC)

## Observations
- EXPLAIN ANALYZE shows the actual execution plan and timing.
- The ILIKE '%99%' query is not helped much by a normal B-tree index because the leading wildcard prevents efficient prefix lookup.
- The join query benefits more from indexes because PostgreSQL can filter and join using indexed columns.
- Indexes improve read performance but add overhead to writes and storage.

## Interview takeaway
I can use EXPLAIN ANALYZE to compare query behaviour before and after indexing, rather than guessing whether an index helps.
