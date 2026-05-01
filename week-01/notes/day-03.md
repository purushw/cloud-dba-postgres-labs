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

## Key learning

- B-tree indexes do not help with leading wildcard searches (ILIKE '%x%')
- Indexes are effective for:
  - equality filters (WHERE city = 'Brisbane')
  - joins (customer_id, film_id)
  - sorting (ORDER BY rented_at DESC with supporting index)
- EXPLAIN ANALYZE is used to validate assumptions, not guess performance

## Composite index experiment

Tested a composite index: `rentals(customer_id, rented_at DESC)` on the join query, expecting improved performance.

**Results:**
- Execution time varied between ~20–50ms across multiple runs
- No consistent improvement compared to single indexes
- Some runs were slower with the composite index
- Timing variance likely due to caching and PostgreSQL plan differences

**Key findings:**
- More indexes do not automatically improve performance
- PostgreSQL may choose a different (sometimes suboptimal) plan after an index is added
- Index effectiveness depends on query shape, data distribution, selectivity, and sort requirements
- Not all indexes provide repeatable improvements; some introduce overhead

**Takeaway:**
Adding indexes requires validation with EXPLAIN ANALYZE rather than assumption. Performance decisions must be data-driven.