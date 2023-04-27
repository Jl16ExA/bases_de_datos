-- Tabla Pais1
INSERT INTO PAIS1 (
    IDPAIS,
    NOMBRE,
    DESCRIPCION, IDHISTORIAS
) VALUES (
    1,
    'Pais A',
    'Descripcion A',
    1
);

INSERT INTO PAIS1 (
    IDPAIS,
    NOMBRE,
    DESCRIPCION, IDHISTORIAS
) VALUES (
    2,
    'Pais B',
    'Descripcion B',
    1
);

-- Tabla Ubicacion
INSERT INTO UBICACION (
    IDUBICACION,
    IDPAIS,
    DEPARTAMENTO,
    CIUDAD
) VALUES (
    1,
    1,
    'Departamento A',
    'Ciudad A'
);

INSERT INTO UBICACION (
    IDUBICACION,
    IDPAIS,
    DEPARTAMENTO,
    CIUDAD
) VALUES (
    2,
    2,
    'Departamento B',
    'Ciudad B'
);

-- Creando Usuarios
INSERT INTO USUARIOS (
    ID_USUARIO,
    NOMBREUSUARIO,
    NOMBREDEPILA,
    APELLIDO,
    EMAIL,
    CONTRASEÑA,
    TIPODECUENTA,
    FECHADECREACION,
    HORADECREACION,
    ELIMINADO
) VALUES (
    1,
    'usuario1',
    'Nombre1',
    'Apellido1',
    'usuario1@example.com',
    'password1',
    'comprador',
    TO_DATE('2021-06-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2021-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

INSERT INTO USUARIOS (
    ID_USUARIO,
    NOMBREUSUARIO,
    NOMBREDEPILA,
    APELLIDO,
    EMAIL,
    CONTRASEÑA,
    TIPODECUENTA,
    FECHADECREACION,
    HORADECREACION,
    ELIMINADO
) VALUES (
    2,
    'usuario2',
    'Nombre2',
    'Apellido2',
    'usuario2@example.com',
    'password2',
    'fotografo',
    TO_DATE('2021-07-01', 'YYYY-MM-DD'),
    TO_TIMESTAMP('2021-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    'N'
);

--Insertando tipo de foto
INSERT INTO TIPODEFOTO (
    IDTIPODEFOTO,
    FORMATO,
    RUTA_ARCHIVO,
    TAMAÑO
) VALUES (
    1,
    'JPEG',
    'ruta/archivo1.jpg',
    1
);

INSERT INTO TIPODEFOTO (
    IDTIPODEFOTO,
    FORMATO,
    RUTA_ARCHIVO,
    TAMAÑO
) VALUES (
    2,
    'PNG',
    'ruta/archivo2.png',
    2
);

-- TipoDeResolucion
INSERT INTO TIPODERESOLUCION (
    IDTIPODERESOLUCION,
    TIPODERESOLUCION,
    PRECIO
) VALUES (
    1,
    'Resolucion A',
    1
);

INSERT INTO TIPODERESOLUCION (
    IDTIPODERESOLUCION,
    TIPODERESOLUCION,
    PRECIO
) VALUES (
    2,
    'Resolucion B',
    2
);

-- tabla Evento
INSERT INTO EVENTO (
    IDEVENTO,
    EVENTO
) VALUES (
    1,
    'Evento 1'
);

INSERT INTO EVENTO (
    IDEVENTO,
    EVENTO
) VALUES (
    2,
    'Evento 2'
);

--  Temas
INSERT INTO TEMAS (
    IDTEMA,
    TEMA
) VALUES (
    1,
    'Tema 1'
);

INSERT INTO TEMAS (
    IDTEMA,
    TEMA
) VALUES (
    2,
    'Tema 2'
);

-- entidadesAutorizadas
INSERT INTO ENTIDADESAUTORIZADAS (
    IDENTIDADAUTORIZADA,
    NOMBREENTIDAD,
    COMISIONPORCENTAJE
) VALUES (
    1,
    'VISA',
    10
);

INSERT INTO ENTIDADESAUTORIZADAS (
    IDENTIDADAUTORIZADA,
    NOMBREENTIDAD,
    COMISIONPORCENTAJE
) VALUES (
    2,
    'MASTER CARD',
    10
);

INSERT INTO ENTIDADESAUTORIZADAS (
    IDENTIDADAUTORIZADA,
    NOMBREENTIDAD,
    COMISIONPORCENTAJE
) VALUES (
    2,
    'Entidad B',
    15
);

-- Impuestos
INSERT INTO IMPUESTOS (
    IDIMPUESTO,
    TIPODEIMPUESTO,
    PORCENTAJE
) VALUES (
    1,
    'Impuesto A',
    5
);

INSERT INTO IMPUESTOS (
    IDIMPUESTO,
    TIPODEIMPUESTO,
    PORCENTAJE
) VALUES (
    2,
    'Impuesto B',
    10
);

--  Fotos
INSERT INTO FOTOS (
    IDFOTO,
    DESCRIPCION,
    FECHA,
    IDUBICACION,
    IDTEMA,
    IDUSUARIO,
    ELIMINADO
) VALUES (
    1,
    'Descripcion Foto 1',
    TO_DATE('2021-08-01', 'YYYY-MM-DD'),
    1,
    1,
    2,
    'N',
    4
);


INSERT INTO FOTOS (
    IDFOTO,
    DESCRIPCION,
    FECHA,
    IDUBICACION,
    IDTEMA,
    IDUSUARIO,
    ELIMINADO,
    CANTIDADVISTAS
) VALUES (
    2,
    'Descripcion Foto 2',
    TO_DATE('2021-09-01', 'YYYY-MM-DD'),
    2,
    2,
    2,
    'N',
    100
);

-- CarritoDeCompras
INSERT INTO CARRITODECOMPRAS (
    IDCARRITOCOMPRAS,
    FECHADECOMPRA,
    PRECIO,
    CANTIDAD
) VALUES (
    1,
    TO_DATE('2021-10-01', 'YYYY-MM-DD'),
    300,
    1
);


INSERT INTO CARRITODECOMPRAS (
    IDCARRITOCOMPRAS,
    FECHADECOMPRA,
    PRECIO,
    CANTIDAD
) VALUES (
    2,
    TO_DATE('2021-11-01', 'YYYY-MM-DD'),
    400,
    1
);

--  Compras
INSERT INTO COMPRAS (
    IDUSUARIO,
    IDCARRITOCOMPRAS,
    PRECIOTOTAL
) VALUES (
    1,
    1,
    300
);

INSERT INTO COMPRAS (
    IDUSUARIO,
    IDCARRITOCOMPRAS,
    PRECIOTOTAL
) VALUES (
    1,
    2,
    400
);

-- Ventas
INSERT INTO VENTAS (
    IDVENTA,
    IDVENDEDOR,
    IDENTIDADAUTORIZADA,
    FECHADEVENTA,
    IDIMPUESTOS,
    PRECIOTOTAL,
    COMISIONDEESEMOMENTO,
    GANANCIAFOTOGRAFO
) VALUES (
    1,
    2,
    1,
    TO_DATE('2021-12-01', 'YYYY-MM-DD'),
    1,
    300,
    10,
    270
);

--  Historias
INSERT INTO HISTORIAS (
    IDHISTORIAS,
    HISTORIA,
    IDUSUARIO
) VALUES (
    1,
    'Historia 1',
    2
);

-- Insertando datos en las tablas de relación (estos valores deben coincidir con los datos ya ingresados)
INSERT INTO FOTOTIPODEFOTO (
    IDFOTO,
    IDTIPODEFOTO
) VALUES (
    1,
    1
);

INSERT INTO FOTOTIPODEFOTO (
    IDFOTO,
    IDTIPODEFOTO
) VALUES (
    2,
    2
);

INSERT INTO FOTO_RESOLUCION (
    IDFOTO,
    IDTIPODERESOLUCION
) VALUES (
    1,
    1
);

INSERT INTO FOTO_RESOLUCION (
    IDFOTO,
    IDTIPODERESOLUCION
) VALUES (
    2,
    2
);

INSERT INTO FOTO_EVENTO (
    IDFOTO,
    IDEVENTO
) VALUES (
    1,
    1
);

INSERT INTO FOTO_EVENTO (
    IDFOTO,
    IDEVENTO
) VALUES (
    2,
    2
);

INSERT INTO FOTOSCARRITOCOMPRAS (
    IDFOTO,
    IDCARRITOCOMPRAS,
    IDTIPODEFOTO,
    IDTIPODERESOLUCION
) VALUES (
    1,
    1,
    1,
    1
);

INSERT INTO FOTOSCARRITOCOMPRAS (
    IDFOTO,
    IDCARRITOCOMPRAS,
    IDTIPODEFOTO,
    IDTIPODERESOLUCION
) VALUES (
    2,
    2,
    2,
    2
);