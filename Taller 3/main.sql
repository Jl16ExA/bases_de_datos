-- Taller 3


-- JUAN DAVID LOPEZ BECERRA

-- Se debe hacer uso de las siguientes tablas:
-- - PREMIERL_Matches;
-- - PREMIERL_Teams;
-- - PREMIERL_Actions;
-- - PREMIERL_Players;

-- Obtener los esquemas de cada tabla
SELECT
    *
FROM
    PREMIERL_MATCHES;

SELECT
    *
FROM
    PREMIERL_TEAMS;

SELECT
    *
FROM
    PREMIERL_ACTIONS;

SELECT
    *
FROM
    PREMIERL_PLAYERS;

--  2) Mostrar los partidos jugados. El resultado debe tener la siguiente información:
-- a. ID del partido.
-- b. Resultado del partido (equipo home) [-1 : lost, 0: tie; 1: won]
-- c. Nombre del equipo local (NO es el id)
-- d. Nombre del equipo visitante (NO es el id)
-- e. Fecha del partido en formato (dd-mm-aaaa).

SELECT
    M.MATCHID,
    CASE
        WHEN M.RESULTOFTEAMHOME = -1 THEN
            'lost'
        WHEN M.RESULTOFTEAMHOME = 0 THEN
            'tie'
        WHEN M.RESULTOFTEAMHOME = 1 THEN
            'won'
        ELSE
            'N/A'
    END           AS RESULT,
    T1.NAME       AS TEAMHOME,
    T2.NAME       AS TEAMAWAY,
    TO_CHAR(M.DATE_,
    'DD-MM-YYYY') AS DATE_
FROM
    JLEON.PREMIERL_MATCHES M
    JOIN JLEON.PREMIERL_TEAMS T1
    ON M.TEAMHOMEID = T1.TEAMID JOIN JLEON.PREMIERL_TEAMS T2
    ON M.TEAMAWAYID = T2.TEAMID;

SELECT
    *
FROM
    JLEON.PREMIERL_MATCHES;

-- Create view

CREATE OR REPLACE VIEW T2_LOPEZ_JUAN_2 AS
    SELECT
        M.MATCHID,
        CASE
            WHEN M.RESULTOFTEAMHOME = -1 THEN
                'lost'
            WHEN M.RESULTOFTEAMHOME = 0 THEN
                'tie'
            WHEN M.RESULTOFTEAMHOME = 1 THEN
                'won'
            ELSE
                'N/A'
        END           AS RESULT,
        T1.NAME       AS TEAMHOME,
        T2.NAME       AS TEAMAWAY,
        TO_CHAR(M.DATE_,
        'DD-MM-YYYY') AS DATE_
    FROM
        JLEON.PREMIERL_MATCHES M
        JOIN JLEON.PREMIERL_TEAMS T1
        ON M.TEAMHOMEID = T1.TEAMID JOIN JLEON.PREMIERL_TEAMS T2
        ON M.TEAMAWAYID = T2.TEAMID;

-- Grant acces to jleon

GRANT SELECT ON T2_LOPEZ_JUAN_2 TO JLEON;

-- 3) Mostrar una lista de la cantidad de partidos ganados por cada equipo siendo local o visitante
-- y ordenar el resultado para mostrar primero los que más partidos ganaron. El resultado
-- debe tener
-- a. Cantidad total de partidos ganados.
-- b. Nombre del equipo.

SELECT
    COUNT(*) AS TOTAL,
    T.NAME
FROM
    JLEON.PREMIERL_MATCHES M
    JOIN JLEON.PREMIERL_TEAMS T
    ON M.TEAMHOMEID = T.TEAMID
WHERE
    M.RESULTOFTEAMHOME = 1
GROUP BY
    T.NAME UNION
    SELECT
        COUNT(*) AS TOTAL,
        T.NAME
    FROM
        JLEON.PREMIERL_MATCHES M
        JOIN JLEON.PREMIERL_TEAMS T
        ON M.TEAMAWAYID = T.TEAMID
    WHERE
        M.RESULTOFTEAMHOME = -1
    GROUP BY
        T.NAME
    ORDER BY
        TOTAL DESC;

-- Create view

