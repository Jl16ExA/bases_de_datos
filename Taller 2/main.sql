-- JUAN DAVID LOPEZ BECERRA

-- Punto 1 Cruzar estas tablas para encontrar las habilidades (en inglés) de cada Pokémon, y mostrar
-- el ID de la pokedex, el nombre del Pokémon y el nombre de la habilidad.
SELECT JLEON.POKEDEX.ID_P, JLEON.POKEDEX.IDENTIFIER_P, JLEON.ABILITY_NAMES.NAME_A AS HABILIDAD
FROM JLEON.POKEDEX 
JOIN JLEON.POKEDEX_2
ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME) AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER
JOIN JLEON.POKEMON_ABILITIES ON JLEON.POKEDEX.ID_P = JLEON.POKEMON_ABILITIES.POKEMON_ID
JOIN JLEON.ABILITY_NAMES ON JLEON.POKEMON_ABILITIES.ABILITY_ID = JLEON.ABILITY_NAMES.ABILITY_ID
JOIN JLEON.LANGUAJE ON JLEON.ABILITY_NAMES.LOCAL_LANGUAGE_ID = JLEON.LANGUAJE.ID WHERE JLEON.LANGUAJE.ISO639 = 'en'; 

-- Create View
CREATE VIEW T2_LOPEZ_JUAN_1 AS SELECT JLEON.POKEDEX.ID_P, JLEON.POKEDEX.IDENTIFIER_P, JLEON.ABILITY_NAMES.NAME_A AS HABILIDAD
FROM JLEON.POKEDEX 
JOIN JLEON.POKEDEX_2
ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME) AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER
JOIN JLEON.POKEMON_ABILITIES ON JLEON.POKEDEX.ID_P = JLEON.POKEMON_ABILITIES.POKEMON_ID
JOIN JLEON.ABILITY_NAMES ON JLEON.POKEMON_ABILITIES.ABILITY_ID = JLEON.ABILITY_NAMES.ABILITY_ID
JOIN JLEON.LANGUAJE ON JLEON.ABILITY_NAMES.LOCAL_LANGUAGE_ID = JLEON.LANGUAJE.ID WHERE JLEON.LANGUAJE.ISO639 = 'en'; 

-- Grant Permisson to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_1 TO JLEON;

-- Punto 2 Seleccione a todos los pokemon que estén en la pokedex1 y que NO estén en la pokedex2.
SELECT IDENTIFIER_P
FROM JLEON.POKEDEX 
LEFT JOIN JLEON.POKEDEX_2 
ON JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER 
WHERE JLEON.POKEDEX_2.POKEDEX_NUMBER IS NULL;

CREATE VIEW T2_LOPEZ_JUAN_2 AS SELECT IDENTIFIER_P
FROM JLEON.POKEDEX 
LEFT JOIN JLEON.POKEDEX_2 
ON JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER 
WHERE JLEON.POKEDEX_2.POKEDEX_NUMBER IS NULL;

-- Grant Access to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_2 TO JLEON;

-- OTHER WAY TO IMPLEMENT:

SELECT IDENTIFIER_P
FROM Jleon.pokedex
WHERE JLEON.POKEDEX.ID_P NOT IN (SELECT POKEDEX_NUMBER FROM Jleon.pokedex_2)

-- Punto 3 Seleccione las habilidades en japones de todos los pokemon que sean de la temporada 1 únicamente
SELECT JLEON.ABILITY_NAMES.NAME_A 
FROM JLEON.POKEDEX 
JOIN JLEON.POKEDEX_2
ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME) AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER
JOIN JLEON.POKEMON_ABILITIES ON JLEON.POKEDEX.ID_P = JLEON.POKEMON_ABILITIES.POKEMON_ID
JOIN JLEON.ABILITY_NAMES ON JLEON.POKEMON_ABILITIES.ABILITY_ID = JLEON.ABILITY_NAMES.ABILITY_ID
JOIN JLEON.LANGUAJE ON JLEON.ABILITY_NAMES.LOCAL_LANGUAGE_ID = JLEON.LANGUAJE.ID 
WHERE JLEON.LANGUAJE.ISO639 = 'ja' and JLEON.POKEDEX_2.GENERATION = 1; 

