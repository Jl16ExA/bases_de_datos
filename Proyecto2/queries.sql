-- 1 Cantidad Total de fotos vendidas por fotógrafo por períodos (mes, año)

SELECT u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM') as Periodo, COUNT(*) as TotalFotosVendidas
FROM Usuarios u, Ventas v, DetallesVentas dv
WHERE u.Id_usuario = v.IdVendedor AND v.IdVenta = dv.IdVenta
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM')
ORDER BY Periodo, TotalFotosVendidas DESC;
-- 2 Suma total pagada a los fotógrafos por las ventas de sus fotos

SELECT u.Id_usuario, u.NombreDePila, u.Apellido, SUM(v.GananciaFotografo) as TotalPagado
FROM Usuarios u, Ventas v
WHERE u.Id_usuario = v.IdVendedor
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido;
-- 3 Suma total de ganancias que la empresa obtiene por la venta de fotos, por períodos, por fotógrafos.

SELECT u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM') as Periodo, SUM(v.ComisionDeEseMomento) as GananciaEmpresa
FROM Usuarios u, Ventas v
WHERE u.Id_usuario = v.IdVendedor
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(v.FechaDeVenta, 'YYYY-MM')
ORDER BY Periodo, GananciaEmpresa DESC;
-- 4 Suma y cantidad de fotos compradas por comprador, por período.

SELECT u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(c.fechaDeCompra, 'YYYY-MM') as Periodo, COUNT(*) as CantidadFotos, SUM(c.precio) as TotalPagado
FROM Usuarios u, CarritoDeCompras c, FotosCarritoCompras fc
WHERE u.Id_usuario = c.idCarritoCompras AND c.idCarritoCompras = fc.IdCarritoCompras
GROUP BY u.Id_usuario, u.NombreDePila, u.Apellido, TO_CHAR(c.fechaDeCompra, 'YYYY-MM')
ORDER BY Periodo, TotalPagado DESC;
-- 5 Número total de fotos que se tienen por país, ubicación, sujeto, tema, evento

SELECT p.Nombre as Pais, u.Ciudad, t.tema, e.evento, COUNT(*) as TotalFotos
FROM Fotos f, Ubicacion u, Pais p, Foto_Temas ft, Temas t, Foto_Evento fe, Evento e
WHERE f.IdUbicacion = u.IdUbicacion AND u.IdPais = p.IdPais AND f.IdFoto = ft.idFoto AND ft.idTema = t.idTema AND f.IdFoto = fe.idFoto AND fe.idEvento = e.idEvento
GROUP BY p.Nombre, u.Ciudad, t.tema, e.evento
ORDER BY TotalFotos DESC;


-- 6 Tráfico generado en la red (número de descargas hechas multiplicado por el tamaño de la imagen), por período.

SELECT TO_CHAR(d.IdDescarga, 'YYYY-MM') as Periodo, SUM(tfd.Tamaño * COUNT(*)) as TraficoGenerado
FROM Descargas d, FotoTipoDeFoto ftf, TipoDeFoto tfd
WHERE d.IdFoto = ftf.IdFoto AND ftf.IdTipoDeFoto = tfd.IdTipoDeFoto
GROUP BY TO_CHAR(d.IdDescarga, 'YYYY-MM')
ORDER BY Periodo;
-- 7 Reporte de pagos por período, por entidad autorizadora.

SELECT ea.NombreEntidad, TO_CHAR(v.FechaDeVenta, 'YYYY-MM') as Periodo, SUM(v.PrecioTotal) as TotalPagado
FROM Ventas v, entidadesAutorizadas ea
WHERE v.IdEntidadAutorizada = ea.IdEntidadAutorizada
GROUP BY ea.NombreEntidad, TO_CHAR(v.FechaDeVenta, 'YYYY-MM')
ORDER BY Periodo, TotalPagado DESC;
-- 8 ºReporte de Impuestos que se deben pagar por cada foto vendida. Retefuente (7%), IVA(16%), ICA(6%), etc..

SELECT dv.IdFoto, i.TipoDeImpuesto, SUM(dv.PrecioTotal * i.Porcentaje / 100) as TotalImpuesto
FROM DetallesVentas dv, Impuestos i
WHERE dv.Impuestos = i.IdImpuesto
GROUP BY dv.IdFoto, i.TipoDeImpuesto
ORDER BY TotalImpuesto DESC;
-- 9 Reporte de comisiones a las entidades autorizadoras (porcentaje sobre el precio de venta de las fotos).

SELECT ea.NombreEntidad, SUM(v.ComisionDeEseMomento) as TotalComisiones
FROM Ventas v, entidadesAutorizadas ea
WHERE v.IdEntidadAutorizada = ea.IdEntidadAutorizada
GROUP BY ea.NombreEntidad
ORDER BY TotalComisiones DESC;
-- 10 ¿Cuáles son las fotos más vendidas?

SELECT f.IdFoto, f.Descripcion, COUNT(*) as TotalVendido
FROM Fotos f, DetallesVentas dv
WHERE f.IdFoto = dv.IdFoto
GROUP BY f.IdFoto, f.Descripcion
ORDER BY TotalVendido DESC;

--11 ¿De qué país se venden más fotos?

SELECT p.Nombre as Pais, COUNT(*) as TotalVendido
FROM Fotos f, Ubicacion u, Pais p, DetallesVentas dv
WHERE f.IdUbicacion = u.IdUbicacion AND u.IdPais = p.IdPais AND f.IdFoto = dv.IdFoto
GROUP BY p.Nombre
ORDER BY TotalVendido DESC;
--12 ¿De qué evento se venden más fotos?

SELECT e.evento, COUNT(*) as TotalVendido
FROM Fotos f, Foto_Evento fe, Evento e, DetallesVentas dv
WHERE f.IdFoto = fe.idFoto AND fe.idEvento = e.idEvento AND f.IdFoto = dv.IdFoto
GROUP BY e.evento
ORDER BY TotalVendido DESC;
-- 13 ¿En qué temporada se venden más fotos?

-- Suponiendo que la temporada se basa en trimestres
SELECT TO_CHAR(v.FechaDeVenta, 'YYYY') || ' Q' || TO_CHAR(v.FechaDeVenta, 'Q') as Temporada, COUNT(*) as TotalVendido
FROM Ventas v, DetallesVentas dv
WHERE v.IdVenta = dv.IdVenta
GROUP BY TO_CHAR(v.FechaDeVenta, 'YYYY') || ' Q' || TO_CHAR(v.FechaDeVenta, 'Q')
ORDER BY TotalVendido DESC;
-- 14 ¿Cuáles son las fotos más vistas por los visitantes?

SELECT f.IdFoto, f.Descripcion, COUNT(*) as TotalVistas
FROM Fotos f, Visualizaciones v
WHERE f.IdFoto = v.IdFoto
GROUP BY f.IdFoto, f.Descripcion
ORDER BY TotalVistas DESC;