CREATE OR REPLACE VIEW T3_LOPEZ_JUAN_3 AS
    SELECT
        COUNT(*) AS TOTAL,
        T.NAME
    FROM
        JLEON.PREMIERL_MATCHES M
        JOIN JLEON.PREMIERL_TEAMS T
        ON M.TEAMHOMEID = T.TEAMID
    WHERE
        M.RESULTOFTEAMHOME = 1
    GROUP BY
        T.NAME UNION
        SELECT
            COUNT(*) AS TOTAL,
            T.NAME
        FROM
            JLEON.PREMIERL_MATCHES M
            JOIN JLEON.PREMIERL_TEAMS T
            ON M.TEAMAWAYID = T.TEAMID
        WHERE
            M.RESULTOFTEAMHOME = -1
        GROUP BY
            T.NAME
        ORDER BY
            TOTAL DESC;

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_3 TO JLEON;

-- 4) Seleccione todos los jugadores que solo tienen 1 nombre. Puede ayudarse de funciones
-- como TRIM y como REGEXP_LIKE.

SELECT
    P.PLAYERID,
    P.NAME
FROM
    JLEON.PREMIERL_PLAYERS P
WHERE
    REGEXP_LIKE(TRIM(P.NAME),
    '^[A-Z][a-z]+$',
    'i');

-- Create view

CREATE OR REPLACE VIEW T3_LOPEZ_JUAN_4 AS
    SELECT
        P.PLAYERID,
        P.NAME
    FROM
        JLEON.PREMIERL_PLAYERS P
    WHERE
        REGEXP_LIKE(TRIM(P.NAME),
        '^[A-Z][a-z]+$',
        'i');

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_4 TO JLEON;

-- 5) Seleccione el nombre de los jugadores y el tiempo jugado, de aquellos jugadores que
-- tuvieron un tiempo de juego superior a la media de todos los jugadores. (Tenga en cuenta
-- que obtener el promedio total de la tabla es diferente del promedio del tiempo de los
-- jugadores)

SELECT
    P.NAME,
    SUM(A.TIMEPLAYED) AS TOTAL_TIME
FROM
    JLEON.PREMIERL_PLAYERS P
    JOIN JLEON.PREMIERL_ACTIONS A
    ON P.PLAYERID = A.PLAYERID
GROUP BY
    P.NAME
HAVING
    AVG(A.TIMEPLAYED) > (
        SELECT
            AVG(TIMEPLAYED)
        FROM
            JLEON.PREMIERL_ACTIONS
    );

-- Create view

CREATE OR REPLACE VIEW T3_LOPEZ_JUAN_5 AS
    SELECT
        P.NAME,
        SUM(A.TIMEPLAYED) AS TOTAL_TIME
    FROM
        JLEON.PREMIERL_PLAYERS P
        JOIN JLEON.PREMIERL_ACTIONS A
        ON P.PLAYERID = A.PLAYERID
    GROUP BY
        P.NAME
    HAVING
        AVG(A.TIMEPLAYED) > (
            SELECT
                AVG(TIMEPLAYED)
            FROM
                JLEON.PREMIERL_ACTIONS
        );

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_5 TO JLEON;

-- 6) Indique la cantidad de jugadores que se encuentran debajo de la media del tiempo jugado
-- y los jugadores que se encuentran sobre la media del tiempo jugado. El resultado debe
-- aparecer en la misma tabla con dos columnas (TOTAL, DESCRIPCION [MAYOR_MEDIA,
-- MENOR_MEDIA])

--  TODO: CHECK THIS ONE
SELECT
    SUM(COUNT(*)) AS TOTAL,
    'MAYOR_MEDIA' AS DESCRIPCION
FROM
    JLEON.PREMIERL_PLAYERS P
    JOIN JLEON.PREMIERL_ACTIONS A
    ON P.PLAYERID = A.PLAYERID
GROUP BY
    P.PLAYERID
HAVING
    AVG(A.TIMEPLAYED) > (
        SELECT
            AVG(TIMEPLAYED)
        FROM
            JLEON.PREMIERL_ACTIONS
    ) UNION
    SELECT
        SUM(COUNT(*)) AS TOTAL,
        'MENOR_MEDIA' AS DESCRIPCION
    FROM
        JLEON.PREMIERL_PLAYERS P
        JOIN JLEON.PREMIERL_ACTIONS A
        ON P.PLAYERID = A.PLAYERID
    GROUP BY
        P.PLAYERID
    HAVING
        AVG(A.TIMEPLAYED) < (
            SELECT
                AVG(TIMEPLAYED)
            FROM
                JLEON.PREMIERL_ACTIONS
        );