CREATE VIEW T2_LOPEZ_JUAN_3 AS SELECT JLEON.ABILITY_NAMES.NAME_A 
FROM JLEON.POKEDEX 
JOIN JLEON.POKEDEX_2
ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME) AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER
JOIN JLEON.POKEMON_ABILITIES ON JLEON.POKEDEX.ID_P = JLEON.POKEMON_ABILITIES.POKEMON_ID
JOIN JLEON.ABILITY_NAMES ON JLEON.POKEMON_ABILITIES.ABILITY_ID = JLEON.ABILITY_NAMES.ABILITY_ID
JOIN JLEON.LANGUAJE ON JLEON.ABILITY_NAMES.LOCAL_LANGUAGE_ID = JLEON.LANGUAJE.ID 
WHERE JLEON.LANGUAJE.ISO639 = 'ja' and JLEON.POKEDEX_2.GENERATION = 1; 

-- Grant Access to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_3 TO JLEON;

-- Punto 4 Encuentre el total de pokemon por cada temporada. (cambie el nombre de la columna de la agrupación a “TOTAL_TEMPORADA”) 
SELECT JLEON.POKEDEX_2.GENERATION, COUNT(JLEON.POKEDEX_2.GENERATION) AS TOTAL_TEMPORADA
FROM JLEON.POKEDEX_2 
GROUP BY JLEON.POKEDEX_2.GENERATION;

-- Create View and Give Access to JLEON
CREATE VIEW T2_LOPEZ_JUAN_4 AS SELECT JLEON.POKEDEX_2.GENERATION, COUNT(JLEON.POKEDEX_2.GENERATION) AS TOTAL_TEMPORADA
FROM JLEON.POKEDEX_2 
GROUP BY JLEON.POKEDEX_2.GENERATION;

-- Grant Access to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_4 TO JLEON;


-- Punto 5 Encuentre el total de cada tipo de Pokémon (JLEON.POKEDEX_2.TYPE_1) por cada temporada, y seleccione únicamente aquellos tipos que tengan más de 10 pokemon. El resultado debe tener 3 columnas (tipo, temporada y total).
SELECT JLEON.POKEDEX_2.TYPE_1, JLEON.POKEDEX_2.GENERATION, COUNT(JLEON.POKEDEX_2.TYPE_1) AS TOTAL
FROM JLEON.POKEDEX_2 
GROUP BY JLEON.POKEDEX_2.TYPE_1, JLEON.POKEDEX_2.GENERATION
HAVING COUNT(JLEON.POKEDEX_2.TYPE_1) > 10;
-- nota: HAVING es usado en cambio de WHERE cuando se usa GROUP BY

-- Create View and Give Access to JLEON
CREATE VIEW T2_LOPEZ_JUAN_5 AS SELECT JLEON.POKEDEX_2.TYPE_1, JLEON.POKEDEX_2.GENERATION, COUNT(JLEON.POKEDEX_2.TYPE_1) AS TOTAL
FROM JLEON.POKEDEX_2 
GROUP BY JLEON.POKEDEX_2.TYPE_1, JLEON.POKEDEX_2.GENERATION
HAVING COUNT(JLEON.POKEDEX_2.TYPE_1) > 10;

-- Grant Access to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_5 TO JLEON;

-- SECTION 2

-- Describe Tables from JLEON
-- MOV_ROLES
-- MOV_MOVIES
-- MOV_ACTORS
-- MOV_MOVIES_GENRERS
-- MOV_MOVIES_DIRECTORS
-- MOV_DIRECTORS
-- MOV_DIRECTORS_GENRERS

DESCRIBE JLEON.MOV_MOVIES;
DESCRIBE JLEON.MOV_MOVIES_DIRECTORS;
DESCRIBE JLEON.MOV_MOVIES_GENRERS;
DESCRIBE JLEON.MOV_ROLES;
DESCRIBE JLEON.MOV_ACTORS;
DESCRIBE JLEON.MOV_DIRECTORS;
DESCRIBE JLEON.MOV_DIRECTORS_GENRERS;

-- The Schemas are:
-- SQL> DESCRIBE JLEON.MOV_MOVIES;
-- Name	Null?	Type
-- ID	NOT NULL	NUMBER(11)
-- NAME		VARCHAR2(100)
-- YEAR		NUMBER(11)
-- RANK		FLOAT(126)

-- SQL> DESCRIBE JLEON.MOV_MOVIES_DIRECTORS;
-- Name	Null?	Type
-- DIRECTOR_ID	NOT NULL	NUMBER(11)
-- MOVIE_ID	NOT NULL	NUMBER(11)

-- SQL> DESCRIBE JLEON.MOV_MOVIES_GENRERS;
-- Name	Null?	Type
-- MOVIE_ID	NOT NULL	NUMBER(11)
-- GENRE	NOT NULL	VARCHAR2(100)

