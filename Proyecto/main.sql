-- Grupo:
-- 1. Juan David López
-- 2. Hernan Manrique.
-- 3. Daniel Andres Becerra

--Creación de la tabla CONTINENTE:
CREATE TABLE CONTINENTE (
    ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NOMBRE VARCHAR2(50) NOT NULL,
    EXTENSION NUMBER
);

--Creación de la tabla PAIS:

CREATE TABLE PAIS (
    ID_PAIS NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_CONTINENTE NUMBER NOT NULL,
    NOMBRE VARCHAR2(50) NOT NULL,
    CONSTRAINT FK_PAIS_CONTINENTE FOREIGN KEY (ID_CONTINENTE) REFERENCES CONTINENTE(ID)
);

--Creación de la tabla DESTINO_TURISTICO:
CREATE TABLE DESTINO_TURISTICO (
    ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_PAIS NUMBER NOT NULL,
    NOMBRE VARCHAR2(50) NOT NULL,
    VALOR_TOUR NUMBER DEFAULT 0 CHECK (VALOR_TOUR >= 0),
    PATRIMONIO_HUMANIDAD VARCHAR2(2) DEFAULT 'NO' CHECK (PATRIMONIO_HUMANIDAD IN ('SI', 'NO', 'Si', 'No')),
    CONSTRAINT FK_DESTINO_TURISTICO_PAIS FOREIGN KEY (ID_PAIS) REFERENCES PAIS(ID_PAIS)
);

-- Llenar tabla continente con los 7 continentes
INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'Asia',
    44541138
);

INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'África',
    30370000
);

INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'América del Sur',
    17840000
);

INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'América del Norte',
    24710000
);

INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'Europa',
    10180000
);

INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'Oceanía',
    8600000
);

INSERT INTO CONTINENTE (
    NOMBRE,
    EXTENSION
) VALUES (
    'Antártida',
    14000000
);

--seleccionar continentes
SELECT
    *
FROM
    CONTINENTE;

-- Crear view de continente
CREATE VIEW PROYECTO_LOPEZ_JUAN_CONTINENTE AS
    SELECT
        *
    FROM
        CONTINENTE;

-- Dar acceso a JLEON
GRANT SELECT ON PROYECTO_LOPEZ_JUAN_CONTINENTE TO JLEON;

-- Llenar tabla pais con 15 paises de cada continente
INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'España'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Francia'
): INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Italia'
): INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Alemania'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Reino Unido'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Rusia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Polonia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Holanda'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Portugal'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Grecia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Bélgica'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Suiza'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Irlanda'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Dinamarca'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Europa'),
    'Suecia'
);

-- Llenar tabla pais con 15 paises de cada continente
INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'China'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'India'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Japón'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Corea del Sur'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Indonesia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Tailandia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Turquía'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Malasia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Filipinas'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Vietnam'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Irán'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Emiratos Árabes Unidos'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Singapur'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Arabia Saudita'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Asia'),
    'Afganistán'
);

-- Llenar tabla pais con 15 paises de cada continente

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Egipto'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Sudáfrica'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Nigeria'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Etiopía'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'República Democrática del Congo'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Tanzania'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Kenia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Argelia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Marruecos'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Sudán'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Uganda'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Mozambique'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Túnez'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Angola'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'África'),
    'Mali'
);

-- Llenar tabla pais con 15 paises de cada continente

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Australia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Nueva Zelanda'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Papúa Nueva Guinea'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Salomón'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Fiyi'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Vanuatu'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Marshall'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Marianas del Norte'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Cook'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Samoa'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Tokelau'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Pitcairn'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Niue'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Oceanía'),
    'Islas Cocos'
);

-- Llenar tabla pais con paises de cada continente

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'Antártida'),
    'Antártida'
);

-- Llenar tabla pais con 15 paises de cada continente

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Estados Unidos'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Canadá'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'México'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Guatemala'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'El Salvador'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Honduras'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Nicaragua'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Costa Rica'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Panamá'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'República Dominicana'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Cuba'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Jamaica'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Haití'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'Belize'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Norte'),
    'San Cristóbal y Nieves'
);

-- Llenar tabla pais con 15 paises de cada continente

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Brasil'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Argentina'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Colombia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Perú'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Venezuela'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Chile'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Ecuador'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Bolivia'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Paraguay'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Uruguay'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Surinam'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Guayana Francesa'
);