-- Create view

CREATE OR REPLACE VIEW T3_LOPEZ_JUAN_6 AS
    SELECT
        SUM(COUNT(*)) AS TOTAL,
        'MAYOR_MEDIA' AS DESCRIPCION
    FROM
        JLEON.PREMIERL_PLAYERS P
        JOIN JLEON.PREMIERL_ACTIONS A
        ON P.PLAYERID = A.PLAYERID
    GROUP BY
        P.PLAYERID
    HAVING
        AVG(A.TIMEPLAYED) > (
            SELECT
                AVG(TIMEPLAYED)
            FROM
                JLEON.PREMIERL_ACTIONS
        ) UNION
        SELECT
            SUM(COUNT(*)) AS TOTAL,
            'MENOR_MEDIA' AS DESCRIPCION
        FROM
            JLEON.PREMIERL_PLAYERS P
            JOIN JLEON.PREMIERL_ACTIONS A
            ON P.PLAYERID = A.PLAYERID
        GROUP BY
            P.PLAYERID
        HAVING
            AVG(A.TIMEPLAYED) < (
                SELECT
                    AVG(TIMEPLAYED)
                FROM
                    JLEON.PREMIERL_ACTIONS
            );

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_6 TO JLEON;

-- 7) Seleccione el nombre de todos los jugadores del “Aston Villa” sin elementos repetidos.


SELECT
    DISTINCT P.NAME
FROM
    JLEON.PREMIERL_PLAYERS P
    JOIN JLEON.PREMIERL_ACTIONS A
    ON P.PLAYERID = A.PLAYERID JOIN JLEON.PREMIERL_MATCHES M
    ON A.MATCHID = M.MATCHID
    JOIN JLEON.PREMIERL_TEAMS T
    ON M.TEAMHOMEID = T.TEAMID
WHERE
    T.NAME = 'Aston Villa';

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_7 AS
    SELECT
        DISTINCT P.NAME
    FROM
        JLEON.PREMIERL_PLAYERS P
        JOIN JLEON.PREMIERL_ACTIONS A
        ON P.PLAYERID = A.PLAYERID JOIN JLEON.PREMIERL_MATCHES M
        ON A.MATCHID = M.MATCHID
        JOIN JLEON.PREMIERL_TEAMS T
        ON M.TEAMHOMEID = T.TEAMID
    WHERE
        T.NAME = 'Aston Villa';

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_7 TO JLEON;

-- 8) Seleccione los partidos que tuvieron penaltis durante el 2011 y en donde no hayan jugado
-- los equipos 'ARSENAL','EVERTON','MANCHESTER CITY' (ya sea como local o como visitante).
-- El resultado deberá contener:
-- a. ID del partido
-- b. Cantidad de penaltis
-- c. Equipo local
-- d. Equipo visitante
-- e. Fecha en formato (dd-mm-aaaa)
-- Ten en cuenta que para saber si hubieron penalties debes saber si

SELECT
    M.MATCHID,
    A.PENALTYGOALS AS PENALTIES,
    T1.NAME        AS TEAMHOME,
    T2.NAME        AS TEAMAWAY,
    TO_CHAR(M.DATE_,
    'DD-MM-YYYY')  AS DATE_
FROM
    JLEON.PREMIERL_MATCHES M
    JOIN JLEON.PREMIERL_ACTIONS A
    ON M.MATCHID = A.MATCHID JOIN JLEON.PREMIERL_TEAMS T1
    ON M.TEAMHOMEID = T1.TEAMID
    JOIN JLEON.PREMIERL_TEAMS T2
    ON M.TEAMAWAYID = T2.TEAMID
HAVING
    M.DATE_ BETWEEN TO_DATE('01-01-2011', 'DD-MM-YYYY')
    AND TO_DATE('31-12-2011', 'DD-MM-YYYY')
    AND UPPER(T1.NAME) NOT IN ('ARSENAL', 'EVERTON', 'MANCHESTER CITY')
    AND UPPER(T2.NAME) NOT IN ('ARSENAL', 'EVERTON', 'MANCHESTER CITY')
