-- Usuarios
INSERT INTO Usuarios (Id_usuario, NombreUsuario, NombreDePila, Apellido, Email, Contraseña, TipoDeCuenta, FechaDeCreacion, HoraDeCreacion, Eliminado)
VALUES (1, 'user123', 'Juan', 'Pérez', 'juan.perez@email.com', 'password123', 'comprador', TO_DATE('2023-04-18', 'YYYY-MM-DD'), TO_TIMESTAMP('12:30:00', 'HH24:MI:SS'), 'N');

INSERT INTO Usuarios (Id_usuario, NombreUsuario, NombreDePila, Apellido, Email, Contraseña, TipoDeCuenta, FechaDeCreacion, HoraDeCreacion, Eliminado)
VALUES (2, 'photographer456', 'Maria', 'Garcia', 'maria.garcia@email.com', 'mypassword456', 'fotografo', TO_DATE('2023-04-15', 'YYYY-MM-DD'), TO_TIMESTAMP('14:45:00', 'HH24:MI:SS'), 'N');

-- Impuestos
INSERT INTO Impuestos (IdImpuesto, TipoDeImpuesto, Porcentaje)
VALUES (1, 'IVA', 21);

-- EntidadesAutorizadas
INSERT INTO EntidadesAutorizadas (IdEntidadAutorizada, NombreEntidad, ComisionPorcentaje)
VALUES (1, 'PayPal', 2.9);

-- Pais
INSERT INTO Pais (IdPais, Nombre, Descripcion)
VALUES (1, 'España', 'Un país europeo con una rica historia y cultura.');

-- Historias
INSERT INTO Historias (IdHistorias, Historia, IdUsuario)
VALUES (1, 'Mi viaje a Barcelona fue increíble. La arquitectura y la comida eran impresionantes.', 1);

-- Temas
INSERT INTO Temas (idTema, tema)
VALUES (1, 'Naturaleza');

-- TipoDeResolucion
INSERT INTO TipoDeResolucion (IdTipoDeResolucion, TipoDeResolucion, Precio)
VALUES (1, 'Alta resolución', 10);

-- Fotos
INSERT INTO Fotos (IdFoto, Descripcion, Fecha, IdUbicacion, IdTema, IdUsuario, Eliminado)
VALUES (1, 'Hermosa vista del atardecer en la playa', TO_DATE('2023-01-20', 'YYYY-MM-DD'), 1, 1, 2, 'N');

-- FotoTipoDeFoto
INSERT INTO FotoTipoDeFoto (IdFoto, IdTipoDeFoto)
VALUES (1, 1);

-- TipoDeFoto
INSERT INTO TipoDeFoto (IdTipoDeFoto, Formato, Ruta_archivo, Tamaño)
VALUES (1, 'JPEG', '/ruta/imagen1.jpg', 3.5);

-- Foto_Resolucion
INSERT INTO Foto_Resolucion (IdFoto, IdTipoDeResolucion)
VALUES (1, 1);

