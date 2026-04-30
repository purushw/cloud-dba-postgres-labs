# Day 2 - Generate sample data and run queries

## Setup
Created a local synthetic DVD-style rental database.

## Tables
- films: 10,000 rows
- customers: 5,000 rows
- rentals: 200,000 rows

## Practised
- SELECT
- COUNT
- WHERE
- ORDER BY
- JOIN
- GROUP BY
- generated test data using generate_series()

## Notes
The sample data is synthetic but large enough to test query plans, indexing, joins, and performance behaviour.

I avoided using a tiny sample dataset because it would not be useful for EXPLAIN ANALYZE or indexing practice.