GROUP BY
    M.MATCHID, A.PENALTYGOALS, T1.NAME, T2.NAME, M.DATE_;

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_8 AS
    SELECT
        M.MATCHID,
        A.PENALTYGOALS AS PENALTIES,
        T1.NAME        AS TEAMHOME,
        T2.NAME        AS TEAMAWAY,
        TO_CHAR(M.DATE_,
        'DD-MM-YYYY')  AS DATE_
    FROM
        JLEON.PREMIERL_MATCHES M
        JOIN JLEON.PREMIERL_ACTIONS A
        ON M.MATCHID = A.MATCHID JOIN JLEON.PREMIERL_TEAMS T1
        ON M.TEAMHOMEID = T1.TEAMID
        JOIN JLEON.PREMIERL_TEAMS T2
        ON M.TEAMAWAYID = T2.TEAMID
    HAVING
        M.DATE_ BETWEEN TO_DATE('01-01-2011', 'DD-MM-YYYY')
        AND TO_DATE('31-12-2011', 'DD-MM-YYYY')
        AND UPPER(T1.NAME) NOT IN ('ARSENAL', 'EVERTON', 'MANCHESTER CITY')
        AND UPPER(T2.NAME) NOT IN ('ARSENAL', 'EVERTON', 'MANCHESTER CITY')
    GROUP BY
        M.MATCHID, A.PENALTYGOALS, T1.NAME, T2.NAME, M.DATE_;

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_8 TO JLEON;

-- 9) Seleccione los jugadores que tuvieron participación en el partido con mas goles durante el
-- primer semestre del 2012. Puede usar la función ROWNUM.

SELECT
    P.NAME
FROM
    JLEON.PREMIERL_PLAYERS P
    JOIN JLEON.PREMIERL_ACTIONS A
    ON P.PLAYERID = A.PLAYERID JOIN JLEON.PREMIERL_MATCHES M
    ON A.MATCHID = M.MATCHID
WHERE
    M.MATCHID = (
        SELECT
            M.MATCHID
        FROM
            JLEON.PREMIERL_MATCHES M
            JOIN JLEON.PREMIERL_ACTIONS A
            ON M.MATCHID = A.MATCHID
        WHERE
            M.DATE_ BETWEEN TO_DATE('01-01-2012', 'DD-MM-YYYY')
            AND TO_DATE('30-06-2012', 'DD-MM-YYYY')
        GROUP BY
            M.MATCHID, A.GOALS
        ORDER BY
            A.GOALS DESC FETCH FIRST 1 ROWS ONLY
    );

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_9 AS
    SELECT
        P.NAME
    FROM
        JLEON.PREMIERL_PLAYERS P
        JOIN JLEON.PREMIERL_ACTIONS A
        ON P.PLAYERID = A.PLAYERID JOIN JLEON.PREMIERL_MATCHES M
        ON A.MATCHID = M.MATCHID
    WHERE
        M.MATCHID = (
            SELECT
                M.MATCHID
            FROM
                JLEON.PREMIERL_MATCHES M
                JOIN JLEON.PREMIERL_ACTIONS A
                ON M.MATCHID = A.MATCHID
            WHERE
                M.DATE_ BETWEEN TO_DATE('01-01-2012', 'DD-MM-YYYY')
                AND TO_DATE('30-06-2012', 'DD-MM-YYYY')
            GROUP BY
                M.MATCHID, A.GOALS
            ORDER BY
                A.GOALS DESC FETCH FIRST 1 ROWS ONLY
        );

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_9 TO JLEON;

-- 10) Describa el enunciado de una consulta y desarróllela, debe involucrar:
-- a. Subqueries anidados.
-- b. Agrupaciones.
-- c. Operaciones sobre campos string.
-- d. Operaciones sobre campos de fecha.
-- e. Operaciones sobre conjuntos (in, not in).

-- La consulta que cumple todos estos parametros seria:

-- Seleccione los jugadores que no hayan jugado en el partido con mas goles durante el primer
-- semestre del 2012.

SELECT
    P.NAME
FROM
    JLEON.PREMIERL_PLAYERS P
