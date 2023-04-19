-- Tabla Pais1
INSERT INTO Pais1
(IdPais1, Nombre, Descripcion)
VALUES
(1, 'Pais A', 'Descripcion A', 1);

INSERT INTO Pais1
(IdPais1, Nombre, Descripcion)
VALUES
(2, 'Pais B', 'Descripcion B', 2);

-- Tabla Ubicacion
INSERT INTO Ubicacion
(IdUbicacion, IdPais1, Departamento, Ciudad)
VALUES
(1, 1, 'Departamento A', 'Ciudad A');

INSERT INTO Ubicacion
(IdUbicacion, IdPais1, Departamento, Ciudad)
VALUES
(2, 2, 'Departamento B', 'Ciudad B');

-- Creando Usuarios
INSERT INTO Usuarios
(Id_usuario, NombreUsuario, NombreDePila, Apellido, Email, Contraseña, TipoDeCuenta, FechaDeCreacion, HoraDeCreacion, Eliminado)
VALUES
(1, 'usuario1', 'Nombre1', 'Apellido1', 'usuario1@example.com', 'password1', 'comprador', TO_DATE('2021-06-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2021-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

INSERT INTO Usuarios
(Id_usuario, NombreUsuario, NombreDePila, Apellido, Email, Contraseña, TipoDeCuenta, FechaDeCreacion, HoraDeCreacion, Eliminado)
VALUES
(2, 'usuario2', 'Nombre2', 'Apellido2', 'usuario2@example.com', 'password2', 'fotografo', TO_DATE('2021-07-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2021-07-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'N');

--Insertando tipo de foto
INSERT INTO TipoDeFoto
(IdTipoDeFoto, Formato, Ruta_archivo, Tamaño)
VALUES
(1, 'JPEG', 'ruta/archivo1.jpg', 100000);

INSERT INTO TipoDeFoto
(IdTipoDeFoto, Formato, Ruta_archivo, Tamaño)
VALUES
(2, 'PNG', 'ruta/archivo2.png', 200000);

-- TipoDeResolucion
INSERT INTO TipoDeResolucion
(IdTipoDeResolucion, TipoDeResolucion, Precio)
VALUES
(1, 'Resolucion A', 1);

INSERT INTO TipoDeResolucion
(IdTipoDeResolucion, TipoDeResolucion, Precio)
VALUES
(2, 'Resolucion B', 2);

-- tabla Evento
INSERT INTO Evento
(idEvento, evento)
VALUES
(1, 'Evento 1');

INSERT INTO Evento
(idEvento, evento)
VALUES
(2, 'Evento 2');

--  Temas
INSERT INTO Temas
(idTema, Tema)
VALUES
(1, 'Tema 1');

INSERT INTO Temas
(idTema, Tema)
VALUES
(2, 'Tema 2');

-- entidadesAutorizadas
INSERT INTO entidadesAutorizadas
(IdEntidadAutorizada, NombreEntidad, ComisionPorcentaje)
VALUES
(1, 'VISA', 10);

INSERT INTO entidadesAutorizadas
(IdEntidadAutorizada, NombreEntidad, ComisionPorcentaje)
VALUES
(2, 'MASTER CARD', 10);

INSERT INTO entidadesAutorizadas
(IdEntidadAutorizada, NombreEntidad, ComisionPorcentaje)
VALUES
(2, 'Entidad B', 15);

-- Impuestos
INSERT INTO Impuestos
(IdImpuesto, TipoDeImpuesto, Porcentaje)
VALUES
(1, 'Impuesto A', 5);

INSERT INTO Impuestos
(IdImpuesto, TipoDeImpuesto, Porcentaje)
VALUES
(2, 'Impuesto B', 10);

--  Fotos
INSERT INTO Fotos
(IdFoto, Descripcion, Fecha, IdUbicacion, IdTema, IdUsuario, Eliminado)
VALUES
(1, 'Descripcion Foto 1', TO_DATE('2021-08-01', 'YYYY-MM-DD'), 1, 1, 2, 'N');

INSERT INTO Fotos
(IdFoto, Descripcion, Fecha, IdUbicacion, IdTema, IdUsuario, Eliminado)
VALUES
(2, 'Descripcion Foto 2', TO_DATE('2021-09-01', 'YYYY-MM-DD'), 2, 2, 2, 'N');

-- CarritoDeCompras
INSERT INTO CarritoDeCompras
(idCarritoCompras, fechaDeCompra, precio, cantidad)
VALUES
(1, TO_DATE('2021-10-01', 'YYYY-MM-DD'), 300, 1);

INSERT INTO CarritoDeCompras
(idCarritoCompras, fechaDeCompra, precio, cantidad)
VALUES
(2, TO_DATE('2021-11-01', 'YYYY-MM-DD'), 400, 1);

--  Compras
INSERT INTO Compras
(IdUsuario, IdCarritoCompras, PrecioTotal)
VALUES
(1, 1, 300);

INSERT INTO Compras
(IdUsuario, IdCarritoCompras, PrecioTotal)
VALUES
(1, 2, 400);

-- Ventas
INSERT INTO Ventas
(IdVenta, IdVendedor, IdEntidadAutorizada, FechaDeVenta, IdImpuestos, PrecioTotal, ComisionDeEseMomento, GananciaFotografo)
VALUES
(1, 2, 1, TO_DATE('2021-12-01', 'YYYY-MM-DD'), 1, 300, 10, 270);

--  Historias
INSERT INTO Historias
(IdHistorias, Historia, IdUsuario)
VALUES
(1, 'Historia 1', 2);

-- Insertando datos en las tablas de relación (estos valores deben coincidir con los datos ya ingresados)
INSERT INTO FotoTipoDeFoto
(IdFoto, IdTipoDeFoto)
VALUES
(1, 1);

INSERT INTO FotoTipoDeFoto
(IdFoto, IdTipoDeFoto)
VALUES
(2, 2);

INSERT INTO Foto_Resolucion
(IdFoto, IdTipoDeResolucion)
VALUES
(1, 1);

INSERT INTO Foto_Resolucion
(IdFoto, IdTipoDeResolucion)
VALUES
(2, 2);

INSERT INTO Foto_Evento
(idFoto, idEvento)
VALUES
(1, 1);

INSERT INTO Foto_Evento
(idFoto, idEvento)
VALUES
(2, 2);

INSERT INTO Fotos_CarritoCompras
(IdFoto, IdCarritoCompras)
VALUES
(1, 1);

INSERT INTO Fotos_CarritoCompras
(IdFoto, IdCarritoCompras)
VALUES
(2, 2);

