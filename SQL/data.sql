USE [norton]
GO
INSERT [dbo].[Empresas] ([EmpresaId], [EmpresaCodigo], [EmpresaDescripcion], [EmpresaEstado], [EmpresaPorDefecto], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'dac64832-ab9c-47cc-b3f9-4c8e41eded1d', N'01', N'Norton', N'A', 1, CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30')
INSERT [dbo].[Proyectos] ([ProyectoId], [ProyectoCodigo], [ProyectoNombre], [ProyectoMoneda], [ProyectoUtilidadPorcentaje], [ProyectoUtilidad], [ProyectoGastosGenerales], [ProyectoIgv], [ProyectoMontoTotal], [ProyectoEstado], [ProyectoFechaInicio], [ProyectoFechaFin], [ProyectoEmpresa], [ProyectoLugarEntrega], [UsuarioCreacion], [FechaCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'aed05cd8-9578-41ad-92b4-796cce92dd15', N'proy01', N'Proyecto 01', N'5cb3cfbb-ee42-4bd0-b122-77b8663fc7ea', CAST(15.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), CAST(118.00 AS Decimal(18, 2)), N'A', CAST(0x0000AB3400000000 AS DateTime), CAST(0x0000AB3400000000 AS DateTime), N'dac64832-ab9c-47cc-b3f9-4c8e41eded1d', N'Lugar', NULL, NULL, NULL, NULL)
INSERT [dbo].[Roles] ([RolId], [RolCodigo], [RolDescripcion]) VALUES (N'34288963-f091-481a-bb91-3cca73ab7949', N'02', N'Contacto')
INSERT [dbo].[Roles] ([RolId], [RolCodigo], [RolDescripcion]) VALUES (N'58fb4d69-1d99-4aa2-9ba3-7e9639421b99', N'01', N'Administrador')
INSERT [dbo].[Usuarios] ([UsuarioId], [UsuarioCodigo], [UsuarioNombres], [UsuarioApellidos], [UsuarioEmail], [UsuarioEstado], [UsuarioUsername], [UsuarioPassword], [RolId], [EmpresaId]) VALUES (N'ae5b8987-3884-4b48-8c80-10ab2888b7f9', N'02', N'Abel Augusto', N'Alva Andreu', N'abel@empresa1.com', NULL, N'aaaa', N'aaaa', N'34288963-f091-481a-bb91-3cca73ab7949', N'dac64832-ab9c-47cc-b3f9-4c8e41eded1d')
INSERT [dbo].[Usuarios] ([UsuarioId], [UsuarioCodigo], [UsuarioNombres], [UsuarioApellidos], [UsuarioEmail], [UsuarioEstado], [UsuarioUsername], [UsuarioPassword], [RolId], [EmpresaId]) VALUES (N'530b0b3d-917d-4b2d-88be-55e3be6b06b9', N'03', N'Biago Balun', N'Bravo Bustamante', N'biago@empresa2.com', NULL, N'bbbb', N'bbbb', N'34288963-f091-481a-bb91-3cca73ab7949', N'dac64832-ab9c-47cc-b3f9-4c8e41eded1d')
INSERT [dbo].[Usuarios] ([UsuarioId], [UsuarioCodigo], [UsuarioNombres], [UsuarioApellidos], [UsuarioEmail], [UsuarioEstado], [UsuarioUsername], [UsuarioPassword], [RolId], [EmpresaId]) VALUES (N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', N'01', N'Administrador', N'Administraor', N'administrador@admin.com', NULL, N'admin', N'admin', N'58fb4d69-1d99-4aa2-9ba3-7e9639421b99', N'dac64832-ab9c-47cc-b3f9-4c8e41eded1d')
INSERT [dbo].[TiposFacturas] ([TipoFacturaId], [TipoFacturaCodigo], [TipoFacturaDescripcion], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'48d9be49-b2af-414a-9b6d-3614a4fe52f7', N'02', N'Tipo Factura 02', NULL, NULL, NULL, NULL)
INSERT [dbo].[TiposFacturas] ([TipoFacturaId], [TipoFacturaCodigo], [TipoFacturaDescripcion], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'78948148-1716-4609-8293-441bb4396be6', N'01', N'Tipo Factura 01', NULL, NULL, NULL, NULL)
INSERT [dbo].[TiposProveedores] ([TipoProveedorId], [TipoProveedorCodigo], [TipoProveedorDescripcion], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'abd39193-d72a-47ec-8ed0-f3f21b61b220', N'01', N'Tipo de Proveedor A', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30')
INSERT [dbo].[Proveedores] ([ProveedorId], [ProveedorRuc], [ProveedorEmail], [ProveedorRazonSocial], [ProveedorPassword], [ProveedorTipo], [ProveedorDireccionFiscal], [ProveedorPlazoPago], [ProveedorEstado], [ProveedorEsEmisorElectronico], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [TipoProveedorId], [UsuarioValidacion]) VALUES (N'5b5a3b9b-c4ce-4f59-ac59-3475b09da7e3', N'2012356781', N'Hidrogeno@h.com', N'Hidrogeno S.A.', N'hidro', N'abd39193-d72a-47ec-8ed0-f3f21b61b220', N'Av. quimicos 1', 12, N'A', NULL, CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'4c305c1d-6dfb-475f-96c6-aa33424d1867', N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30')
INSERT [dbo].[Proveedores] ([ProveedorId], [ProveedorRuc], [ProveedorEmail], [ProveedorRazonSocial], [ProveedorPassword], [ProveedorTipo], [ProveedorDireccionFiscal], [ProveedorPlazoPago], [ProveedorEstado], [ProveedorEsEmisorElectronico], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [TipoProveedorId], [UsuarioValidacion]) VALUES (N'4c305c1d-6dfb-475f-96c6-aa33424d1867', N'20876543219', N'Helio@he.com', N'Helio S.A.C.', N'heli', N'abd39193-d72a-47ec-8ed0-f3f21b61b220', N'Av. Periodica', 15, N'A', NULL, CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'4c305c1d-6dfb-475f-96c6-aa33424d1867', N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30')
INSERT [dbo].[Ordenes] ([OrdenId], [OrdenCodigo], [OrdenTipo], [OrdenFecha], [OrdenProveedor], [OrdenSubtotal], [OrdenIgv], [OrdenTotal], [OrdenPlazoEntrega], [OrdenFormaPago], [OrdenContactoInterno], [OrdenLugarEntrega], [OrdenEstado], [OrdenObservacion], [OrdenMotivoRechazo], [ProyectoId]) VALUES (N'f06bf934-de41-4310-92f9-1e98d0513a3f', N'111', N'S', CAST(0x0000AB3400000000 AS DateTime), N'5b5a3b9b-c4ce-4f59-ac59-3475b09da7e3', CAST(25.00 AS Decimal(18, 2)), CAST(4.50 AS Decimal(18, 2)), CAST(29.50 AS Decimal(18, 2)), CAST(0x0000AB3400000000 AS DateTime), N'C', N'e0aa2f56-17c3-4fac-925e-fde706224af6', NULL, NULL, NULL, NULL, N'aed05cd8-9578-41ad-92b4-796cce92dd15')
INSERT [dbo].[Monedas] ([MonedaId], [MonedaCodigo], [MonedaDescripcion], [MonedaBase]) VALUES (N'5cb3cfbb-ee42-4bd0-b122-77b8663fc7ea', N'002', N'DOLARES AMERICANOS', 0)
INSERT [dbo].[Monedas] ([MonedaId], [MonedaCodigo], [MonedaDescripcion], [MonedaBase]) VALUES (N'6f7eee42-4f36-4fbe-b360-8120df9865b0', N'001', N'NUEVOS SOLES', 1)
INSERT [dbo].[OrdenesDetalles] ([OrdenDetalleId], [OrdenId], [OrdenDetalleItem], [OrdenDetalleDescripcion], [OrdenDetalleCodigo], [OrdenDetalleCantidad], [OrdenDetalleUnidad], [OrdenDetallePrecioUnitario], [OrdenDetallePrecioTotal], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'bf0671cd-092a-4e1d-bd41-d58b55390530', N'f06bf934-de41-4310-92f9-1e98d0513a3f', 5, N'5', NULL, CAST(5.00 AS Decimal(18, 2)), N'5', CAST(5.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
INSERT [dbo].[Parametros] ([ParametroId], [ParametroCodigo], [ParametroDescripcion]) VALUES (N'fdff7358-1c8f-459d-94e8-47c8cd7bdaa9', N'02', N'Forma de Pago')
INSERT [dbo].[Parametros] ([ParametroId], [ParametroCodigo], [ParametroDescripcion]) VALUES (N'c9854d17-7b77-41c0-ac14-4d7a06ce7c90', N'03', N'EstadoOrden')
INSERT [dbo].[Parametros] ([ParametroId], [ParametroCodigo], [ParametroDescripcion]) VALUES (N'52967d72-2646-4c40-b827-6d95bf43d974', N'04', N'EstadoProyecto')
INSERT [dbo].[Parametros] ([ParametroId], [ParametroCodigo], [ParametroDescripcion]) VALUES (N'daf03ce8-1369-4756-8025-7e07f5071562', N'05', N'TipoFactura')
INSERT [dbo].[Parametros] ([ParametroId], [ParametroCodigo], [ParametroDescripcion]) VALUES (N'9ee5f535-2eca-43f5-8590-862bed78996a', N'01', N'Tipos de Ordenes')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'c4c7000f-3c9f-45f2-a76b-20e289c09eb0', N'R', N'Rechazado', N'c9854d17-7b77-41c0-ac14-4d7a06ce7c90')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'4094dbb8-cb0e-4a84-975a-417d0c92b188', N'P', N'Pendiente', N'52967d72-2646-4c40-b827-6d95bf43d974')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'714b1bb7-4aa7-409f-b024-6e1bb3ebf00f', N'C', N'Forma de Pago 1', N'fdff7358-1c8f-459d-94e8-47c8cd7bdaa9')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'33b44191-e026-4bdb-a46d-7ad95af62ab0', N'A', N'Aprobado', N'52967d72-2646-4c40-b827-6d95bf43d974')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'1bf54457-bed9-4e62-8cf9-82e60febde49', N'R', N'Rechazado', N'52967d72-2646-4c40-b827-6d95bf43d974')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'beac2ab9-c638-4b44-b21d-83bdf9732473', N'A', N'Aprobado', N'c9854d17-7b77-41c0-ac14-4d7a06ce7c90')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'9d66057d-f761-4b0c-9b2d-83f0dcd9ea05', N'P', N'Pendiente', N'c9854d17-7b77-41c0-ac14-4d7a06ce7c90')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'37692adc-7246-42aa-88e1-89c88e00642c', N'S', N'Orden de Servicio', N'9ee5f535-2eca-43f5-8590-862bed78996a')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'2c68b981-fa21-49de-8052-9fd170ce008a', N'C', N'Orden de Compra', N'9ee5f535-2eca-43f5-8590-862bed78996a')
INSERT [dbo].[ParametrosDetalle] ([ParametroDetalleId], [ParametroDetalleCodigo], [ParametroDetalleDescripcion], [ParametroId]) VALUES (N'a928361d-7220-4495-aa64-a8e308b853eb', N'E', N'Forma de Pago 2', N'fdff7358-1c8f-459d-94e8-47c8cd7bdaa9')
INSERT [dbo].[ProveedoresContactos] ([ProveedorContactoId], [ProveedorId], [ProveedorContactoTipo], [ProveedorContactoTelefono], [ProveedorContactoCelular], [UsuarioId], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion], [ProveedorContactoEstado]) VALUES (N'46fa2271-64cc-4c2b-b4ed-6d3de81d8101', N'4c305c1d-6dfb-475f-96c6-aa33424d1867', N'Principal                                         ', N'321654', N'321654', N'530b0b3d-917d-4b2d-88be-55e3be6b06b9', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', NULL)
INSERT [dbo].[ProveedoresContactos] ([ProveedorContactoId], [ProveedorId], [ProveedorContactoTipo], [ProveedorContactoTelefono], [ProveedorContactoCelular], [UsuarioId], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion], [ProveedorContactoEstado]) VALUES (N'e0aa2f56-17c3-4fac-925e-fde706224af6', N'5b5a3b9b-c4ce-4f59-ac59-3475b09da7e3', N'Principal                                         ', N'312654987**', N'31265498', N'ae5b8987-3884-4b48-8c80-10ab2888b7f9', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', NULL)
INSERT [dbo].[TiposDetracciones] ([TipoDetraccionId], [TipoDetraccionCodigo], [TipoDetraccionDescripcion], [TipoDetraccionTipo], [TipoDetraccionValor], [FechaCreacion], [UsuarioCreacion], [FechaActualizacion], [UsuarioActualizacion]) VALUES (N'b6fd93e1-1dd3-469d-93ba-8148db011387', N'01', N'Tipo de deDetraccion 1', NULL, NULL, CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30', CAST(0x0000901A00000000 AS DateTime), N'9ea3c4bb-a31a-4d68-b42c-df3b328abf30')