INSERT INTO PAIS (
    ID_CONTINENTE,
    NOMBRE
) VALUES (
    (SELECT ID FROM CONTINENTE WHERE NOMBRE = 'América del Sur'),
    'Falkland'
);

-- Seleccionar todos los paises

SELECT
    *
FROM
    PAIS;

-- Crear view de pais y dar acceso a JLEON

CREATE VIEW PROYECTO_LOPEZ_JUAN_PAIS AS
    SELECT
        *
    FROM
        PAIS;

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_PAIS TO JLEON;

-- Llenar tabla destino turistico

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Plaza España',
    100,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Basílica de la Sagrada Familia',
    200,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Estados Unidos'),
    'Gran Cañon',
    100,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Estados Unidos'),
    'Parque Nacional de Yosemite',
    600,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Canadá'),
    'Parque Nacional de Banff',
    80,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Canadá'),
    'Parque Nacional de Jasper',
    600,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'México'),
    'Cancún',
    700,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'México'),
    'Playa del Carmen',
    800,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Guatemala'),
    'Antigua Guatemala',
    900,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Guatemala'),
    'Lago de Atitlán',
    1000,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'El Salvador'),
    'Playa El Tunco',
    100,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'El Salvador'),
    'Playa El Sunzal',
    120,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Honduras'),
    'Roatán',
    130,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Honduras'),
    'Islas de la Bahía',
    140,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Nicaragua'),
    'Granada',
    150,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Nicaragua'),
    'Playa Maderas',
    160,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Costa Rica'),
    'Playa Manuel Antonio',
    170,
    'Si'
);

-- De ahora en adelante poner algunos que no sean trimonio de la humanidad y poner precios mas variados

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Costa Rica'),
    'Playa Tamarindo',
    180,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Panamá'),
    'Playa Blanca',
    190,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Panamá'),
    'Playa Santa Clara',
    200,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'República Dominicana'),
    'Playa Bávaro',
    210,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'República Dominicana'),
    'Playa Punta Cana',
    220,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Brasil'),
    'Rio de Janeiro',
    230,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Brasil'),
    'Iguazú',
    240,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Argentina'),
    'Iguazú',
    250,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Argentina'),
    'Cataratas del Iguazú',
    260,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Chile'),
    'Valparaíso',
    270,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Chile'),
    'Santiago',
    280,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Perú'),
    'Machu Picchu',
    290,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Perú'),
    'Lima',
    300,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Colombia'),
    'Cartagena',
    310,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Colombia'),
    'Santa Marta',
    320,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Ecuador'),
    'Galápagos',
    330,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Ecuador'),
    'Quito',
    340,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Venezuela'),
    'Caracas',
    350,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Venezuela'),
    'Maracaibo',
    360,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Bolivia'),
    'La Paz',
    370,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Bolivia'),
    'Cochabamba',
    380,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Paraguay'),
    'Asunción',
    390,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Paraguay'),
    'Ciudad del Este',
    400,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Uruguay'),
    'Montevideo',
    410,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Uruguay'),
    'Punta del Este',
    420,
    'No'
);

-- Agregar PAISES DE EUROPA

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Madrid',
    430,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Barcelona',
    440,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Francia'),
    'París',
    450,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Francia'),
    'Niza',
    460,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Italia'),
    'Roma',
    470,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Italia'),
    'Venecia',
    480,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Alemania'),
    'Berlín',
    490,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Alemania'),
    'Múnich',
    500,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Portugal'),
    'Lisboa',
    510,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Portugal'),
    'Oporto',
    520,
    'No'
);

-- Ahora de Asia pero que sean lugares no ciudades

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'China'),
    'Gran Muralla',
    530,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'China'),
    'Taj Mahal',
    540,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'India'),
    'Taj Mahal',
    550,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'India'),
    'Templo de Kailash',
    560,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Japón'),
    'Monte Fuji',
    570,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Japón'),
    'Templo de Kailash',
    580,
    'No'
);

-- Ahora de Africa pero que sean lugares no ciudades

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Egipto'),
    'Pirámides de Giza',
    590,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Egipto'),
    'Valle de los Reyes',
    600,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Sudáfrica'),
    'Parque Nacional Kruger',
    610,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Sudáfrica'),
    'Cataratas Victoria',
    620,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Antartica'),
    'Estación Marambio',
    630,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Antartica'),
    'Estación Esperanza',
    640,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Australia'),
    'Gran Barrera de Coral',
    650,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Australia'),
    'Parque Nacional Kakadu',
    660,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Nueva Zelanda'),
    'Parque Nacional Tongariro',
    670,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Nueva Zelanda'),
    'Parque Nacional Fiordland',
    680,
    'No'
);

