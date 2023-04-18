-- Usuarios
CREATE TABLE Usuarios (
    Id_usuario NUMBER PRIMARY KEY,
    NombreUsuario VARCHAR2(100) UNIQUE NOT NULL,
    NombreDePila VARCHAR2(100) NOT NULL,
    Apellido VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL CONSTRAINT check_email CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')),
    Contraseña VARCHAR2(100) NOT NULL,
    TipoDeCuenta VARCHAR2(20) NOT NULL CONSTRAINT check_tipoDeCuenta CHECK (TipoDeCuenta IN ('comprador', 'fotografo', 'visitante')),
    FechaDeCreacion DATE NOT NULL,
    HoraDeCreacion TIMESTAMP NOT NULL,
    Eliminado CHAR(1) NOT NULL CONSTRAINT check_eliminado CHECK (Eliminado IN ('S', 'N'))
);

-- Compras
CREATE TABLE Compras (
    IdUsuario NUMBER NOT NULL,
    IdCarritoCompras NUMBER NOT NULL,
    PrecioTotal NUMBER(10, 2) NOT NULL CONSTRAINT check_precioTotal CHECK (PrecioTotal >= 0),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id_usuario),
    FOREIGN KEY (IdCarritoCompras) REFERENCES CarritoDeCompras(idCarritoCompras)
);

-- Impuestos
CREATE TABLE Impuestos (
    IdImpuesto NUMBER PRIMARY KEY,
    TipoDeImpuesto VARCHAR2(100) NOT NULL,
    Porcentaje NUMBER(5, 2) NOT NULL CONSTRAINT check_porcentaje CHECK (Porcentaje BETWEEN 0 AND 100)
);

-- CarritoDeCompras
CREATE TABLE CarritoDeCompras (
    idCarritoCompras NUMBER PRIMARY KEY,
    fechaDeCompra DATE NOT NULL,
    precio NUMBER(10, 2) NOT NULL CONSTRAINT check_precio CHECK (precio >= 0),
    cantidad NUMBER NOT NULL CONSTRAINT check_cantidad CHECK (cantidad >= 0)
);

-- FotosCarritoCompras
CREATE TABLE FotosCarritoCompras (
    IdCarritoCompras NUMBER NOT NULL,
    IdFoto NUMBER NOT NULL,
    IdTipoDeFoto NUMBER NOT NULL,
    IdTipoDeResolucion NUMBER NOT NULL,
    FOREIGN KEY (IdCarritoCompras) REFERENCES CarritoDeCompras(idCarritoCompras),
    FOREIGN KEY (IdFoto) REFERENCES Fotos(IdFoto),
    FOREIGN KEY (IdTipoDeFoto) REFERENCES TipoDeFoto(IdTipoDeFoto),
    FOREIGN KEY (IdTipoDeResolucion) REFERENCES TipoDeResolucion(IdTipoDeResolucion),
    PRIMARY KEY (IdCarritoCompras, IdFoto, IdTipoDeFoto, IdTipoDeResolucion)
);

-- Ventas
CREATE TABLE Ventas (
    IdVenta NUMBER PRIMARY KEY,
    IdVendedor NUMBER NOT NULL,
    IdEntidadAutorizada NUMBER NOT NULL,
    FechaDeVenta DATE NOT NULL,
    IdImpuestos NUMBER NOT NULL,
    PrecioTotal NUMBER(10, 2) NOT NULL CONSTRAINT check_precioTotalVentas CHECK (PrecioTotal >= 0),
    ComisionDeEseMomento NUMBER(5, 2) NOT NULL CONSTRAINT check_comision CHECK (ComisionDeEseMomento >= 0),
    GananciaFotografo NUMBER(10, 2) NOT NULL CONSTRAINT check_gananciaFotografo CHECK (GananciaFotografo >= 0),
    FOREIGN KEY (IdVendedor) REFERENCES Usuarios(Id_usuario),
    FOREIGN KEY (IdEntidadAutorizada) REFERENCES entidadesAutorizadas(IdEntidadAutorizada),
FOREIGN KEY (IdImpuestos) REFERENCES Impuestos(IdImpuesto)
);

-- Descargas
CREATE TABLE Descargas (
IdUsuario NUMBER NOT NULL,
IdDescarga NUMBER PRIMARY KEY,
IdFoto NUMBER NOT NULL,
IdResolucion NUMBER NOT NULL,
IdTipoDeImagen NUMBER NOT NULL,
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id_usuario),
FOREIGN KEY (IdFoto) REFERENCES Fotos(IdFoto),
FOREIGN KEY (IdResolucion) REFERENCES TipoDeResolucion(IdTipoDeResolucion),
FOREIGN KEY (IdTipoDeImagen) REFERENCES TipoDeFoto(IdTipoDeFoto)
);

