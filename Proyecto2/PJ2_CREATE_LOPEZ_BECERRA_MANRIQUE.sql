-- Usuarios
CREATE TABLE USUARIOS (
    ID_USUARIO NUMBER PRIMARY KEY,
    NOMBREUSUARIO VARCHAR2(100) UNIQUE NOT NULL,
    NOMBREDEPILA VARCHAR2(100) NOT NULL,
    APELLIDO VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL CONSTRAINT CHECK_EMAIL CHECK (REGEXP_LIKE(EMAIL, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')),
    CONTRASEÑA VARCHAR2(100) NOT NULL,
    TIPODECUENTA VARCHAR2(20) NOT NULL CONSTRAINT CHECK_TIPODECUENTA CHECK (TIPODECUENTA IN ('comprador', 'fotografo', 'visitante')),
    FECHADECREACION DATE NOT NULL,
    HORADECREACION TIMESTAMP NOT NULL,
    ELIMINADO CHAR(1) NOT NULL CONSTRAINT CHECK_ELIMINADO CHECK (ELIMINADO IN ('S', 'N'))
);

-- Historias
CREATE TABLE HISTORIAS (
    IDHISTORIAS NUMBER PRIMARY KEY,
    HISTORIA VARCHAR2(4000) NOT NULL,
    IDUSUARIO NUMBER NOT NULL,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(ID_USUARIO)
);

-- Pais1

CREATE TABLE PAIS1 (
    IDPAIS NUMBER PRIMARY KEY,
    NOMBRE VARCHAR2(100) NOT NULL,
    DESCRIPCION VARCHAR2(500) NOT NULL,
    IDHISTORIAS NUMBER,
    FOREIGN KEY (IDHISTORIAS) REFERENCES HISTORIAS(IDHISTORIAS)
);

-- Ubicacion
CREATE TABLE UBICACION (
    IDUBICACION NUMBER PRIMARY KEY,
    IDPAIS NUMBER NOT NULL,
    DEPARTAMENTO VARCHAR2(100) NOT NULL,
    CIUDAD VARCHAR2(100) NOT NULL,
    FOREIGN KEY (IDPAIS) REFERENCES PAIS1(IDPAIS)
);

-- TipoDeFoto
CREATE TABLE TIPODEFOTO (
    IDTIPODEFOTO NUMBER PRIMARY KEY,
    FORMATO VARCHAR2(20) NOT NULL,
    RUTA_ARCHIVO VARCHAR2(500) NOT NULL,
    TAMAÑO NUMBER NOT NULL CONSTRAINT CHECK_TAMAÑO CHECK (TAMAÑO < 5)
);

-- TipoDeResolucion
CREATE TABLE TIPODERESOLUCION (
    IDTIPODERESOLUCION NUMBER PRIMARY KEY,
    TIPODERESOLUCION VARCHAR2(100) NOT NULL,
    PRECIO NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_PRECIORESOLUCION CHECK (PRECIO >= 0)
);

-- Evento
CREATE TABLE EVENTO (
    IDEVENTO NUMBER PRIMARY KEY,
    EVENTO VARCHAR2(100) NOT NULL
);

-- Temas
CREATE TABLE TEMAS (
    IDTEMA NUMBER PRIMARY KEY,
    TEMA VARCHAR2(100) NOT NULL
);

-- entidadesAutorizadas
CREATE TABLE ENTIDADESAUTORIZADAS (
    IDENTIDADAUTORIZADA NUMBER PRIMARY KEY,
    NOMBREENTIDAD VARCHAR2(100) NOT NULL,
    COMISIONPORCENTAJE NUMBER(5, 2) NOT NULL CONSTRAINT CHECK_COMISIONPORCENTAJE CHECK (COMISIONPORCENTAJE BETWEEN 0 AND 100)
);

-- Impuestos

CREATE TABLE IMPUESTOS (
    IDIMPUESTO NUMBER PRIMARY KEY,
    TIPODEIMPUESTO VARCHAR2(100) NOT NULL,
    PORCENTAJE NUMBER(5, 2) NOT NULL CONSTRAINT CHECK_PORCENTAJE CHECK (PORCENTAJE BETWEEN 0 AND 100)
);

-- CarritoDeCompras

CREATE TABLE CARRITODECOMPRAS (
    IDCARRITOCOMPRAS NUMBER PRIMARY KEY,
    FECHADECOMPRA DATE NOT NULL,
    PRECIO NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_PRECIO CHECK (PRECIO >= 0),
    CANTIDAD NUMBER NOT NULL CONSTRAINT CHECK_CANTIDAD CHECK (CANTIDAD >= 0)
);

-- Fotos
CREATE TABLE FOTOS (
    IDFOTO NUMBER PRIMARY KEY,
    DESCRIPCION VARCHAR2(500) NOT NULL,
    FECHA DATE NOT NULL,
    IDUBICACION NUMBER NOT NULL,
    IDTEMA NUMBER NOT NULL,
    IDUSUARIO NUMBER NOT NULL,
    CANTIDADVISTAS NUMBER,
    ELIMINADO CHAR(1) NOT NULL CONSTRAINT CHECK_ELIMINADOFOTOS CHECK (ELIMINADO IN ('S', 'N')),
    FOREIGN KEY (IDUBICACION) REFERENCES UBICACION(IDUBICACION),
    FOREIGN KEY (IDTEMA) REFERENCES TEMAS(IDTEMA),
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(ID_USUARIO)
);

-- Compras
CREATE TABLE COMPRAS (
    IDUSUARIO NUMBER NOT NULL,
    IDCARRITOCOMPRAS NUMBER NOT NULL,
    PRECIOTOTAL NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_PRECIOTOTAL CHECK (PRECIOTOTAL >= 0),
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(ID_USUARIO),
    FOREIGN KEY (IDCARRITOCOMPRAS) REFERENCES CARRITODECOMPRAS(IDCARRITOCOMPRAS)
);

-- Ventas
CREATE TABLE VENTAS (
    IDVENTA NUMBER PRIMARY KEY,
    IDVENDEDOR NUMBER NOT NULL,
    IDENTIDADAUTORIZADA NUMBER NOT NULL,
    FECHADEVENTA DATE NOT NULL,
    IDIMPUESTOS NUMBER NOT NULL,
    PRECIOTOTAL NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_PRECIOTOTALVENTAS CHECK (PRECIOTOTAL >= 0),
    COMISIONDEESEMOMENTO NUMBER(5, 2) NOT NULL CONSTRAINT CHECK_COMISION CHECK (COMISIONDEESEMOMENTO >= 0),
    GANANCIAFOTOGRAFO NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_GANANCIAFOTOGRAFO CHECK (GANANCIAFOTOGRAFO >= 0),
    FOREIGN KEY (IDVENDEDOR) REFERENCES USUARIOS(ID_USUARIO),
    FOREIGN KEY (IDENTIDADAUTORIZADA) REFERENCES ENTIDADESAUTORIZADAS(IDENTIDADAUTORIZADA),
    FOREIGN KEY (IDIMPUESTOS) REFERENCES IMPUESTOS(IDIMPUESTO)
);

-- FotoTipoDeFoto
CREATE TABLE FOTOTIPODEFOTO (
    IDFOTO NUMBER NOT NULL,
    IDTIPODEFOTO NUMBER NOT NULL,
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDTIPODEFOTO) REFERENCES TIPODEFOTO(IDTIPODEFOTO),
    PRIMARY KEY (IDFOTO, IDTIPODEFOTO)
);

-- Foto_Resolucion
CREATE TABLE FOTO_RESOLUCION (
    IDFOTO NUMBER NOT NULL,
    IDTIPODERESOLUCION NUMBER NOT NULL,
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDTIPODERESOLUCION) REFERENCES TIPODERESOLUCION(IDTIPODERESOLUCION),
    PRIMARY KEY (IDFOTO, IDTIPODERESOLUCION)
);

