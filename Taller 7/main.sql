-- Cree la siguiente tabla:

-- Asignaturas (nombre,  nota);

-- La columna nombre es cadena de 50
-- La nota es un numero real positivo
-- La llave primaria es la columna ‘nombre’

CREATE TABLE Asignaturas(
    nombre VARCHAR(50) PRIMARY KEY,
    nota FLOAT
);

-- Otorgue permisos de select a jleon sobre la tabla 

GRANT SELECT ON Asignaturas TO jleon;

-- Insertar los siguientes datos:  Nombre
-- Nota
-- Cálculo
-- 4,5
-- Programación 1
-- 5,0

INSERT INTO Asignaturas VALUES('Cálculo', 4.5);
INSERT INTO Asignaturas VALUES('Programación 1', 5.0);


-- Sin Commit

delete from asignaturas;
INSERT INTO asignaturas (nombre, nota)
VALUES ('bases', 3.5);

-- Con Commit
delete from asignaturas;
INSERT INTO asignaturas (nombre, nota)
VALUES ('bases', 3.5);

commit;