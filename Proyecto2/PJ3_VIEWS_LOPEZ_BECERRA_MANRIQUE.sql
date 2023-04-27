-- 1 Cantidad Total de fotos vendidas por fotógrafo por períodos (mes, año)
CREATE OR REPLACE VIEW vw_fotos_vendidas_por_periodo AS
SELECT u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM') as Periodo, COUNT(*) as TotalFotosVendidas
FROM Usuarios u, Ventas v, DetallesVentas dv
WHERE u.Id_usuario = v.IdVendedor AND v.IdVenta = dv.IdVenta
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM')
ORDER BY Periodo, TotalFotosVendidas DESC;
GRANT SELECT ON vw_fotos_vendidas_por_periodo TO jleon;

-- 2 Suma total pagada a los fotógrafos por las ventas de sus fotos
CREATE OR REPLACE VIEW vw_total_pagado_fotografos AS
SELECT u.Id_usuario, u.NombreDePila, u.Apellido, SUM(v.GananciaFotografo) as TotalPagado
FROM Usuarios u, Ventas v
WHERE u.Id_usuario = v.IdVendedor
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido;
GRANT SELECT ON vw_total_pagado_fotografos TO jleon;

-- 3 Suma total de ganancias que la empresa obtiene por la venta de fotos, por períodos, por fotógrafos.
CREATE OR REPLACE VIEW vw_ganancias_empresa_por_periodo AS
SELECT u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM') as Periodo, SUM(v.PrecioTotal - v.GananciaFotografo) as GananciaEmpresa
FROM Usuarios u, Ventas v
WHERE u.Id_usuario = v.IdVendedor
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM')
ORDER BY Periodo, GananciaEmpresa DESC;
GRANT SELECT ON vw_ganancias_empresa_por_periodo TO jleon;

-- 4 Suma y cantidad de fotos compradas por comprador, por período.
CREATE OR REPLACE VIEW vw_fotos_compradas_por_periodo AS
SELECT u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(c.fechaDeCompra, 'YYYY-MM') as Periodo, COUNT(*) as CantidadFotos, SUM(c.precio) as TotalPagado
FROM Usuarios u, CarritoDeCompras c, FotosCarritoCompras fc
WHERE u.Id_usuario = c.idCarritoCompras AND c.idCarritoCompras = fc.IdCarritoCompras
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(c.fechaDeCompra, 'YYYY-MM')
ORDER BY Periodo, TotalPagado DESC;
GRANT SELECT ON vw_fotos_compradas_por_periodo TO jleon;

-- 5 Número total de fotos que se tienen por país, ubicación, sujeto, tema, evento
CREATE OR REPLACE VIEW vw_total_fotos_por_categoria AS
SELECT p.Nombre as Pais1, u.Ciudad, t.tema, e.evento, COUNT(*) as TotalFotos
FROM Fotos f, Ubicacion u, Pais1 p, Foto_Temas ft, Temas t, Foto_Evento fe, Evento e
WHERE f.IdUbicacion = u.IdUbicacion AND u.IdPais = p.IdPais AND f.IdFoto = ft.idFoto AND ft.idTema = t.idTema AND f.IdFoto = fe.idFoto AND fe.idEvento = e.idEvento
GROUP BY p.Nombre, u.Ciudad, t.tema, e.evento
ORDER BY TotalFotos DESC;
GRANT SELECT ON vw_total_fotos_por_categoria TO jleon;

-- 6 Tráfico generado en la red (número de descargas hechas multiplicado por el tamaño de la imagen), por período.
CREATE OR REPLACE VIEW vw_trafico_generado_por_periodo AS
SELECT TO_CHAR(d.IdDescarga, 'YYYY-MM') as Periodo, SUM(tfd.Tamaño * descargas_count) as TraficoGenerado
FROM Descargas d, FotoTipoDeFoto ftf, TipoDeFoto tfd,
     (SELECT IdFoto, COUNT(*) as descargas_count
      FROM Descargas
      GROUP BY IdFoto) d_count
WHERE d.IdFoto = ftf.IdFoto AND ftf.IdTipoDeFoto = tfd.IdTipoDeFoto
      AND d.IdFoto = d_count.IdFoto
GROUP BY TO_CHAR(d.IdDescarga, 'YYYY-MM')
ORDER BY Periodo;
GRANT SELECT ON vw_trafico_generado_por_periodo TO jleon;