-- Foto_Evento
CREATE TABLE FOTO_EVENTO (
    IDFOTO NUMBER NOT NULL,
    IDEVENTO NUMBER NOT NULL,
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDEVENTO) REFERENCES EVENTO(IDEVENTO),
    PRIMARY KEY (IDFOTO, IDEVENTO)
);

-- Foto_Temas
CREATE TABLE FOTO_TEMAS (
    IDFOTO NUMBER NOT NULL,
    IDTEMA NUMBER NOT NULL,
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDTEMA) REFERENCES TEMAS(IDTEMA),
    PRIMARY KEY (IDFOTO, IDTEMA)
);

-- FotosCarritoCompras
CREATE TABLE FOTOSCARRITOCOMPRAS (
    IDCARRITOCOMPRAS NUMBER NOT NULL,
    IDFOTO NUMBER NOT NULL,
    IDTIPODEFOTO NUMBER NOT NULL,
    IDTIPODERESOLUCION NUMBER NOT NULL,
    FOREIGN KEY (IDCARRITOCOMPRAS) REFERENCES CARRITODECOMPRAS(IDCARRITOCOMPRAS),
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDTIPODEFOTO) REFERENCES TIPODEFOTO(IDTIPODEFOTO),
    FOREIGN KEY (IDTIPODERESOLUCION) REFERENCES TIPODERESOLUCION(IDTIPODERESOLUCION),
    PRIMARY KEY (IDCARRITOCOMPRAS, IDFOTO, IDTIPODEFOTO, IDTIPODERESOLUCION)
);