WHERE
    P.PLAYERID NOT IN (
        SELECT
            A.PLAYERID
        FROM
            JLEON.PREMIERL_ACTIONS A
            JOIN JLEON.PREMIERL_MATCHES M
            ON A.MATCHID = M.MATCHID
        WHERE
            M.MATCHID = (
                SELECT
                    M.MATCHID
                FROM
                    JLEON.PREMIERL_MATCHES M
                    JOIN JLEON.PREMIERL_ACTIONS A
                    ON M.MATCHID = A.MATCHID
                WHERE
                    M.DATE_ BETWEEN TO_DATE('01-01-2012', 'DD-MM-YYYY')
                    AND TO_DATE('30-06-2012', 'DD-MM-YYYY')
                GROUP BY
                    M.MATCHID, A.GOALS
                ORDER BY
                    A.GOALS DESC FETCH FIRST 1 ROWS ONLY
            )
    );

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_10 AS
    SELECT
        P.NAME
    FROM
        JLEON.PREMIERL_PLAYERS P
    WHERE
        P.PLAYERID NOT IN (
            SELECT
                A.PLAYERID
            FROM
                JLEON.PREMIERL_ACTIONS A
                JOIN JLEON.PREMIERL_MATCHES M
                ON A.MATCHID = M.MATCHID
            WHERE
                M.MATCHID = (
                    SELECT
                        M.MATCHID
                    FROM
                        JLEON.PREMIERL_MATCHES M
                        JOIN JLEON.PREMIERL_ACTIONS A
                        ON M.MATCHID = A.MATCHID
                    WHERE
                        M.DATE_ BETWEEN TO_DATE('01-01-2012', 'DD-MM-YYYY')
                        AND TO_DATE('30-06-2012', 'DD-MM-YYYY')
                    GROUP BY
                        M.MATCHID, A.GOALS
                    ORDER BY
                        A.GOALS DESC FETCH FIRST 1 ROWS ONLY
                )
        );

-- Grant acces to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_10 TO JLEON;

-- PARTE 2

-- 12) Realizar una tabla con las diferencias entre los plazos de entrega real
-- (order_delivered_customer_date) y los plazos de entrega estimados
-- (order_estimated_delivery_date) respecto a la fecha de compra
-- (order_purchase_timestamp). El resultado debe tener los siguientes atributos:
-- a. Month_no : números del mes del 1 al 12.
-- b. Month: Tres primeras letras de cada mes ( Jan, Feb, Mar, etc)
-- c. Year2016_real_time: con el plazo medio de entrega por mes de 2016 (Null si no
-- existe)
-- d. Year2017_real_time: con el plazo medio de entrega por mes de 2017 (Null si no
-- existe)
-- e. Year2018_real_time, con el plazo medio de entrega por mes de 2018 (Null si no
-- existe)
-- f. Year2017_real_time, con el plazo medio de entrega por mes de 2017 (Null si no
-- existe)
-- g. Year2018_real_time, con el plazo medio de entrega por mes de 2018 (Null si no
-- existe)
-- h. Year2016_estimated_time, con el plazo medio de entrega estimado por mes de
-- 2016 (Null si no existe)
-- i. Year2017_estimated_time, con el plazo medio de entrega estimado por mes de
-- 2017 (Null si no existe)
-- j. Year2018_estimated_time, con el plazo medio de entrega estimado por mes de
-- 2018 (Null si no existe).
-- Solo tenga en cuenta ordenes entregadas (delivered) y cuya fecha de entrega
-- (delivered_customer_date) no sea nulo.

-- t TABLE IS CREATED TO ALWAYS HAVE ALL MONTHS INTO CONSIDERATION, EVEN IF VALUES ARE NULL