-- DetallesVentas
CREATE TABLE DetallesVentas (
IdVenta NUMBER NOT NULL,
IdFoto NUMBER NOT NULL,
IdTipoDeFoto NUMBER NOT NULL,
IdTipoDeResolucion NUMBER NOT NULL,
Cantidad NUMBER NOT NULL CONSTRAINT check_cantidadDetalles CHECK (Cantidad >= 0),
Impuestos NUMBER(10, 2) NOT NULL CONSTRAINT check_impuestosDetalles CHECK (Impuestos >= 0),
PrecioTotal NUMBER(10, 2) NOT NULL CONSTRAINT check_precioTotalDetalles CHECK (PrecioTotal >= 0),
ComisionDeEseMomento NUMBER(5, 2) NOT NULL CONSTRAINT check_comisionDetalles CHECK (ComisionDeEseMomento >= 0),
FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
FOREIGN KEY (IdFoto) REFERENCES Fotos(IdFoto),
FOREIGN KEY (IdTipoDeFoto) REFERENCES TipoDeFoto(IdTipoDeFoto),
FOREIGN KEY (IdTipoDeResolucion) REFERENCES TipoDeResolucion(IdTipoDeResolucion),
PRIMARY KEY (IdVenta, IdFoto, IdTipoDeFoto, IdTipoDeResolucion)
);

-- entidadesAutorizadas
CREATE TABLE entidadesAutorizadas (
IdEntidadAutorizada NUMBER PRIMARY KEY,
NombreEntidad VARCHAR2(100) NOT NULL,
ComisionPorcentaje NUMBER(5, 2) NOT NULL CONSTRAINT check_comisionPorcentaje CHECK (ComisionPorcentaje BETWEEN 0 AND 100)
);

-- Fotos
CREATE TABLE Fotos (
IdFoto NUMBER PRIMARY KEY,
Descripcion VARCHAR2(500) NOT NULL,
Fecha DATE NOT NULL,
IdUbicacion NUMBER NOT NULL,
IdTema NUMBER NOT NULL,
IdUsuario NUMBER NOT NULL,
Eliminado CHAR(1) NOT NULL CONSTRAINT check_eliminadoFotos CHECK (Eliminado IN ('S', 'N')),
FOREIGN KEY (IdUbicacion) REFERENCES Ubicacion(IdUbicacion),
FOREIGN KEY (IdTema) REFERENCES Temas(idTema),
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id_usuario)
);

-- FotoTipoDeFoto
CREATE TABLE FotoTipoDeFoto (
IdFoto NUMBER NOT NULL,
IdTipoDeFoto NUMBER NOT NULL,
FOREIGN KEY (IdFoto) REFERENCES Fotos(IdFoto),
FOREIGN KEY (IdTipoDeFoto) REFERENCES TipoDeFoto(IdTipoDeFoto),
PRIMARY KEY (IdFoto, IdTipoDeFoto)
);

-- TipoDeFoto
CREATE TABLE TipoDeFoto (
IdTipoDeFoto NUMBER PRIMARY KEY,
Formato VARCHAR2(20) NOT NULL,
Ruta_archivo VARCHAR2(500) NOT NULL,
Tamaño NUMBER NOT NULL CONSTRAINT check_tamaño CHECK (Tamaño > 5 * 1024 * 1024)
);

-- Foto_Resolucion
CREATE TABLE Foto_Resolucion (
IdFoto NUMBER NOT NULL,
IdTipoDeResolucion NUMBER NOT NULL,
FOREIGN KEY (IdFoto) REFERENCES Fotos(IdFoto),
FOREIGN KEY (IdTipoDeResolucion) REFERENCES TipoDeResolucion(IdTipoDeResolucion),
PRIMARY KEY (IdFoto, IdTipoDeResolucion)
);

-- TipoDeResolucion
CREATE TABLE TipoDeResolucion (
IdTipoDeResolucion NUMBER PRIMARY KEY,
TipoDeResolucion VARCHAR2(100) NOT NULL,
Precio NUMBER(10, 2) NOT NULL CONSTRAINT check_precioResolucion CHECK (Precio >= 0)
);

-- Ubicacion
CREATE TABLE Ubicacion (
IdUbicacion NUMBER PRIMARY KEY,
IdPais NUMBER NOT NULL,
Departamento VARCHAR2(100) NOT NULL,
Ciudad VARCHAR2(100) NOT NULL,
FOREIGN KEY (IdPais) REFERENCES Pais(IdPais)
);

-- Pais
CREATE TABLE Pais (
IdPais NUMBER PRIMARY KEY,
Nombre VARCHAR2(100) NOT NULL,
Descripcion VARCHAR2(500) NOT NULL
);

-- Historias
CREATE TABLE Historias (
IdHistorias NUMBER PRIMARY KEY,
Historia VARCHAR2(4000) NOT NULL,
IdUsuario NUMBER NOT NULL,
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(Id_usuario)
);

-- Foto_Evento
CREATE TABLE Foto_Evento (
idFoto NUMBER NOT NULL,
idEvento NUMBER NOT NULL,
FOREIGN KEY (idFoto) REFERENCES Fotos(IdFoto),
FOREIGN KEY (idEvento) REFERENCES Evento(idEvento),
PRIMARY KEY (idFoto, idEvento)
);

-- Evento
CREATE TABLE Evento (
idEvento NUMBER PRIMARY KEY,
evento VARCHAR2(100) NOT NULL
);

-- Foto_Temas
CREATE TABLE Foto_Temas (
idFoto NUMBER NOT NULL,
idTema NUMBER NOT NULL,
FOREIGN KEY (idFoto) REFERENCES Fotos(IdFoto),
FOREIGN KEY (idTema) REFERENCES Temas(idTema),
PRIMARY KEY (idFoto, idTema)
);

-- Temas
CREATE TABLE Temas (
idTema NUMBER PRIMARY KEY,
tema VARCHAR2(100) NOT NULL
);