-- Ahora de colombia pero que sean lugares no ciudades

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Colombia'),
    'Parque Nacional Natural Tayrona',
    690,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Colombia'),
    'Parque Nacional Natural Los Nevados',
    700,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Colombia'),
    'Parque Nacional Natural Los Katíos',
    710,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'Colombia'),
    'Parque Nacional Natural Los Nevados',
    720,
    'No'
);

-- Ahora de Europa pero que sean lugares no ciudades

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Burgos',
    730,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Sevilla',
    740,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Toledo',
    750,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Santiago de Compostela',
    760,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Córdoba',
    770,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de León',
    780,
    'No'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Palma de Mallorca',
    790,
    'Si'
);

INSERT INTO DESTINO_TURISTICO (
    ID_PAIS,
    NOMBRE,
    VALOR_TOUR,
    PATRIMONIO_HUMANIDAD
) VALUES (
    (SELECT ID_PAIS FROM PAIS WHERE NOMBRE = 'España'),
    'Catedral de Santa María de la Sede',
    800,
    'No'
);

-- Ahora de Asia pero que sean lugares no ciudades



-- Cuenta el numero de resgistros unicos en la tabla destino_turistico
SELECT
    COUNT(DISTINCT NOMBRE)
FROM
    DESTINO_TURISTICO;

-- Parece que hay repetidos hay que eliminarlos
DELETE FROM DESTINO_TURISTICO
WHERE
    ID IN (
        SELECT
            MIN(ID)
        FROM
            DESTINO_TURISTICO
        GROUP BY
            NOMBRE
        HAVING
            COUNT(*) > 1
    );

SELECT
    COUNT(DISTINCT NOMBRE)
FROM
    DESTINO_TURISTICO;

-- Crear vista y darle permisos a JLEON

CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_DESTINOS_TURISTICOS AS
    SELECT
        *
    FROM
        DESTINO_TURISTICO;

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_DESTINOS_TURISTICOS TO JLEON;

-- delete view PROYECTO_LOPEZ_JUAN_DESTINOS_TURISTICOS


-- QUERIES:


--Consulta 1 Cuántos destinos turísticos tiene cada continente por país?, liste el nombre del continente, el nombre del país y la cantidad de posibles destinos.
SELECT
    C.NOMBRE     AS NOMBRE_CONTINENTE,
    P.NOMBRE     AS NOMBRE_PAIS,
    COUNT(DT.ID) AS CANTIDAD_DESTINOS
FROM
    CONTINENTE        C
    INNER JOIN PAIS P
    ON C.ID = P.ID_CONTINENTE
    INNER JOIN DESTINO_TURISTICO DT
    ON P.ID_PAIS = DT.ID_PAIS
GROUP BY
    C.NOMBRE,
    P.NOMBRE;

--Crear view
CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_1 AS
    SELECT
        C.NOMBRE     AS NOMBRE_CONTINENTE,
        P.NOMBRE     AS NOMBRE_PAIS,
        COUNT(DT.ID) AS CANTIDAD_DESTINOS
    FROM
        CONTINENTE        C
        INNER JOIN PAIS P
        ON C.ID = P.ID_CONTINENTE
        INNER JOIN DESTINO_TURISTICO DT
        ON P.ID_PAIS = DT.ID_PAIS
    GROUP BY
        C.NOMBRE,
        P.NOMBRE;

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_1 TO JLEON;

--Consulta 2 Cuánto cuesta tomar los tours por las diferentes atracciones en cada país? Liste el nombre del país y el total. En una última fila muestre el total mundial. Asuma que todos los valores están en dólares
SELECT
    P.NOMBRE           AS NOMBRE_PAIS,
    SUM(DT.VALOR_TOUR) AS TOTAL_POR_PAIS
FROM
    PAIS              P
    INNER JOIN DESTINO_TURISTICO DT
    ON P.ID_PAIS = DT.ID_PAIS
GROUP BY
    P.NOMBRE UNION ALL
    SELECT
        'Total Mundial',
        SUM(DT.VALOR_TOUR) AS TOTAL_MUNDIAL
    FROM
        DESTINO_TURISTICO DT;

