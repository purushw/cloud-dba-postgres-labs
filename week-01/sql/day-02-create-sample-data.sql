DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE films (
    film_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    category TEXT NOT NULL,
    rental_rate NUMERIC(4,2) NOT NULL,
    length_minutes INT NOT NULL,
    release_year INT NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    city TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    film_id INT NOT NULL REFERENCES films(film_id),
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    rented_at TIMESTAMP NOT NULL,
    returned_at TIMESTAMP,
    amount NUMERIC(5,2) NOT NULL
);

INSERT INTO films (title, category, rental_rate, length_minutes, release_year)
SELECT
    'Film ' || gs,
    (ARRAY['Action','Comedy','Drama','Sci-Fi','Documentary','Horror'])[floor(random() * 6 + 1)],
    (ARRAY[0.99, 2.99, 3.99, 4.99, 5.99])[floor(random() * 5 + 1)],
    floor(random() * 120 + 60)::int,
    floor(random() * 35 + 1990)::int
FROM generate_series(1, 10000) gs;

INSERT INTO customers (first_name, last_name, email, city)
SELECT
    'First' || gs,
    'Last' || gs,
    'customer' || gs || '@example.com',
    (ARRAY['Brisbane','Sydney','Melbourne','Perth','Adelaide','London','Madrid'])[floor(random() * 7 + 1)]
FROM generate_series(1, 5000) gs;

INSERT INTO rentals (film_id, customer_id, rented_at, returned_at, amount)
SELECT
    floor(random() * 10000 + 1)::int,
    floor(random() * 5000 + 1)::int,
    now() - (random() * interval '365 days'),
    now() - (random() * interval '300 days'),
    (random() * 20 + 1)::numeric(5,2)
FROM generate_series(1, 200000) gs;