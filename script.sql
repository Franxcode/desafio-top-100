-- USE below structure to execute, make sure to change "user" by your database user.
-- psql < script.sql -U "user"

-- DROP DATABASE peliculas.
DROP DATABASE peliculas;

-- CREATE DATABASE peliculas.
CREATE DATABASE peliculas;

-- Connect to database peliculas.
\c peliculas

-- CREATE TABLE peliculas.
-- Campos: id, Pelicula, Año estreno, Director.
CREATE TABLE peliculas(
    id SERIAL PRIMARY KEY,
    pelicula VARCHAR(255),
    ano_estreno VARCHAR(4),
    director VARCHAR(64)
);

-- LOAD INFORMATION FROM peliculas.csv TO TABLE peliculas.
\copy peliculas FROM 'peliculas.csv' csv header;

-- CREATE TABLE repartos.
-- Campos: id, actor
CREATE TABLE repartos(
    id_reparto INT,
    actor VARCHAR(64),
    FOREIGN KEY(id_reparto) REFERENCES peliculas(id)
);

-- LOAD INFORMATION FROM reparto.csv TO TABLE repartos.

\copy repartos FROM 'reparto.csv' csv header;

-- OBTAIN ID WHERE MOVIE IS TITANIC.
SELECT id, pelicula FROM peliculas WHERE pelicula='Titanic';

-- LIST ALL THE CAST ACTORS THAT APPEAR IN THE MOVIE TITANIC.
SELECT actor FROM repartos WHERE id_reparto=2;

-- GET THE TOTAL AMOUNT OF HOW MANY MOVIES DO HARRISON FORD PARTICIPATE.
SELECT COUNT(*) AS "Numero de peliculas del top 100 que participa Harrison Ford" FROM repartos WHERE actor='Harrison Ford';

-- LIST ALL THE MOVIES RELEASED BETWEEN 1990 AND 1999.
SELECT pelicula, ano_estreno FROM peliculas WHERE ano_estreno BETWEEN '1990' AND '1999' ORDER BY ano_estreno DESC;

-- PERFORM A QUERY THAT SHOWS THE MOVIE TITLES LENGTH, AND MAKE IT APPEAR AS 'LONGITUD_TITULO'.
SELECT pelicula, LENGTH(pelicula) AS "longitud_titulo" FROM peliculas ORDER BY "longitud_titulo" DESC;

-- PERFORM A QUERY THAT SHOWS WHAT IS THE LONGEST MOVIE TITLE IN ALL THE TOP 100 MOVIE LIST.
SELECT MAX(LENGTH(pelicula)) AS "Longitud mas grande entre todos los titulos" FROM peliculas;