--Crear view
CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_2 AS
    SELECT
        P.NOMBRE           AS NOMBRE_PAIS,
        SUM(DT.VALOR_TOUR) AS TOTAL_POR_PAIS
    FROM
        PAIS              P
        INNER JOIN DESTINO_TURISTICO DT
        ON P.ID_PAIS = DT.ID_PAIS
    GROUP BY
        P.NOMBRE UNION ALL
        SELECT
            'Total Mundial',
            SUM(DT.VALOR_TOUR) AS TOTAL_MUNDIAL
        FROM
            DESTINO_TURISTICO DT;

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_2 TO JLEON;

--Consulta 3 Cuál es el destino cuyo valor de tour está por encima del valor promedio de los tours dentro del
-- continente al que pertenece el país del destino? Liste el nombre del destino, el continente al que pertenece,
-- el promedio del valor del tour del continente y el valor del tour del destino.


SELECT
    DT.NOMBRE           AS NOMBRE_DESTINO,
    C.NOMBRE            AS NOMBRE_CONTINENTE,
    AVG(DT2.VALOR_TOUR) AS PROMEDIO_CONTINENTE,
    DT.VALOR_TOUR       AS VALOR_DESTINO
FROM
    DESTINO_TURISTICO DT
    INNER JOIN PAIS P
    ON DT.ID_PAIS = P.ID_PAIS
    INNER JOIN CONTINENTE C
    ON P.ID_CONTINENTE = C.ID
    INNER JOIN DESTINO_TURISTICO DT2
    ON P.ID_PAIS = DT2.ID_PAIS
HAVING
    DT.VALOR_TOUR > AVG(DT2.VALOR_TOUR)
GROUP BY
    DT.NOMBRE,
    C.NOMBRE,
    DT.VALOR_TOUR;

--Crear view
CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_3 AS
    SELECT
        DT.NOMBRE           AS NOMBRE_DESTINO,
        C.NOMBRE            AS NOMBRE_CONTINENTE,
        AVG(DT2.VALOR_TOUR) AS PROMEDIO_CONTINENTE,
        DT.VALOR_TOUR       AS VALOR_DESTINO
    FROM
        DESTINO_TURISTICO DT
        INNER JOIN PAIS P
        ON DT.ID_PAIS = P.ID_PAIS
        INNER JOIN CONTINENTE C
        ON P.ID_CONTINENTE = C.ID
        INNER JOIN DESTINO_TURISTICO DT2
        ON P.ID_PAIS = DT2.ID_PAIS
    HAVING
        DT.VALOR_TOUR > AVG(DT2.VALOR_TOUR)
    GROUP BY
        DT.NOMBRE,
        C.NOMBRE,
        DT.VALOR_TOUR;

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_3 TO JLEON;

--Consulta 4  Cuál es el porcentaje de participación de destinos turísticos de cada país en el respectivo continente? El
-- porcentaje de participación se calcula como el número total de destinos turísticos en el país sobre el número
-- total de destinos en el continente. Liste el nombre del país y el porcentaje de participación.

SELECT
    P.NOMBRE AS NOMBRE_PAIS,
    CONCAT(TO_CHAR(COUNT(DT.ID) / (
    SELECT
        COUNT(DT2.ID)
    FROM
        DESTINO_TURISTICO DT2
        INNER JOIN PAIS P2
        ON DT2.ID_PAIS = P2.ID_PAIS
        INNER JOIN CONTINENTE C2
        ON P2.ID_CONTINENTE = C2.ID
    WHERE
        C2.ID = C.ID)*100,
        'fm00D00'),
        '%') AS PORCENTAJE_PARTICIPACION
    FROM
        PAIS P
        INNER JOIN CONTINENTE C
        ON P.ID_CONTINENTE = C.ID
        INNER JOIN DESTINO_TURISTICO DT
        ON P.ID_PAIS = DT.ID_PAIS
    GROUP BY
        P.NOMBRE,
        C.ID;