CREATE TABLE PURCHASE_ESTIMATES_VS_REAL AS WITH T AS (
    SELECT TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM') AS MONTH_NO,
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') AS MONTH FROM JLEON.OLIST_ORDERS GROUP BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM'),
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') ORDER BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM')
),
T1 AS (
    SELECT TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM') AS MONTH_NO,
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') AS MONTH,
 --cHECK IF IS NULL AND IF IS NULL THEN 0 ELSE 1 END AS YEAR2016_REAL_TIME,
    ROUND(AVG((ORDER_DELIVERED_CUSTOMER_DATE - ORDER_PURCHASE_TIMESTAMP))) AS YEAR2016_REAL_TIME,
    ROUND(AVG((ORDER_ESTIMATED_DELIVERY_DATE - ORDER_PURCHASE_TIMESTAMP))) AS YEAR2016_ESTIMATED_TIME FROM JLEON.OLIST_ORDERS WHERE ORDER_STATUS = 'delivered' AND ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL AND ORDER_PURCHASE_TIMESTAMP BETWEEN TO_DATE('01-01-2016', 'DD-MM-YYYY') AND TO_DATE('31-12-2016', 'DD-MM-YYYY') GROUP BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM'),
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') ORDER BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM')
),
T2 AS (
    SELECT TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM') AS MONTH_NO,
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') AS MONTH,
    ROUND(AVG((ORDER_DELIVERED_CUSTOMER_DATE - ORDER_PURCHASE_TIMESTAMP))) AS YEAR2017_REAL_TIME,
    ROUND(AVG((ORDER_ESTIMATED_DELIVERY_DATE - ORDER_PURCHASE_TIMESTAMP))) AS YEAR2017_ESTIMATED_TIME FROM JLEON.OLIST_ORDERS O WHERE ORDER_STATUS = 'delivered' AND ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL AND ORDER_PURCHASE_TIMESTAMP BETWEEN TO_DATE('01-01-2017', 'DD-MM-YYYY') AND TO_DATE('31-12-2017', 'DD-MM-YYYY') GROUP BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM'),
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') ORDER BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM')
),
T3 AS (
    SELECT TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM') AS MONTH_NO,
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') AS MONTH,
    ROUND(AVG((ORDER_DELIVERED_CUSTOMER_DATE - ORDER_PURCHASE_TIMESTAMP))) AS YEAR2018_REAL_TIME,
    ROUND(AVG((ORDER_ESTIMATED_DELIVERY_DATE - ORDER_PURCHASE_TIMESTAMP))) AS YEAR2018_ESTIMATED_TIME FROM JLEON.OLIST_ORDERS O WHERE ORDER_STATUS = 'delivered' AND ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL AND ORDER_PURCHASE_TIMESTAMP BETWEEN TO_DATE('01-01-2018', 'DD-MM-YYYY') AND TO_DATE('31-12-2018', 'DD-MM-YYYY') GROUP BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM'),
    TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MON') ORDER BY TO_CHAR(ORDER_PURCHASE_TIMESTAMP, 'MM')
)
    SELECT
        T.MONTH_NO,
        T.MONTH,
        T1.YEAR2016_REAL_TIME,
        T2.YEAR2017_REAL_TIME,
        T3.YEAR2018_REAL_TIME,
        T1.YEAR2016_ESTIMATED_TIME,
        T2.YEAR2017_ESTIMATED_TIME,
        T3.YEAR2018_ESTIMATED_TIME
    FROM
        T
        FULL OUTER JOIN T1
        ON T.MONTH_NO = T1.MONTH_NO
        FULL OUTER JOIN T2
        ON T.MONTH_NO = T2.MONTH_NO
        FULL OUTER JOIN T3
        ON T.MONTH_NO = T3.MONTH_NO;

-- Select all from table

SELECT
    *
FROM
    PURCHASE_ESTIMATES_VS_REAL;

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_12 AS
    SELECT
        *
    FROM
        PURCHASE_ESTIMATES_VS_REAL;

-- Grant access to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_12 TO JLEON;

-- 13) Realizar una tabla con las 10 principales categorías con más ingresos, en INGLÉS, el número
-- de pedidos de cada categoría (NUM_ORDER) y los ingresos totales de cada categoría
-- (revenue). Tenga en cuenta ordenes que no sean “canceladas” y cuya fecha de entrega
-- (delivered_customer_date) no sea nula. Use como ingresos la variable (payment_value de
-- la tabla olist_order_payments).


CREATE TABLE WITH_MOST_REVENUE AS
    SELECT
        T.PRODUCT_CATEGORY_NAME_ENGLISH,
        COUNT(OI.ORDER_ID)    AS NUM_ORDER,
        SUM(OP.PAYMENT_VALUE) AS REVENUE
    FROM
        JLEON.OLIST_PRODUCTS                          P
        INNER JOIN JLEON.OLIST_ORDER_ITEMS OI
        ON P.PRODUCT_ID = OI.PRODUCT_ID
        INNER JOIN JLEON.OLIST_ORDERS O
        ON OI.ORDER_ID = O.ORDER_ID
        INNER JOIN JLEON.OLIST_ORDER_PAYMENTS OP
        ON O.ORDER_ID = OP.ORDER_ID
        INNER JOIN JLEON.OLIST_PRODUCT_CATEGORY_NAME_TRANSLATION T
        ON P.PRODUCT_CATEGORY_NAME = T.PRODUCT_CATEGORY_NAME
    WHERE
        O.ORDER_STATUS <> 'canceled'
        AND O.ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL
    GROUP BY
        T.PRODUCT_CATEGORY_NAME_ENGLISH
    ORDER BY
        SUM(OP.PAYMENT_VALUE) DESC FETCH FIRST 10 ROWS ONLY;