-- SQL> DESCRIBE JLEON.MOV_ROLES;
-- Name	Null?	Type
-- ACTOR_ID	NOT NULL	NUMBER(11)
-- MOVIE_ID	NOT NULL	NUMBER(11)
-- ROLE	NOT NULL	VARCHAR2(100)

-- SQL> DESCRIBE JLEON.MOV_ACTORS;
-- Name	Null?	Type
-- ID	NOT NULL	NUMBER(11)
-- FIRST_NAME		VARCHAR2(100)
-- LAST_NAME		VARCHAR2(100)
-- GENDER		CHAR(1)

-- SQL> DESCRIBE JLEON.MOV_DIRECTORS;
-- Name	Null?	Type
-- ID	NOT NULL	NUMBER(11)
-- FIRST_NAME		VARCHAR2(100)
-- LAST_NAME		VARCHAR2(100)

-- SQL> DESCRIBE JLEON.MOV_DIRECTORS_GENRERS;
-- Name	Null?	Type
-- DIRECTOR_ID		NUMBER(11)
-- GENRE		VARCHAR2(100)
-- PROB		FLOAT(126)

-- Punto 7 Seleccione la cantidad de películas que hay por cada año, y el ranking promedio para ese año. El ranking debe tener como mucho 2 decimales, y no debe ser nulo, en caso de serlo se debe guardar un “0”.

SELECT JLEON.MOV_MOVIES.YEAR, COUNT(JLEON.MOV_MOVIES.YEAR) AS TOTAL, NVL(ROUND(AVG(JLEON.MOV_MOVIES.RANK), 2),0) AS RANKING
FROM JLEON.MOV_MOVIES
GROUP BY JLEON.MOV_MOVIES.YEAR;

-- Create View and Give Access to JLEON
CREATE VIEW T2_LOPEZ_JUAN_7 AS SELECT JLEON.MOV_MOVIES.YEAR, COUNT(JLEON.MOV_MOVIES.YEAR) AS TOTAL, NVL(ROUND(AVG(JLEON.MOV_MOVIES.RANK), 2),0) 
AS RANKING FROM JLEON.MOV_MOVIES GROUP BY JLEON.MOV_MOVIES.YEAR; 

-- Grant Access to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_7 TO JLEON;

-- Punto 8 Seleccione el id, nombre y apellido de cada director, junto con la cantidad de actores DIFERENTES que ha trabajado.
SELECT JLEON.MOV_DIRECTORS.ID, JLEON.MOV_DIRECTORS.FIRST_NAME, JLEON.MOV_DIRECTORS.LAST_NAME, COUNT(DISTINCT JLEON.MOV_ROLES.ACTOR_ID) AS TOTAL_ACTORES
FROM JLEON.MOV_DIRECTORS
INNER JOIN JLEON.MOV_MOVIES_DIRECTORS ON JLEON.MOV_DIRECTORS.ID = JLEON.MOV_MOVIES_DIRECTORS.DIRECTOR_ID
INNER JOIN JLEON.MOV_ROLES ON JLEON.MOV_MOVIES_DIRECTORS.MOVIE_ID = JLEON.MOV_ROLES.MOVIE_ID
GROUP BY JLEON.MOV_DIRECTORS.ID, JLEON.MOV_DIRECTORS.FIRST_NAME, JLEON.MOV_DIRECTORS.LAST_NAME;

CREATE VIEW T2_LOPEZ_JUAN_8 AS SELECT JLEON.MOV_DIRECTORS.ID, JLEON.MOV_DIRECTORS.FIRST_NAME, JLEON.MOV_DIRECTORS.LAST_NAME, 
COUNT(DISTINCT JLEON.MOV_ROLES.ACTOR_ID) AS TOTAL_ACTORES FROM JLEON.MOV_DIRECTORS INNER JOIN JLEON.MOV_MOVIES_DIRECTORS ON 
JLEON.MOV_DIRECTORS.ID = JLEON.MOV_MOVIES_DIRECTORS.DIRECTOR_ID INNER JOIN JLEON.MOV_ROLES ON 
JLEON.MOV_MOVIES_DIRECTORS.MOVIE_ID = JLEON.MOV_ROLES.MOVIE_ID GROUP BY JLEON.MOV_DIRECTORS.ID, JLEON.MOV_DIRECTORS.FIRST_NAME, 
JLEON.MOV_DIRECTORS.LAST_NAME;

-- Grant Access to JLEON
GRANT SELECT ON IS324304.T2_LOPEZ_JUAN_8 TO JLEON;