-- Create view
CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_4 AS
    SELECT
        P.NOMBRE AS NOMBRE_PAIS,
        CONCAT(TO_CHAR(COUNT(DT.ID) / (
        SELECT
            COUNT(DT2.ID)
        FROM
            DESTINO_TURISTICO DT2
            INNER JOIN PAIS P2
            ON DT2.ID_PAIS = P2.ID_PAIS
            INNER JOIN CONTINENTE C2
            ON P2.ID_CONTINENTE = C2.ID
        WHERE
            C2.ID = C.ID)*100,
            'fm00D00'),
            '%') AS PORCENTAJE_PARTICIPACION
        FROM
            PAIS P
            INNER JOIN CONTINENTE C
            ON P.ID_CONTINENTE = C.ID
            INNER JOIN DESTINO_TURISTICO DT
            ON P.ID_PAIS = DT.ID_PAIS
        GROUP BY
            P.NOMBRE,
            C.ID GRANT
            SELECT
                ON PROYECTO_LOPEZ_JUAN_4 TO JLEON
 --consulta 5 ] Qué continente tiene destinos turísticos en todos los países? Liste el nombre del continente.
 -- a. Puede suceder que exista un registro de un país sin destinos turísticos
                SELECT
                    C.NOMBRE AS NOMBRE_CONTINENTE
                FROM
                    CONTINENTE        C
                    LEFT JOIN PAIS P
                    ON C.ID = P.ID_CONTINENTE
                    LEFT JOIN DESTINO_TURISTICO DT
                    ON P.ID_PAIS = DT.ID_PAIS
                GROUP BY
                    C.NOMBRE
                HAVING
                    COUNT(DISTINCT P.ID_CONTINENTE) = COUNT(DISTINCT DT.ID_PAIS)

-- create view
CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_5 AS
    SELECT
        C.NOMBRE AS NOMBRE_CONTINENTE
    FROM
        CONTINENTE        C
        LEFT JOIN PAIS P
        ON C.ID = P.ID_CONTINENTE
        LEFT JOIN DESTINO_TURISTICO DT
        ON P.ID_PAIS = DT.ID_PAIS
    GROUP BY
        C.NOMBRE
    HAVING
        COUNT(DISTINCT P.ID_CONTINENTE) = COUNT(DISTINCT DT.ID_PAIS);

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_5 TO JLEON;

--consulta 6  Obtener el numero de destinos turísticos por continente, que sean patrimonio cultural de la humanidad y que no lo sean.
-- Liste el nombre del continente, el número de destinos turísticos que son patrimonio cultural de la humanidad, el número de destinos
-- turísticos que no son patrimonio cultural de la humanidad y el total de destinos turísticos en el continente.
-- a. Puede suceder que exista un registro de un país sin destinos turísticos




DROP TABLE TURISMO_POR_CONTINENTE;

CREATE TABLE TURISMO_POR_CONTINENTE (
    CONTINENTE VARCHAR(50),
    PATRIMONIO_CULTURAL INTEGER,
    NO_PATRIMONIO_CULTURAL INTEGER,
    TOTAL INTEGER
);

INSERT INTO TURISMO_POR_CONTINENTE (
    CONTINENTE,
    PATRIMONIO_CULTURAL,
    NO_PATRIMONIO_CULTURAL,
    TOTAL
)
    SELECT
        C.NOMBRE                                       AS NOMBRE_CONTINENTE,
        COUNT(DISTINCT DT.ID)                          AS NUMERO_DESTINOS_TURISTICOS_PATRIMONIO,
        COUNT(DISTINCT DT2.ID)                         AS NUMERO_DESTINOS_TURISTICOS_NO_PATRIMONIO,
        COUNT(DISTINCT DT.ID) + COUNT(DISTINCT DT2.ID) AS TOTAL_DESTINOS_TURISTICOS
    FROM
        CONTINENTE        C
        LEFT JOIN PAIS P
        ON C.ID = P.ID_CONTINENTE
        LEFT JOIN DESTINO_TURISTICO DT
        ON P.ID_PAIS = DT.ID_PAIS
        AND DT.PATRIMONIO_HUMANIDAD = 'Si'
        LEFT JOIN DESTINO_TURISTICO DT2
        ON P.ID_PAIS = DT2.ID_PAIS
        AND DT2.PATRIMONIO_HUMANIDAD = 'No'
    GROUP BY
        C.NOMBRE;

SELECT
    *
FROM
    TURISMO_POR_CONTINENTE;

-- create view

CREATE OR REPLACE VIEW PROYECTO_LOPEZ_JUAN_6 AS
    SELECT
        *
    FROM
        TURISMO_POR_CONTINENTE;

GRANT SELECT ON PROYECTO_LOPEZ_JUAN_6 TO JLEON;