USE project_movie_database;

SELECT * FROM movies;

SELECT * FROM directors;

SELECT COUNT(*) AS total_movies
FROM movies;

SELECT *
FROM directors
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

SELECT *
FROM directors
WHERE name LIKE 'S%';

SELECT COUNT(*) AS female_directors
FROM directors
WHERE gender = 1;

SELECT *
FROM directors
WHERE gender = 1
LIMIT 10;

SELECT original_title, popularity
FROM movies
ORDER BY popularity DESC
LIMIT 3;

SELECT original_title, revenue, budget,
       (revenue - budget) AS profit
FROM movies
ORDER BY profit DESC
LIMIT 3;

SELECT original_title, vote_average, release_date
FROM movies
WHERE release_date >= '2000-01-01'
ORDER BY vote_average DESC
LIMIT 1;

SELECT m.original_title
FROM movies m
JOIN directors d
ON m.id = d.id
WHERE d.name = 'Brenda Chapman';

SELECT d.name, COUNT(*) AS total_movies
FROM movies m
JOIN directors d
ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_movies DESC
LIMIT 1;

SELECT d.name,
       SUM(m.revenue - m.budget) AS total_profit
FROM movies m
JOIN directors d
ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_profit DESC
LIMIT 1;