-- DetallesVentas
CREATE TABLE DETALLESVENTAS (
    IDVENTA NUMBER NOT NULL,
    IDFOTO NUMBER NOT NULL,
    IDTIPODEFOTO NUMBER NOT NULL,
    IDTIPODERESOLUCION NUMBER NOT NULL,
    CANTIDAD NUMBER NOT NULL CONSTRAINT CHECK_CANTIDADDETALLES CHECK (CANTIDAD >= 0),
    IMPUESTOS NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_IMPUESTOSDETALLES CHECK (IMPUESTOS >= 0),
    PRECIOTOTAL NUMBER(10, 2) NOT NULL CONSTRAINT CHECK_PRECIOTOTALDETALLES CHECK (PRECIOTOTAL >= 0),
    COMISIONDEESEMOMENTO NUMBER(5, 2) NOT NULL CONSTRAINT CHECK_COMISIONDETALLES CHECK (COMISIONDEESEMOMENTO >= 0),
    FOREIGN KEY (IDVENTA) REFERENCES VENTAS(IDVENTA),
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDTIPODEFOTO) REFERENCES TIPODEFOTO(IDTIPODEFOTO),
    FOREIGN KEY (IDTIPODERESOLUCION) REFERENCES TIPODERESOLUCION(IDTIPODERESOLUCION),
    PRIMARY KEY (IDVENTA, IDFOTO, IDTIPODEFOTO, IDTIPODERESOLUCION)
);

-- Descargas
CREATE TABLE DESCARGAS (
    IDUSUARIO NUMBER NOT NULL,
    IDDESCARGA NUMBER PRIMARY KEY,
    IDFOTO NUMBER NOT NULL,
    IDRESOLUCION NUMBER NOT NULL,
    IDTIPODEIMAGEN NUMBER NOT NULL,
    FOREIGN KEY (IDUSUARIO) REFERENCES USUARIOS(ID_USUARIO),
    FOREIGN KEY (IDFOTO) REFERENCES FOTOS(IDFOTO),
    FOREIGN KEY (IDRESOLUCION) REFERENCES TIPODERESOLUCION(IDTIPODERESOLUCION),
    FOREIGN KEY (IDTIPODEIMAGEN) REFERENCES TIPODEFOTO(IDTIPODEFOTO)
);