-- 7 Reporte de pagos por período, por entidad autorizadora.
CREATE OR REPLACE VIEW vw_pagos_por_entidad_por_periodo AS
SELECT ea.NombreEntidad, TO_CHAR(v.FechaDeVenta, 'YYYY-MM') as Periodo, SUM(v.PrecioTotal) as TotalPagado
FROM Ventas v, entidadesAutorizadas ea
WHERE v.IdEntidadAutorizada = ea.IdEntidadAutorizada
GROUP BY ea.NombreEntidad, TO_CHAR(v.FechaDeVenta, 'YYYY-MM')
ORDER BY Periodo, TotalPagado DESC;
GRANT SELECT ON vw_pagos_por_entidad_por_periodo TO jleon;

-- 8 Reporte de Impuestos que se deben pagar por cada foto vendida. Retefuente (7%), IVA(16%), ICA(6%), etc..
CREATE OR REPLACE VIEW vw_impuestos_por_foto AS
SELECT dv.IdFoto, i.TipoDeImpuesto, SUM(dv.PrecioTotal * i.Porcentaje / 100) as TotalImpuesto
FROM DetallesVentas dv, Impuestos i
WHERE dv.Impuestos = i.IdImpuesto
GROUP BY dv.IdFoto, i.TipoDeImpuesto
ORDER BY TotalImpuesto DESC;
GRANT SELECT ON vw_impuestos_por_foto TO jleon;

-- 9 Reporte de comisiones a las entidades autorizadoras (porcentaje sobre el precio de venta de las fotos).
CREATE OR REPLACE VIEW vw_comisiones_entidades_autorizadoras AS
SELECT ea.NombreEntidad, SUM(v.ComisionDeEseMomento) as TotalComisiones
FROM Ventas v, entidadesAutorizadas ea
WHERE v.IdEntidadAutorizada = ea.IdEntidadAutorizada
GROUP BY ea.NombreEntidad
ORDER BY TotalComisiones DESC;
GRANT SELECT ON vw_comisiones_entidades_autorizadoras TO jleon;


-- 10 ¿Cuáles son las fotos más vendidas?
CREATE OR REPLACE VIEW vw_fotos_mas_vendidas AS
SELECT f.IdFoto, f.Descripcion, COUNT(*) as TotalVendido
FROM Fotos f, DetallesVentas dv
WHERE f.IdFoto = dv.IdFoto
GROUP BY f.IdFoto, f.Descripcion
ORDER BY TotalVendido DESC;
GRANT SELECT ON vw_fotos_mas_vendidas TO jleon;

--11 ¿De qué país se venden más fotos?
CREATE OR REPLACE VIEW vw_pais_mas_fotos_vendidas AS
SELECT p.Nombre as Pais1, COUNT(*) as TotalVendido
FROM Fotos f, Ubicacion u, Pais1 p, DetallesVentas dv
WHERE f.IdUbicacion = u.IdUbicacion AND u.IdPais = p.IdPais AND f.IdFoto = dv.IdFoto
GROUP BY p.Nombre
ORDER BY TotalVendido DESC;
GRANT SELECT ON vw_pais_mas_fotos_vendidas TO jleon;

--12 ¿De qué evento se venden más fotos?
CREATE OR REPLACE VIEW vw_evento_mas_fotos_vendidas AS
SELECT e.evento, COUNT(*) as TotalVendido
FROM Fotos f, Foto_Evento fe, Evento e, DetallesVentas dv
WHERE f.IdFoto = fe.idFoto AND fe.idEvento = e.idEvento AND f.IdFoto = dv.IdFoto
GROUP BY e.evento
ORDER BY TotalVendido DESC;
GRANT SELECT ON vw_evento_mas_fotos_vendidas TO jleon;

-- 13 ¿En qué temporada se venden más fotos?
-- Suponiendo que la temporada se basa en trimestres
CREATE OR REPLACE VIEW vw_temporada_mas_fotos_vendidas AS
SELECT TO_CHAR(v.FechaDeVenta, 'YYYY') || ' Q' || TO_CHAR(v.FechaDeVenta, 'Q') as Temporada, COUNT(*) as TotalVendido
FROM Ventas v, DetallesVentas dv
WHERE v.IdVenta = dv.IdVenta
GROUP BY TO_CHAR(v.FechaDeVenta, 'YYYY') || ' Q' || TO_CHAR(v.FechaDeVenta, 'Q')
ORDER BY TotalVendido DESC;
GRANT SELECT ON vw_temporada_mas_fotos_vendidas TO jleon;


-- Check 
-- 14 ¿Cuáles son las fotos más vistas por los visitantes?
CREATE OR REPLACE VIEW vw_fotos_mas_vistas AS
SELECT f.IdFoto, f.Descripcion, f.CANTIDADVISTAS
FROM Fotos f
ORDER BY F.CANTIDADVISTAS DESC;
GRANT SELECT ON vw_fotos_mas_vistas TO jleon;