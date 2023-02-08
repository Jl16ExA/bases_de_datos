-- JUAN DAVID LOPEZ BECERRA

-- 1. Create Table
CREATE TABLE TABLA1 (
    ID NUMBER PRIMARY KEY,
    ID_AUTONUM NUMBER GENERATED BY DEFAULT AS IDENTITY,
    DATO1 NUMBER(10),
    DATO2 NUMBER(10),
    DATO3 NUMBER(10, 2),
    BOOLEANO CHAR(1),
    TEXTO_FIJO CHAR(50) DEFAULT 'Texto fijo',
    TEXTO_VAR VARCHAR(100),
    FECHA DATE,
    TIMESTAMP_DEFAULT TIMESTAMP DEFAULT SYSDATE
);

-- 2. Add 10 Values
INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    1,
    10,
    20,
    30.5,
    1,
    'primera fila',
    TO_DATE('01-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    2,
    11,
    21,
    31.5,
    0,
    'segunda fila',
    TO_DATE('02-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    3,
    12,
    22,
    32.5,
    1,
    'tercera fila',
    TO_DATE('03-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    4,
    13,
    23,
    33.5,
    0,
    'cuarta fila',
    TO_DATE('04-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    5,
    14,
    24,
    34.5,
    1,
    'quinta fila',
    TO_DATE('05-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    6,
    15,
    25,
    35.5,
    0,
    'sexta fila',
    TO_DATE('06-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    7,
    16,
    26,
    36.5,
    1,
    'séptima fila',
    TO_DATE('07-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    8,
    17,
    27,
    37.5,
    0,
    'octava fila',
    TO_DATE('08-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    9,
    17,
    27,
    37.5,
    0,
    'novena fila',
    TO_DATE('08-JAN-2023', 'DD-MON-YYYY')
);

INSERT INTO TABLA1 (
    ID,
    DATO1,
    DATO2,
    DATO3,
    BOOLEANO,
    TEXTO_VAR,
    FECHA
) VALUES (
    10,
    18,
    28,
    38.5,
    1,
    'decima fila',
    TO_DATE('09-JAN-2023', 'DD-MON-YYYY')
);

-- SELECT ALL ROWS TO SEE HOW IT WAS CREATED
SELECT
    *
FROM
    TABLA1;

-- 3. Create second table
CREATE TABLE TABLA2 (
    ID NUMBER PRIMARY KEY,
    ID_TABLA1 NUMBER NOT NULL,
    FOREIGN KEY (ID_TABLA1) REFERENCES TABLA1(ID),
    DATO1 CHAR(10),
    DATO2 CHAR(10)
);

-- 4. Populate value with values
INSERT INTO TABLA2 (
    ID,
    ID_TABLA1,
    DATO1,
    DATO2
) VALUES (
    1,
    1,
    'Dato 11',
    'Dato 12'
);

INSERT INTO TABLA2 (
    ID,
    ID_TABLA1,
    DATO1,
    DATO2
) VALUES (
    2,
    2,
    'Dato 21',
    'Dato 22'
);

INSERT INTO TABLA2 (
    ID,
    ID_TABLA1,
    DATO1,
    DATO2
) VALUES (
    3,
    3,
    'Dato 31',
    'Dato 32'
);

INSERT INTO TABLA2 (
    ID,
    ID_TABLA1,
    DATO1,
    DATO2
) VALUES (
    4,
    4,
    'Dato 41',
    'Dato 42'
);

INSERT INTO TABLA2 (
    ID,
    ID_TABLA1,
    DATO1,
    DATO2
) VALUES (
    5,
    5,
    'Dato 51',
    'Dato 52'
);

--SELECT ALL ROWS TO SEE HOW IT WAS CREATED
SELECT
    *
FROM
    TABLA2;

--CHANGE dato1 and dato2 on new talbe to tabla2_dato1, tabla2_dato2
ALTER TABLE TABLA2 RENAME COLUMN DATO1 TO TABLA2_DATO1;

ALTER TABLE TABLA2 RENAME COLUMN DATO2 TO TABLA2_DATO2;

--5. Join Tables View
CREATE VIEW LOPEZ_JUAN_5 AS
    SELECT
        TABLA1.*,
        TABLA2.TABLA2_DATO1,
        TABLA2.TABLA2_DATO2
    FROM
        TABLA1
        JOIN TABLA2
        ON TABLA1.ID = TABLA2.ID_TABLA1;

--NICE, IT WORKS AS A CHARM!

--6. SAME BUT NOW WITH DATE FILTER, ALL AFTER 04-JAN-2023
CREATE VIEW LOPEZ_JUAN_6 AS
    SELECT
        TABLA1.*,
        TABLA2.TABLA2_DATO1,
        TABLA2.TABLA2_DATO2
    FROM
        TABLA1
        JOIN TABLA2
        ON TABLA1.ID = TABLA2.ID_TABLA1
    WHERE
        TABLA1.FECHA > TO_DATE('04-JAN-2023', 'DD-MON-YYYY');

--7. Add notnull value
ALTER TABLE TABLA2 ADD TABLA2_DATO3 NUMERIC(10, 2) NOT NULL;

-- Cant add a not null field, it trows ORA-01758: table must be empty to add mandatory (NOT NULL) column

--8. Delete field of any of
ALTER TABLE TABLA2 DROP COLUMN TABLA2_DATO2;

--SEE RESULTS
SELECT
    *
FROM
    TABLA2;

-- IT WORKED!

--9. DELETE TABLE 2 (Schena included)
DROP TABLE TABLA2;

--TABLE TWO GONE :(

--10. DROP SOME VALUES FROM TABLE 1 WHERE DATO1 IS ODD
DELETE FROM TABLA1
WHERE
    MOD(DATO1,
    2) <> 0;

--11. What happened with the views?
-- In spanish: Parece que ahora las vistas tienen error, esto gracias a que eliminamos columnas/tablas que hacian parte del comando SELECT especificado.

-- #PART 2: With POKEDEX_2
-- 12. Describe Table:
-- La tabla tiene 50 columnas, 1 llave primaria, 3 columnas not_null.

-- Query to knwo number of columns:
SELECT
    COUNT(*)
FROM
    ALL_TAB_COLUMNS
WHERE
    OWNER='JLEON'
    AND TABLE_NAME='POKEDEX_2';

-- Tabla:

-- 13. Number of registries
SELECT
    COUNT(*) AS TOTAL_REGISTROS
FROM
    JLEON.POKEDEX_2;

-- Create View
CREATE VIEW LOPEZ_JUAN_13 AS
    SELECT
        COUNT(*) AS TOTAL_REGISTROS
    FROM
        JLEON.POKEDEX_2;

-- 14. Encontrar id de pokedex, nombre y tipo de Pokémon, cuyo tipo principal sea agua o hielo.
SELECT
    POKEDEX_NUMBER,
    NAME,
    TYPE_1
FROM
    JLEON.POKEDEX_2
WHERE
    TYPE_1 = 'Water'
    OR TYPE_1 = 'Ice';

CREATE VIEW LOPEZ_JUAN_14 AS
    SELECT
        POKEDEX_NUMBER,
        NAME,
        TYPE_1
    FROM
        JLEON.POKEDEX_2
    WHERE
        TYPE_1 = 'Water'
        OR TYPE_1 = 'Ice';

--15. ) Encontrar los 10 Pokémon más rápidos de la generación 1, mostrar el id de pokedex, nombre y estadísticas.
SELECT
    *
FROM
    JLEON.POKEDEX_2
WHERE
    GENERATION = 1
ORDER BY
    SPEED DESC FETCH FIRST 10 ROWS ONLY;

-- I understood statistics as all the data that corresponds to that pokemon
CREATE VIEW LOPEZ_JUAN_15 AS
    SELECT
        *
    FROM
        JLEON.POKEDEX_2
    WHERE
        GENERATION = 1
    ORDER BY
        SPEED DESC FETCH FIRST 10 ROWS ONLY;

--16. Encontrar los Pokémon cuyo ataque esté entre 90 y entre 150

SELECT
    *
FROM
    JLEON.POKEDEX_2
WHERE
    ATTACK BETWEEN 90
    AND 150;

CREATE VIEW LOPEZ_JUAN_16 AS
    SELECT
        *
    FROM
        JLEON.POKEDEX_2
    WHERE
        ATTACK BETWEEN 90
        AND 150;

--17. Find total amount of pokemons per generation.
SELECT
    GENERATION,
    COUNT(*) AS TOTAL_POKEMON
FROM
    JLEON.POKEDEX_2
GROUP BY
    GENERATION;

CREATE VIEW LOPEZ_JUAN_17 AS
    SELECT
        GENERATION,
        COUNT(*) AS TOTAL_POKEMON
    FROM
        JLEON.POKEDEX_2
    GROUP BY
        GENERATION;

--18. Find "Bird" pokemon species
SELECT
    *
FROM
    JLEON.POKEDEX_2
WHERE
    SPECIES LIKE '%Bird%';

CREATE VIEW LOPEZ_JUAN_18 AS
    SELECT
        *
    FROM
        JLEON.POKEDEX_2
    WHERE
        SPECIES LIKE '%Bird%';

--19. Sum of parameters per pokemon
SELECT
    NAME,
    HP + ATTACK + DEFENSE + SP_ATTACK + SP_DEFENSE + SPEED AS TOTAL_POINTS,
    HP + ATTACK + DEFENSE + SP_ATTACK + SP_DEFENSE + SPEED AS TOTAL_CALCULATION
FROM
    JLEON.POKEDEX_2;

-- de acuerdo a mi entendimiento de lo solicitado, la columna de "total de puntos" y "total de puntos cálculo"  son iguales.
CREATE VIEW LOPEZ_JUAN_19 AS
    SELECT
        NAME,
        HP + ATTACK + DEFENSE + SP_ATTACK + SP_DEFENSE + SPEED AS TOTAL_POINTS,
        HP + ATTACK + DEFENSE + SP_ATTACK + SP_DEFENSE + SPEED AS TOTAL_CALCULATION
    FROM
        JLEON.POKEDEX_2;

-- 20. Show all pokemon types
SELECT
    TYPE_1
FROM
    JLEON.POKEDEX_2
GROUP BY
    TYPE_1 UNION
    SELECT
        TYPE_2
    FROM
        JLEON.POKEDEX_2
    GROUP BY
        TYPE_2;

CREATE VIEW LOPEZ_JUAN_20 AS
    SELECT
        TYPE_1
    FROM
        JLEON.POKEDEX_2
    GROUP BY
        TYPE_1 UNION
        SELECT
            TYPE_2
        FROM
            JLEON.POKEDEX_2
        GROUP BY
            TYPE_2;

-- PART 3

-- 21. Describe : Jleon.pokedex , Jleon. pokemon_abilities, Jleon. ABILITY_NAMES, Jleon.languaje
-- Pokedex:

-- Name	          Null?	    Type
-- ID_P	          NOT NULL	NUMBER(5)
-- IDENTIFIER_P	  NOT NULL	VARCHAR2(50)
-- SPECIES_ID		        NUMBER(5)
-- HEIGHT		            NUMBER(5)
-- WEIGHT		            NUMBER(5)
-- BASE_EXPERIENCE		    NUMBER(5)
-- ORDER_P		            NUMBER(5)
-- IS_DEFAULT		        CHAR(1)

-- No-Registros: 1092
SELECT
    COUNT(*) AS TOTAL_REGISTROS
FROM
    JLEON.POKEDEX;

-- Pokemon_abilities

-- Name	        Null?	   Type
-- POKEMON_ID	NOT NULL	NUMBER(5)
-- ABILITY_ID	NOT NULL	NUMBER(5)
-- IS_HIDDEN	NOT NULL	CHAR(1)
-- SLOT	NOT NULL	        NUMBER(5)

--No-Registros: 2449
SELECT
    COUNT(*) AS TOTAL_REGISTROS
FROM
    JLEON.POKEMON_ABILITIES;

-- Ability Names

-- Name	                Null?	    Type
-- ABILITY_ID	        NOT NULL	NUMBER(5)
-- LOCAL_LANGUAGE_ID	NOT NULL	NUMBER(5)
-- NAME_A		                    VARCHAR2(30)

-- No Registros: 2730
SELECT
    COUNT(*) AS TOTAL_REGISTROS
FROM
    JLEON.ABILITY_NAMES;

-- Language

-- Name	         Null?	    Type
-- ID	        NOT NULL	NUMBER(5)
-- ISO639		            CHAR(2)
-- ISO3166		            CHAR(2)
-- IDENTIFIER_L		        VARCHAR2(10)
-- OFFICIAL		            CHAR(1)
-- ORDER_L		            NUMBER(5)

--No Regsitros: 12
SELECT
    COUNT(*) AS TOTAL_REGISTROS
FROM
    JLEON.LANGUAJE;

--22. See Image on Repo.

--23.Cruzar estas tablas para encontrar las habilidades (en español) de cada Pokémon, y mostrar EL ID DE LA POKEDEX, EL NOMBRE DEL POKÉMON Y EL NOMBRE DE LA HABILIDAD.

SELECT
    JLEON.POKEDEX.ID_P AS POKEMON_ID,
    JLEON.POKEDEX.IDENTIFIER_P AS POKEMON_NAME,
    JLEON.ABILITY_NAMES.NAME_A AS ABILITY_NAME_ES
FROM
    JLEON.POKEDEX
    JOIN JLEON.POKEMON_ABILITIES
    ON JLEON.POKEDEX.ID_P = JLEON.POKEMON_ABILITIES.POKEMON_ID JOIN JLEON.ABILITY_NAMES
    ON JLEON.POKEMON_ABILITIES.ABILITY_ID = JLEON.ABILITY_NAMES.ABILITY_ID
    JOIN JLEON.LANGUAJE
    ON JLEON.ABILITY_NAMES.LOCAL_LANGUAGE_ID = JLEON.LANGUAJE.ID
WHERE
    JLEON.LANGUAJE.ISO639 = 'es';

CREATE VIEW LOPEZ_JUAN_23 AS
    SELECT
        JLEON.POKEDEX.ID_P AS POKEMON_ID,
        JLEON.POKEDEX.IDENTIFIER_P AS POKEMON_NAME,
        JLEON.ABILITY_NAMES.NAME_A AS ABILITY_NAME_ES
    FROM
        JLEON.POKEDEX
        JOIN JLEON.POKEMON_ABILITIES
        ON JLEON.POKEDEX.ID_P = JLEON.POKEMON_ABILITIES.POKEMON_ID JOIN JLEON.ABILITY_NAMES
        ON JLEON.POKEMON_ABILITIES.ABILITY_ID = JLEON.ABILITY_NAMES.ABILITY_ID
        JOIN JLEON.LANGUAJE
        ON JLEON.ABILITY_NAMES.LOCAL_LANGUAGE_ID = JLEON.LANGUAJE.ID
    WHERE
        JLEON.LANGUAJE.ISO639 = 'es';

-- 24. Find names wich names start with letter "S/s" or "S/s"
SELECT
    ID_P,
    IDENTIFIER_P
FROM
    JLEON.POKEDEX
WHERE
    IDENTIFIER_P LIKE 'S%'
    OR IDENTIFIER_P LIKE 's%'
    OR IDENTIFIER_P LIKE 'Z%'
    OR IDENTIFIER_P LIKE 'z%';

CREATE VIEW LOPEZ_JUAN_24 AS
    SELECT
        ID_P,
        IDENTIFIER_P
    FROM
        JLEON.POKEDEX
    WHERE
        IDENTIFIER_P LIKE 'S%'
        OR IDENTIFIER_P LIKE 's%'
        OR IDENTIFIER_P LIKE 'Z%'
        OR IDENTIFIER_P LIKE 'z%';

--25. Find pokemons present in pokedex1 and pokedex2
SELECT
    JLEON.POKEDEX.ID_P AS POKEDEX_ID,
    JLEON.POKEDEX.IDENTIFIER_P AS POKEDEX_NAME
FROM
    JLEON.POKEDEX
    JOIN JLEON.POKEDEX_2
    ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME)
    AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER;

CREATE VIEW LOPEZ_JUAN_25 AS
    SELECT
        JLEON.POKEDEX.ID_P AS POKEDEX_ID,
        JLEON.POKEDEX.IDENTIFIER_P AS POKEDEX_NAME
    FROM
        JLEON.POKEDEX
        JOIN JLEON.POKEDEX_2
        ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME)
        AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER;

-- 26.
SELECT
    JLEON.POKEDEX_2.POKEDEX_NUMBER,
    JLEON.POKEDEX_2.NAME,
    JLEON.POKEDEX.SPECIES_ID,
    JLEON.POKEDEX.HEIGHT,
    JLEON.POKEDEX.WEIGHT,
    JLEON.POKEDEX.ORDER_P,
    JLEON.POKEDEX.IS_DEFAULT,
    JLEON.POKEDEX_2.ID,
    JLEON.POKEDEX_2.JAPANESE_NAME,
    JLEON.POKEDEX_2.GENERATION,
    JLEON.POKEDEX_2.STATUS,
    JLEON.POKEDEX_2.SPECIES,
    JLEON.POKEDEX_2.TYPE_NUMBER,
    JLEON.POKEDEX_2.TYPE_1,
    JLEON.POKEDEX_2.TYPE_2,
    JLEON.POKEDEX_2.HEIGHT_M,
    JLEON.POKEDEX_2.WEIGHT_KG,
    JLEON.POKEDEX_2.ABILITIES_NUMBER,
    JLEON.POKEDEX_2.ABILITY_1,
    JLEON.POKEDEX_2.ABILITY_2,
    JLEON.POKEDEX_2.ABILITY_HIDDEN,
    JLEON.POKEDEX_2.TOTAL_POINTS,
    JLEON.POKEDEX_2.HP,
    JLEON.POKEDEX_2.ATTACK,
    JLEON.POKEDEX_2.DEFENSE,
    JLEON.POKEDEX_2.SP_ATTACK,
    JLEON.POKEDEX_2.SP_DEFENSE,
    JLEON.POKEDEX_2.SPEED,
    JLEON.POKEDEX_2.CATCH_RATE,
    JLEON.POKEDEX_2.BASE_FRIENDSHIP,
    JLEON.POKEDEX_2.GROWTH_RATE,
    JLEON.POKEDEX_2.EGG_TYPE_NUMBER,
    JLEON.POKEDEX_2.EGG_TYPE_1,
    JLEON.POKEDEX_2.EGG_TYPE_2,
    JLEON.POKEDEX_2.PERCENTAGE_MALE,
    JLEON.POKEDEX_2.EGG_CYCLES,
    JLEON.POKEDEX_2.AGAINST_NORMAL,
    JLEON.POKEDEX_2.AGAINST_FIRE,
    JLEON.POKEDEX_2.AGAINST_WATER,
    JLEON.POKEDEX_2.AGAINST_ELECTRIC,
    JLEON.POKEDEX_2.AGAINST_GRASS,
    JLEON.POKEDEX_2.AGAINST_ICE,
    JLEON.POKEDEX_2.AGAINST_FIGHT,
    JLEON.POKEDEX_2.AGAINST_POISON,
    JLEON.POKEDEX_2.AGAINST_GROUND,
    JLEON.POKEDEX_2.AGAINST_FLYING,
    JLEON.POKEDEX_2.AGAINST_PSYCHIC,
    JLEON.POKEDEX_2.AGAINST_BUG,
    JLEON.POKEDEX_2.AGAINST_ROCK,
    JLEON.POKEDEX_2.AGAINST_GHOST,
    JLEON.POKEDEX_2.AGAINST_DRAGON,
    JLEON.POKEDEX_2.AGAINST_DARK,
    JLEON.POKEDEX_2.AGAINST_STEEL,
    JLEON.POKEDEX_2.AGAINST_FAIRY
FROM
    JLEON.POKEDEX
    JOIN JLEON.POKEDEX_2
    ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME)
    AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER;

CREATE VIEW LOPEZ_JUAN_26 AS
    SELECT
        JLEON.POKEDEX_2.POKEDEX_NUMBER,
        JLEON.POKEDEX_2.NAME,
        JLEON.POKEDEX.SPECIES_ID,
        JLEON.POKEDEX.HEIGHT,
        JLEON.POKEDEX.WEIGHT,
        JLEON.POKEDEX.ORDER_P,
        JLEON.POKEDEX.IS_DEFAULT,
        JLEON.POKEDEX_2.ID,
        JLEON.POKEDEX_2.JAPANESE_NAME,
        JLEON.POKEDEX_2.GENERATION,
        JLEON.POKEDEX_2.STATUS,
        JLEON.POKEDEX_2.SPECIES,
        JLEON.POKEDEX_2.TYPE_NUMBER,
        JLEON.POKEDEX_2.TYPE_1,
        JLEON.POKEDEX_2.TYPE_2,
        JLEON.POKEDEX_2.HEIGHT_M,
        JLEON.POKEDEX_2.WEIGHT_KG,
        JLEON.POKEDEX_2.ABILITIES_NUMBER,
        JLEON.POKEDEX_2.ABILITY_1,
        JLEON.POKEDEX_2.ABILITY_2,
        JLEON.POKEDEX_2.ABILITY_HIDDEN,
        JLEON.POKEDEX_2.TOTAL_POINTS,
        JLEON.POKEDEX_2.HP,
        JLEON.POKEDEX_2.ATTACK,
        JLEON.POKEDEX_2.DEFENSE,
        JLEON.POKEDEX_2.SP_ATTACK,
        JLEON.POKEDEX_2.SP_DEFENSE,
        JLEON.POKEDEX_2.SPEED,
        JLEON.POKEDEX_2.CATCH_RATE,
        JLEON.POKEDEX_2.BASE_FRIENDSHIP,
        JLEON.POKEDEX_2.GROWTH_RATE,
        JLEON.POKEDEX_2.EGG_TYPE_NUMBER,
        JLEON.POKEDEX_2.EGG_TYPE_1,
        JLEON.POKEDEX_2.EGG_TYPE_2,
        JLEON.POKEDEX_2.PERCENTAGE_MALE,
        JLEON.POKEDEX_2.EGG_CYCLES,
        JLEON.POKEDEX_2.AGAINST_NORMAL,
        JLEON.POKEDEX_2.AGAINST_FIRE,
        JLEON.POKEDEX_2.AGAINST_WATER,
        JLEON.POKEDEX_2.AGAINST_ELECTRIC,
        JLEON.POKEDEX_2.AGAINST_GRASS,
        JLEON.POKEDEX_2.AGAINST_ICE,
        JLEON.POKEDEX_2.AGAINST_FIGHT,
        JLEON.POKEDEX_2.AGAINST_POISON,
        JLEON.POKEDEX_2.AGAINST_GROUND,
        JLEON.POKEDEX_2.AGAINST_FLYING,
        JLEON.POKEDEX_2.AGAINST_PSYCHIC,
        JLEON.POKEDEX_2.AGAINST_BUG,
        JLEON.POKEDEX_2.AGAINST_ROCK,
        JLEON.POKEDEX_2.AGAINST_GHOST,
        JLEON.POKEDEX_2.AGAINST_DRAGON,
        JLEON.POKEDEX_2.AGAINST_DARK,
        JLEON.POKEDEX_2.AGAINST_STEEL,
        JLEON.POKEDEX_2.AGAINST_FAIRY
    FROM
        JLEON.POKEDEX
        JOIN JLEON.POKEDEX_2
        ON UPPER(JLEON.POKEDEX.IDENTIFIER_P) = UPPER(JLEON.POKEDEX_2.NAME)
        AND JLEON.POKEDEX.ID_P = JLEON.POKEDEX_2.POKEDEX_NUMBER;

-- Dar permisos a jleon
GRANT SELECT ON IS324304.LOPEZ_JUAN_20 TO JLEON;

GRANT SELECT ON USUARIO.LOPEZ_JUAN_14 TO JLEON;