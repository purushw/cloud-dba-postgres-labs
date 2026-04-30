-- Sample DVD Rental Database
CREATE TABLE IF NOT EXISTS public.actor (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year SMALLINT,
    rental_duration SMALLINT DEFAULT 3,
    rental_rate NUMERIC(4,2) DEFAULT 4.99,
    length SMALLINT,
    replacement_cost NUMERIC(5,2) DEFAULT 19.99,
    rating VARCHAR(10),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.film_actor (
    actor_id INTEGER NOT NULL,
    film_id INTEGER NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

CREATE TABLE IF NOT EXISTS public.film_category (
    film_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Insert sample data
INSERT INTO actor (first_name, last_name) VALUES 
('Tom', 'Hanks'),
('Meryl', 'Streep'),
('Morgan', 'Freeman');

INSERT INTO category (name) VALUES 
('Action'),
('Comedy'),
('Drama');

INSERT INTO film (title, description, release_year, length, rating) VALUES 
('The Matrix', 'A computer hacker learns about the true nature of his reality', 1999, 136, 'R'),
('Forrest Gump', 'The presidencies of Kennedy and Johnson unfold through the perspective of an Alabama man', 1994, 142, 'PG-13'),
('Dune', 'Paul Atreides, a brilliant young man, must travel to the dangerous planet Dune', 2021, 155, 'PG-13');

INSERT INTO film_actor (actor_id, film_id) VALUES 
(1, 2),
(2, 1),
(3, 3);

INSERT INTO film_category (film_id, category_id) VALUES 
(1, 1),
(2, 2),
(3, 1);