-- Select all from table

SELECT
    *
FROM
    WITH_MOST_REVENUE;

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_13 AS
    SELECT
        *
    FROM
        WITH_MOST_REVENUE;

-- Grant access to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_13 TO JLEON;

-- 14) Realizar una tabla con los ingresos por mes y año. Las columnas resultantes deben ser:
-- a. Month_no : números del mes del 1 al 12.
-- b. Month: Tres primeras letras de cada mes ( Jan, Feb, Mar, etc)
-- c. Año 2016: ingresos por mes de 2016
-- d. Año 2017: ingresos por mes de 2017
-- e. Año 2018: ingresos por mes de 2018
-- Solo tenga en cuenta ordenes entregadas (delivered) y cuya fecha de entrega
-- (delivered_customer_date) no sea nulo.

-- t TABLE IS CREATED TO ALWAYS HAVE ALL MONTHS INTO CONSIDERATION, EVEN IF VALUES ARE NULL
CREATE TABLE REVENUE_BY_MONTH AS
    SELECT
        T.MONTH_NO,
        T.MONTH,
        T1.YEAR2016,
        T2.YEAR2017,
        T3.YEAR2018
    FROM
        (
            SELECT
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')  AS MONTH_NO,
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MON') AS MONTH
            FROM
                JLEON.OLIST_ORDERS O
            GROUP BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM'),
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MON')
            ORDER BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
        ) T
        FULL OUTER JOIN (
            SELECT
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')                     AS MONTH_NO,
                ROUND(SUM(PAYMENT_VALUE)) AS YEAR2016
            FROM
                JLEON.OLIST_ORDERS         O
                INNER JOIN JLEON.OLIST_ORDER_PAYMENTS OP
                ON O.ORDER_ID = OP.ORDER_ID
            WHERE
                ORDER_STATUS = 'delivered'
                AND ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL
                AND ORDER_PURCHASE_TIMESTAMP BETWEEN TO_DATE('01-01-2016',
                'DD-MM-YYYY')
                AND TO_DATE('31-12-2016',
                'DD-MM-YYYY')
            GROUP BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
            ORDER BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
        ) T1
        ON T.MONTH_NO = T1.MONTH_NO
        FULL OUTER JOIN (
            SELECT
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')                     AS MONTH_NO,
                ROUND(SUM(PAYMENT_VALUE)) AS YEAR2017
            FROM
                JLEON.OLIST_ORDERS         O
                INNER JOIN JLEON.OLIST_ORDER_PAYMENTS OP
                ON O.ORDER_ID = OP.ORDER_ID
            WHERE
                ORDER_STATUS = 'delivered'
                AND ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL
                AND ORDER_PURCHASE_TIMESTAMP BETWEEN TO_DATE('01-01-2017',
                'DD-MM-YYYY')
                AND TO_DATE('31-12-2017',
                'DD-MM-YYYY')
            GROUP BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
            ORDER BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
        ) T2
        ON T.MONTH_NO = T2.MONTH_NO
        FULL OUTER JOIN (
            SELECT
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')                     AS MONTH_NO,
                ROUND(SUM(PAYMENT_VALUE)) AS YEAR2018
            FROM
                JLEON.OLIST_ORDERS         O
                INNER JOIN JLEON.OLIST_ORDER_PAYMENTS OP
                ON O.ORDER_ID = OP.ORDER_ID
            WHERE
                ORDER_STATUS = 'delivered'
                AND ORDER_DELIVERED_CUSTOMER_DATE IS NOT NULL
                AND ORDER_PURCHASE_TIMESTAMP BETWEEN TO_DATE('01-01-2018',
                'DD-MM-YYYY')
                AND TO_DATE('31-12-2018',
                'DD-MM-YYYY')
            GROUP BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
            ORDER BY
                TO_CHAR(ORDER_PURCHASE_TIMESTAMP,
                'MM')
        ) T3
        ON T.MONTH_NO = T3.MONTH_NO
    ORDER BY
        T.MONTH_NO;

-- Select all from table

SELECT
    *
FROM
    REVENUE_BY_MONTH;

-- Create view

CREATE VIEW T3_LOPEZ_JUAN_14 AS
    SELECT
        *
    FROM
        REVENUE_BY_MONTH;

-- Grant access to jleon

GRANT SELECT ON T3_LOPEZ_JUAN_14 TO JLEON;