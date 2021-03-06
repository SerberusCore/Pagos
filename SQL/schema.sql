USE [master]
GO
/****** Object:  Database [norton]    Script Date: 10/12/2018 07:10:30 a.m. ******/
CREATE DATABASE [norton]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'norton', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\norton.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'norton_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\norton_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [norton] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [norton].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [norton] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [norton] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [norton] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [norton] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [norton] SET ARITHABORT OFF 
GO
ALTER DATABASE [norton] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [norton] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [norton] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [norton] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [norton] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [norton] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [norton] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [norton] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [norton] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [norton] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [norton] SET  DISABLE_BROKER 
GO
ALTER DATABASE [norton] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [norton] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [norton] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [norton] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [norton] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [norton] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [norton] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [norton] SET RECOVERY FULL 
GO
ALTER DATABASE [norton] SET  MULTI_USER 
GO
ALTER DATABASE [norton] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [norton] SET DB_CHAINING OFF 
GO
ALTER DATABASE [norton] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [norton] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'norton', N'ON'
GO
USE [norton]
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresas](
	[EmpresaId] [uniqueidentifier] NOT NULL,
	[EmpresaCodigo] [varchar](50) NULL,
	[EmpresaDescripcion] [varchar](50) NULL,
	[EmpresaEstado] [char](1) NULL,
	[EmpresaPorDefecto] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[EmpresaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpresasCuentasBancarias]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpresasCuentasBancarias](
	[EmpresaCuentaBancariaId] [uniqueidentifier] NOT NULL,
	[EmpresaId] [uniqueidentifier] NULL,
	[EmpresaCuentaBancariaBanco] [char](1) NULL,
	[EmpresaCuentaBancariaNumero] [varchar](50) NULL,
	[EmpresaCuentaBancariaCCI] [varchar](50) NULL,
	[EmpresaCuentaBancariaMoneda] [uniqueidentifier] NULL,
	[EmpresaCuentaBancariaPorDefecto] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EmpresasCuentasBancarias] PRIMARY KEY CLUSTERED 
(
	[EmpresaCuentaBancariaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Facturas](
	[FacturaId] [uniqueidentifier] NOT NULL,
	[FacturaProyecto] [uniqueidentifier] NULL,
	[FacturaTipo] [uniqueidentifier] NULL,
	[FacturaSerie] [varchar](4) NULL,
	[FacturaNumero] [varchar](8) NULL,
	[FacturaFechaEmision] [datetime] NULL,
	[FacturaFechaVencimiento] [datetime] NULL,
	[FacturaMoneda] [uniqueidentifier] NULL,
	[FacturaEstado] [char](1) NULL,
	[FacturaSubtotal] [decimal](2, 0) NULL,
	[FacturaIgv] [decimal](2, 0) NULL,
	[FacturaImporteTotal] [decimal](2, 0) NULL,
	[FacturaFondoGarantia] [decimal](2, 0) NULL,
	[FacturaPorcentajeDetraccion] [decimal](2, 0) NULL,
	[FacturaMontoDetraccion] [decimal](2, 0) NULL,
	[FacturaImportePagar] [decimal](2, 0) NULL,
	[FacturaUrl] [varchar](250) NULL,
	[FacturaFechaPagoProgramada] [datetime] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacturasDetalles]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacturasDetalles](
	[FacturaDetalleId] [uniqueidentifier] NOT NULL,
	[FacturaId] [uniqueidentifier] NULL,
	[FacturaDetalleDescripcion] [varchar](200) NULL,
	[FacturaDetalleCantidad] [decimal](2, 0) NULL,
	[FacturaDetallePrecioUnitario] [decimal](2, 0) NULL,
	[FacturaDetalleImporteTotal] [decimal](2, 0) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FacturasDetalles] PRIMARY KEY CLUSTERED 
(
	[FacturaDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacturasEstados]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacturasEstados](
	[FacturaEstadoId] [uniqueidentifier] NOT NULL,
	[FacturaEstadoEstado] [char](1) NULL,
	[FacturaId] [uniqueidentifier] NULL,
	[FacturaEstadoFecha] [datetime] NULL,
	[FacturaEstadoUsuario] [uniqueidentifier] NULL,
	[FacturaEstadoMotivosRechazo] [char](1) NULL,
	[FacturaEstadoObservaciones] [varchar](50) NULL,
 CONSTRAINT [PK_FacturasEstados] PRIMARY KEY CLUSTERED 
(
	[FacturaEstadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacturasGuiasRemision]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacturasGuiasRemision](
	[FacturaGuiaRemisionId] [uniqueidentifier] NOT NULL,
	[FacturaId] [uniqueidentifier] NULL,
	[FacturaGuiaRemisionSerie] [varchar](4) NULL,
	[FacturaGuiaRemisionNumero] [varchar](8) NULL,
	[FacturaGuiaRemisionFechaEmision] [datetime] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FacturasGuiasRemision] PRIMARY KEY CLUSTERED 
(
	[FacturaGuiaRemisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacturasOrdenes]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FacturasOrdenes](
	[FacturaOrdenId] [varchar](50) NOT NULL,
	[FacturaId] [uniqueidentifier] NULL,
	[OrdenId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FacturasOrdenes] PRIMARY KEY CLUSTERED 
(
	[FacturaOrdenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FacturasPagos]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasPagos](
	[FacturaPagoId] [uniqueidentifier] NOT NULL,
	[FacturaId] [uniqueidentifier] NULL,
	[PagoId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FacturasPagos] PRIMARY KEY CLUSTERED 
(
	[FacturaPagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Monedas](
	[MonedaId] [uniqueidentifier] NOT NULL,
	[MonedaCodigo] [varchar](50) NULL,
	[MonedaDescripcion] [varchar](50) NULL,
	[MonedaBase] [bit] NULL,
 CONSTRAINT [PK_Monedas] PRIMARY KEY CLUSTERED 
(
	[MonedaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ordenes](
	[OrdenId] [uniqueidentifier] NOT NULL,
	[OrdenCodigo] [varchar](50) NULL,
	[OrdenTipo] [char](1) NULL,
	[OrdenFecha] [datetime] NULL,
	[OrdenProveedor] [uniqueidentifier] NULL,
	[OrdenSubtotal] [decimal](2, 0) NULL,
	[OrdenIgv] [decimal](2, 0) NULL,
	[OrdenTotal] [decimal](2, 0) NULL,
	[OrdenPlazoEntrega] [datetime] NULL,
	[OrdenFormaPago] [char](1) NULL,
	[OrdenContactoInterno] [uniqueidentifier] NULL,
	[OrdenLugarEntrega] [varchar](150) NULL,
	[OrdenEstado] [char](1) NULL,
	[OrdenObservacion] [varchar](50) NULL,
	[OrdenMotivoRechazo] [char](1) NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[OrdenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrdenesDetalles]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdenesDetalles](
	[OrdenDetalleId] [uniqueidentifier] NOT NULL,
	[OrdenId] [uniqueidentifier] NULL,
	[OrdenDetalleItem] [int] NULL,
	[OrdenDetalleDescripcion] [varchar](50) NULL,
	[OrdenDetalleCuotas] [int] NULL,
	[OrdenDetalleUnidad] [varchar](50) NULL,
	[OrdenDetallePrecioUnitario] [decimal](2, 0) NULL,
	[OrdenDetallePrecioTotal] [decimal](2, 0) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OrdenesDetalles] PRIMARY KEY CLUSTERED 
(
	[OrdenDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrdenesPartidas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesPartidas](
	[OrdenPartidaId] [uniqueidentifier] NOT NULL,
	[OrdenId] [uniqueidentifier] NULL,
	[ProyectoId] [uniqueidentifier] NULL,
	[PresupuestoItemId] [uniqueidentifier] NULL,
	[OrdenDetalleId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OrdenesPartidas] PRIMARY KEY CLUSTERED 
(
	[OrdenPartidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paginas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paginas](
	[PaginaId] [uniqueidentifier] NOT NULL,
	[PaginaCodigo] [varchar](50) NULL,
	[PaginaNombre] [varchar](50) NULL,
	[PaginaDescripcion] [varchar](50) NULL,
	[PaginaUrl] [varchar](150) NULL,
 CONSTRAINT [PK_Paginas] PRIMARY KEY CLUSTERED 
(
	[PaginaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[PagoId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NULL,
	[PagoCuentaOrigen] [uniqueidentifier] NULL,
	[PagoCuentaDestino] [uniqueidentifier] NULL,
	[PagoFecha] [datetime] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[PagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametros](
	[ParametroId] [uniqueidentifier] NOT NULL,
	[ParametroCodigo] [varchar](50) NULL,
	[ParametroDescripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[ParametroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParametrosDetalle]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParametrosDetalle](
	[ParametroDetalleId] [uniqueidentifier] NOT NULL,
	[ParametroDetalleCodigo] [varchar](50) NULL,
	[ParametroDetalleDescripcion] [varchar](50) NULL,
	[ParametroId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ParametrosDetalle] PRIMARY KEY CLUSTERED 
(
	[ParametroDetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Partidas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Partidas](
	[PartidaId] [uniqueidentifier] NOT NULL,
	[PartidaCodigo] [varchar](50) NULL,
	[PartidaNaturaleza] [varchar](50) NULL,
	[PartidaUnidad] [varchar](50) NULL,
	[PartidaResumen] [varchar](50) NULL,
	[PadrePartidaId] [uniqueidentifier] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Partidas] PRIMARY KEY CLUSTERED 
(
	[PartidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Presupuestos]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Presupuestos](
	[PresupuestoId] [uniqueidentifier] NOT NULL,
	[PresupuestoFecha] [datetime] NULL,
	[PresupuestoOrigen] [char](1) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Presupuestos] PRIMARY KEY CLUSTERED 
(
	[PresupuestoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PresupuestosItems]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PresupuestosItems](
	[PresupuestoItemId] [uniqueidentifier] NOT NULL,
	[PresupuestoId] [uniqueidentifier] NULL,
	[PartidaId] [uniqueidentifier] NULL,
	[PadrePartidaId] [uniqueidentifier] NULL,
	[PresupuestoItemFecha] [datetime] NULL,
	[PresupuestoItemCodigo] [varchar](50) NULL,
	[PresupuestoItemNaturaleza] [varchar](50) NULL,
	[PresupuestoItemUnidad] [varchar](50) NULL,
	[PresupuestoItemResumen] [varchar](50) NULL,
	[PresupuestoItemCantidad] [decimal](2, 0) NULL,
	[PresupuestoItemPrecio] [decimal](2, 0) NULL,
	[PresupuestoItemImporte] [decimal](2, 0) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PresupuestosItems] PRIMARY KEY CLUSTERED 
(
	[PresupuestoItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PresupuestosItemsLogs]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PresupuestosItemsLogs](
	[PresupuestoItemLogId] [uniqueidentifier] NOT NULL,
	[PresupuestoItemId] [uniqueidentifier] NULL,
	[PresupuestoItemLogFecha] [datetime] NULL,
	[PresupuestoItemLogAccion] [char](1) NULL,
	[PresupuestoItemCodigo] [varchar](50) NULL,
	[PresupuestoItemNaturaleza] [varchar](50) NULL,
	[PresupuestoItemUnidad] [varchar](50) NULL,
	[PresupuestoItemResumen] [varchar](50) NULL,
	[PresupuestoItemCantidad] [decimal](2, 0) NULL,
	[PresupuestoItemPrecio] [decimal](2, 0) NULL,
	[PresupuestoItemImporte] [decimal](2, 0) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PresupuestosItemsLogs] PRIMARY KEY CLUSTERED 
(
	[PresupuestoItemLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[ProveedorRuc] [varchar](11) NULL,
	[ProveedorEmail] [varchar](50) NULL,
	[ProveedorRazonSocial] [varchar](50) NULL,
	[ProveedorPassword] [varchar](10) NULL,
	[ProveedorTipo] [uniqueidentifier] NULL,
	[ProveedorDireccionFiscal] [varchar](150) NULL,
	[ProveedorPlazoPago] [int] NULL,
	[ProveedorEstado] [char](1) NULL,
	[ProveedorTipoDetraccion] [uniqueidentifier] NULL,
	[ProveedorPorcentajeDetraccion] [decimal](2, 0) NULL,
	[ProveedorCuentaDetraccion] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioValidacion] [uniqueidentifier] NULL,
	[TipoProveedorId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProveedoresContactos]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProveedoresContactos](
	[ProveedorContactoId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NULL,
	[ProveedorContactoTipo] [char](50) NULL,
	[ProveedorContactoNombres] [varchar](100) NULL,
	[ProveedorContactoApellidos] [varchar](100) NULL,
	[ProveedorContactoEmail] [varchar](50) NULL,
	[ProveedorContactoTelefono] [varchar](50) NULL,
	[ProveedorContactoCelular] [varchar](50) NULL,
	[UsuarioId] [uniqueidentifier] NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProveedoresContactos] PRIMARY KEY CLUSTERED 
(
	[ProveedorContactoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProveedoresCuentasBancarias]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProveedoresCuentasBancarias](
	[ProveedorCuentaBancariaId] [uniqueidentifier] NOT NULL,
	[ProveedorId] [uniqueidentifier] NULL,
	[ProveedorCuentaBancariaBanco] [varchar](50) NULL,
	[ProveedorCuentaBancariaNumero] [varchar](50) NULL,
	[ProveedorCuentaBancariaCCI] [varchar](50) NULL,
	[ProveedorCuantaBancariaMoneda] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProveedoresCuentasBancarias] PRIMARY KEY CLUSTERED 
(
	[ProveedorCuentaBancariaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProveedoresFacturas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedoresFacturas](
	[ProveedorId] [uniqueidentifier] NOT NULL,
	[FacturarId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProveedoresFacturas] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC,
	[FacturarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proyectos]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proyectos](
	[ProyectoId] [uniqueidentifier] NOT NULL,
	[ProyectoCodigo] [varchar](50) NULL,
	[ProyectoNombre] [varchar](50) NULL,
	[ProyectoMoneda] [uniqueidentifier] NULL,
	[ProyectoUtilidadContratada] [decimal](2, 0) NULL,
	[ProyectoUtilidad] [decimal](2, 0) NULL,
	[ProyectoGastosGenerales] [decimal](2, 0) NULL,
	[ProyectoIgv] [decimal](2, 0) NULL,
	[ProyectoMontoTotal] [decimal](2, 0) NULL,
	[ProyectoEstado] [char](1) NULL,
	[ProyectoFechaInicio] [datetime] NULL,
	[ProyectoFechaFin] [datetime] NULL,
	[ProyectoEmpresa] [uniqueidentifier] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Proyectos] PRIMARY KEY CLUSTERED 
(
	[ProyectoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProyectosPresupuestos]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProyectosPresupuestos](
	[ProyectoPresupuestoId] [uniqueidentifier] NOT NULL,
	[ProyectoId] [uniqueidentifier] NULL,
	[PresupuestoId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ProyectosPresupuestos] PRIMARY KEY CLUSTERED 
(
	[ProyectoPresupuestoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProyectosResponsables]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProyectosResponsables](
	[ProyectoResponsableId] [uniqueidentifier] NOT NULL,
	[ProyectoId] [uniqueidentifier] NULL,
	[ResponsableId] [uniqueidentifier] NULL,
	[ProyectoResponsableTipo] [char](1) NULL,
 CONSTRAINT [PK_ProyectosResponsables] PRIMARY KEY CLUSTERED 
(
	[ProyectoResponsableId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RolId] [uniqueidentifier] NOT NULL,
	[RolCodigo] [varchar](50) NULL,
	[RolDescripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RolesPaginas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RolesPaginas](
	[RolId] [uniqueidentifier] NOT NULL,
	[PaginaId] [uniqueidentifier] NOT NULL,
	[Accion] [char](1) NULL,
 CONSTRAINT [PK_RolesPaginas] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC,
	[PaginaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposdeCambio]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposdeCambio](
	[TipoCambioId] [uniqueidentifier] NOT NULL,
	[MonedaId] [uniqueidentifier] NULL,
	[TipoCambioFecha] [datetime] NULL,
	[TipoCambioValor] [decimal](2, 0) NULL,
	[TipoCambioOrigen] [char](1) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TiposdeCambio] PRIMARY KEY CLUSTERED 
(
	[TipoCambioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposDetracciones]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposDetracciones](
	[TipoDetraccionId] [uniqueidentifier] NOT NULL,
	[TipoDetraccionCodigo] [varchar](50) NULL,
	[TipoDetraccionDescripcion] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TiposDetracciones] PRIMARY KEY CLUSTERED 
(
	[TipoDetraccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposFacturas]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposFacturas](
	[TipoFacturaId] [uniqueidentifier] NOT NULL,
	[TipoFacturaCodigo] [varchar](50) NULL,
	[TipoFacturaDescripcion] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TiposFacturas] PRIMARY KEY CLUSTERED 
(
	[TipoFacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposProveedores]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposProveedores](
	[TipoProveedorId] [uniqueidentifier] NOT NULL,
	[TipoProveedorCodigo] [varchar](50) NULL,
	[TipoProveedorDescripcion] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[UsuarioCreacion] [uniqueidentifier] NULL,
	[FechaActualizacion] [datetime] NULL,
	[UsuarioActualizacion] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TiposProveedores] PRIMARY KEY CLUSTERED 
(
	[TipoProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 10/12/2018 07:10:30 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[UsuarioCodigo] [varchar](50) NULL,
	[UsuarioNombres] [varchar](50) NULL,
	[UsuarioApellidos] [varchar](50) NULL,
	[UsuarioEmail] [varchar](50) NULL,
	[UsuarioUsername] [varchar](50) NULL,
	[UsuarioPassword] [varchar](50) NULL,
	[RolId] [uniqueidentifier] NULL,
	[EmpresaId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[EmpresasCuentasBancarias]  WITH CHECK ADD  CONSTRAINT [FK_EmpresasCuentasBancarias_Empresas] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresas] ([EmpresaId])
GO
ALTER TABLE [dbo].[EmpresasCuentasBancarias] CHECK CONSTRAINT [FK_EmpresasCuentasBancarias_Empresas]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_TiposFacturas] FOREIGN KEY([FacturaTipo])
REFERENCES [dbo].[TiposFacturas] ([TipoFacturaId])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_TiposFacturas]
GO
ALTER TABLE [dbo].[FacturasDetalles]  WITH CHECK ADD  CONSTRAINT [FK_FacturasDetalles_Facturas] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([FacturaId])
GO
ALTER TABLE [dbo].[FacturasDetalles] CHECK CONSTRAINT [FK_FacturasDetalles_Facturas]
GO
ALTER TABLE [dbo].[FacturasEstados]  WITH CHECK ADD  CONSTRAINT [FK_FacturasEstados_Facturas] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([FacturaId])
GO
ALTER TABLE [dbo].[FacturasEstados] CHECK CONSTRAINT [FK_FacturasEstados_Facturas]
GO
ALTER TABLE [dbo].[FacturasGuiasRemision]  WITH CHECK ADD  CONSTRAINT [FK_FacturasGuiasRemision_Facturas] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([FacturaId])
GO
ALTER TABLE [dbo].[FacturasGuiasRemision] CHECK CONSTRAINT [FK_FacturasGuiasRemision_Facturas]
GO
ALTER TABLE [dbo].[FacturasOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FacturasOrdenes_Facturas] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([FacturaId])
GO
ALTER TABLE [dbo].[FacturasOrdenes] CHECK CONSTRAINT [FK_FacturasOrdenes_Facturas]
GO
ALTER TABLE [dbo].[FacturasOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FacturasOrdenes_Ordenes] FOREIGN KEY([OrdenId])
REFERENCES [dbo].[Ordenes] ([OrdenId])
GO
ALTER TABLE [dbo].[FacturasOrdenes] CHECK CONSTRAINT [FK_FacturasOrdenes_Ordenes]
GO
ALTER TABLE [dbo].[FacturasPagos]  WITH CHECK ADD  CONSTRAINT [FK_FacturasPagos_Facturas] FOREIGN KEY([FacturaId])
REFERENCES [dbo].[Facturas] ([FacturaId])
GO
ALTER TABLE [dbo].[FacturasPagos] CHECK CONSTRAINT [FK_FacturasPagos_Facturas]
GO
ALTER TABLE [dbo].[FacturasPagos]  WITH CHECK ADD  CONSTRAINT [FK_FacturasPagos_Pagos] FOREIGN KEY([PagoId])
REFERENCES [dbo].[Pagos] ([PagoId])
GO
ALTER TABLE [dbo].[FacturasPagos] CHECK CONSTRAINT [FK_FacturasPagos_Pagos]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FK_Ordenes_Proveedores] FOREIGN KEY([OrdenProveedor])
REFERENCES [dbo].[Proveedores] ([ProveedorId])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FK_Ordenes_Proveedores]
GO
ALTER TABLE [dbo].[OrdenesDetalles]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesDetalles_Ordenes] FOREIGN KEY([OrdenId])
REFERENCES [dbo].[Ordenes] ([OrdenId])
GO
ALTER TABLE [dbo].[OrdenesDetalles] CHECK CONSTRAINT [FK_OrdenesDetalles_Ordenes]
GO
ALTER TABLE [dbo].[OrdenesPartidas]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesPartidas_OrdenesDetalles] FOREIGN KEY([OrdenDetalleId])
REFERENCES [dbo].[OrdenesDetalles] ([OrdenDetalleId])
GO
ALTER TABLE [dbo].[OrdenesPartidas] CHECK CONSTRAINT [FK_OrdenesPartidas_OrdenesDetalles]
GO
ALTER TABLE [dbo].[OrdenesPartidas]  WITH CHECK ADD  CONSTRAINT [FK_OrdenesPartidas_PresupuestosItems] FOREIGN KEY([PresupuestoItemId])
REFERENCES [dbo].[PresupuestosItems] ([PresupuestoItemId])
GO
ALTER TABLE [dbo].[OrdenesPartidas] CHECK CONSTRAINT [FK_OrdenesPartidas_PresupuestosItems]
GO
ALTER TABLE [dbo].[ParametrosDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ParametrosDetalle_Parametros] FOREIGN KEY([ParametroId])
REFERENCES [dbo].[Parametros] ([ParametroId])
GO
ALTER TABLE [dbo].[ParametrosDetalle] CHECK CONSTRAINT [FK_ParametrosDetalle_Parametros]
GO
ALTER TABLE [dbo].[PresupuestosItems]  WITH CHECK ADD  CONSTRAINT [FK_PresupuestosItems_Partidas] FOREIGN KEY([PartidaId])
REFERENCES [dbo].[Partidas] ([PartidaId])
GO
ALTER TABLE [dbo].[PresupuestosItems] CHECK CONSTRAINT [FK_PresupuestosItems_Partidas]
GO
ALTER TABLE [dbo].[PresupuestosItemsLogs]  WITH CHECK ADD  CONSTRAINT [FK_PresupuestosItemsLogs_PresupuestosItems] FOREIGN KEY([PresupuestoItemId])
REFERENCES [dbo].[PresupuestosItems] ([PresupuestoItemId])
GO
ALTER TABLE [dbo].[PresupuestosItemsLogs] CHECK CONSTRAINT [FK_PresupuestosItemsLogs_PresupuestosItems]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_TiposDetracciones] FOREIGN KEY([ProveedorTipoDetraccion])
REFERENCES [dbo].[TiposDetracciones] ([TipoDetraccionId])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_TiposDetracciones]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_TiposProveedores] FOREIGN KEY([ProveedorTipo])
REFERENCES [dbo].[TiposProveedores] ([TipoProveedorId])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_TiposProveedores]
GO
ALTER TABLE [dbo].[ProveedoresContactos]  WITH CHECK ADD  CONSTRAINT [FK_ProveedoresContactos_Proveedores] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedores] ([ProveedorId])
GO
ALTER TABLE [dbo].[ProveedoresContactos] CHECK CONSTRAINT [FK_ProveedoresContactos_Proveedores]
GO
ALTER TABLE [dbo].[ProveedoresCuentasBancarias]  WITH CHECK ADD  CONSTRAINT [FK_ProveedoresCuentasBancarias_Proveedores] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedores] ([ProveedorId])
GO
ALTER TABLE [dbo].[ProveedoresCuentasBancarias] CHECK CONSTRAINT [FK_ProveedoresCuentasBancarias_Proveedores]
GO
ALTER TABLE [dbo].[ProveedoresFacturas]  WITH CHECK ADD  CONSTRAINT [FK_ProveedoresFacturas_Facturas] FOREIGN KEY([FacturarId])
REFERENCES [dbo].[Facturas] ([FacturaId])
GO
ALTER TABLE [dbo].[ProveedoresFacturas] CHECK CONSTRAINT [FK_ProveedoresFacturas_Facturas]
GO
ALTER TABLE [dbo].[ProveedoresFacturas]  WITH CHECK ADD  CONSTRAINT [FK_ProveedoresFacturas_Proveedores] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedores] ([ProveedorId])
GO
ALTER TABLE [dbo].[ProveedoresFacturas] CHECK CONSTRAINT [FK_ProveedoresFacturas_Proveedores]
GO
ALTER TABLE [dbo].[Proyectos]  WITH CHECK ADD  CONSTRAINT [FK_Proyectos_Empresas] FOREIGN KEY([ProyectoEmpresa])
REFERENCES [dbo].[Empresas] ([EmpresaId])
GO
ALTER TABLE [dbo].[Proyectos] CHECK CONSTRAINT [FK_Proyectos_Empresas]
GO
ALTER TABLE [dbo].[ProyectosPresupuestos]  WITH CHECK ADD  CONSTRAINT [FK_ProyectosPresupuestos_Presupuestos] FOREIGN KEY([PresupuestoId])
REFERENCES [dbo].[Presupuestos] ([PresupuestoId])
GO
ALTER TABLE [dbo].[ProyectosPresupuestos] CHECK CONSTRAINT [FK_ProyectosPresupuestos_Presupuestos]
GO
ALTER TABLE [dbo].[ProyectosPresupuestos]  WITH CHECK ADD  CONSTRAINT [FK_ProyectosPresupuestos_Proyectos] FOREIGN KEY([ProyectoId])
REFERENCES [dbo].[Proyectos] ([ProyectoId])
GO
ALTER TABLE [dbo].[ProyectosPresupuestos] CHECK CONSTRAINT [FK_ProyectosPresupuestos_Proyectos]
GO
ALTER TABLE [dbo].[ProyectosResponsables]  WITH CHECK ADD  CONSTRAINT [FK_ProyectosResponsables_Proyectos] FOREIGN KEY([ProyectoId])
REFERENCES [dbo].[Proyectos] ([ProyectoId])
GO
ALTER TABLE [dbo].[ProyectosResponsables] CHECK CONSTRAINT [FK_ProyectosResponsables_Proyectos]
GO
ALTER TABLE [dbo].[RolesPaginas]  WITH CHECK ADD  CONSTRAINT [FK_RolesPaginas_Paginas] FOREIGN KEY([PaginaId])
REFERENCES [dbo].[Paginas] ([PaginaId])
GO
ALTER TABLE [dbo].[RolesPaginas] CHECK CONSTRAINT [FK_RolesPaginas_Paginas]
GO
ALTER TABLE [dbo].[RolesPaginas]  WITH CHECK ADD  CONSTRAINT [FK_RolesPaginas_Roles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([RolId])
GO
ALTER TABLE [dbo].[RolesPaginas] CHECK CONSTRAINT [FK_RolesPaginas_Roles]
GO
ALTER TABLE [dbo].[TiposdeCambio]  WITH CHECK ADD  CONSTRAINT [FK_TiposdeCambio_Monedas] FOREIGN KEY([MonedaId])
REFERENCES [dbo].[Monedas] ([MonedaId])
GO
ALTER TABLE [dbo].[TiposdeCambio] CHECK CONSTRAINT [FK_TiposdeCambio_Monedas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Empresas] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresas] ([EmpresaId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Empresas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([RolId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de la empresa: Activo o Inactivo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empresas', @level2type=N'COLUMN',@level2name=N'EmpresaEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica la empresa por defecto que se debe utilizar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empresas', @level2type=N'COLUMN',@level2name=N'EmpresaPorDefecto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacenarán las empresas del grupo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empresas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hace referencia al banco de procedencia de la cta bancaria.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpresasCuentasBancarias', @level2type=N'COLUMN',@level2name=N'EmpresaCuentaBancariaBanco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacenará la información de las cuentas bancarias de las empresas del grupo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmpresasCuentasBancarias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del registro de factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Proyecto asociado a la factura.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaProyecto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del tipo de factura: Servicio, Compra, otros.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la moneda en la que se emite la factura.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado Actual de la Factura.
Una Factura puede pasar por los siguientes estados: Pendiente de Aprobación, Aprobadas para Pago, Rechazadas para Pago, Anuladas, Pago Detracción, Pagadas.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje que representa el fondo de garantía de la factura del proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaFondoGarantia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje de Detracción de la Factura.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaPorcentajeDetraccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto correspondiente en soles de detracción de la factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaMontoDetraccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Importe a Pagar al Proveedor considerando la detracción' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaImportePagar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ruta URL del archivo digitalizado de la factura.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Pago Programada de la Factura. 
En principio es la fecha de vencimiento pero se podría reprogramar.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas', @level2type=N'COLUMN',@level2name=N'FacturaFechaPagoProgramada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se registrarán todas las facturas de los proveedores de Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Facturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacenará el detalle de las facturas.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasDetalles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaEstadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de la Factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaEstadoEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de actualización del estado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaEstadoFecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario que actualizó el estado de la factura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaEstadoUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Motivo de rechazo en el caso el estado fuera rechazado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaEstadoMotivosRechazo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Observaciones especificadas por el usuario al actualizar la factura.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados', @level2type=N'COLUMN',@level2name=N'FacturaEstadoObservaciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacenará los distintos estados por los que pasa una factura.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasEstados'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará las guias de remisión asociadas a las facturas de los proveedores de Norton' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasGuiasRemision'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla de relación entre las facturas y sus órdenes asociadas.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasOrdenes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que relaciona las facturas y sus pagos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FacturasPagos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Moneda base o por defecto (soles)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Monedas', @level2type=N'COLUMN',@level2name=N'MonedaBase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacenará las distintas monedas que usará la aplicaciòn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Monedas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipos de órdenes: Compras o Servicios.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes', @level2type=N'COLUMN',@level2name=N'OrdenTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Forma de Pago de la orden.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes', @level2type=N'COLUMN',@level2name=N'OrdenFormaPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Contacto interno de la empresa para el seguimiento de la orden. Hace referencia a un usuarioId.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes', @level2type=N'COLUMN',@level2name=N'OrdenContactoInterno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estados de validación de la orden.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes', @level2type=N'COLUMN',@level2name=N'OrdenEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Observación a la validación de la órden u otras.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes', @level2type=N'COLUMN',@level2name=N'OrdenObservacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Motivo de Rechazo de la orden.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes', @level2type=N'COLUMN',@level2name=N'OrdenMotivoRechazo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ordenes de un proyecto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Ordenes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Detalle de los Items que componen las órdenes de compra o servicios.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdenesDetalles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hace referencia a un PresupuestoItemId (Partida)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdenesPartidas', @level2type=N'COLUMN',@level2name=N'PresupuestoItemId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que relacionará las órdenes con las proyectos y partidas asociados.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrdenesPartidas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacenarán los pagos realizados a los proveedores.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pagos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará los parámetros del sistema.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Parametros'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código único de la partida, se utilizará para procesos de importación.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partidas', @level2type=N'COLUMN',@level2name=N'PartidaCodigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Naturaleza: Capìtulo, Partida, Subpartida, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partidas', @level2type=N'COLUMN',@level2name=N'PartidaNaturaleza'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unidad por defecto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partidas', @level2type=N'COLUMN',@level2name=N'PartidaUnidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción por defecto de la partida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partidas', @level2type=N'COLUMN',@level2name=N'PartidaResumen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id recursivo a la Partida Id de la partida padre de la cuál depente.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partidas', @level2type=N'COLUMN',@level2name=N'PadrePartidaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará todas la base de datos de partidas que pueden tener los proyectos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Partidas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Importación o Actualización del Presupuesto del Proyecto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Presupuestos', @level2type=N'COLUMN',@level2name=N'PresupuestoFecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Origen de procedencia del presupuesto. Puede ser: Importado o Actualizado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Presupuestos', @level2type=N'COLUMN',@level2name=N'PresupuestoOrigen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará los presupuestos de un proyecto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Presupuestos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará el detalle de los presupuestos de los proyectos.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PresupuestosItems'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de actualización del Item del presupuesto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PresupuestosItemsLogs', @level2type=N'COLUMN',@level2name=N'PresupuestoItemLogFecha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acción realizada sobre el item del presupuesto: Inserción, Eliminación, Edición.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PresupuestosItemsLogs', @level2type=N'COLUMN',@level2name=N'PresupuestoItemLogAccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Log de Actualizaciones a los items de un presupuesto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PresupuestosItemsLogs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador único del proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RUC del Proveedor. Se utilizará como credencial para ingreso al portal de proveedores de Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorRuc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email Corporativo del Proveedor utilizado para su registro al Portal de Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Razón Social del Proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorRazonSocial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Password utilizado por el Proveedor para ingresar al Portal de proveedores de Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador que hace referencia al Tipo de Proveedor que representa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dirección Fiscal del Proveedor, de acuerdo a su registro en Sunat.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorDireccionFiscal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nro. de días de plazo de pago que acepta el proveedor. Ejemplo: 30, 60, 90 días, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorPlazoPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del registro del Proveedor.
Posibles estados incluyen: Registrado, En Revisión, Validado, Rechazado e Inactivo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador que hace referencia al tipo de detracción que corresponde al proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorTipoDetraccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje de Detracción que utiliza el proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorPorcentajeDetraccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cuenta de Detracciones del Proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'ProveedorCuentaDetraccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Creación del registro del proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id del usuario que creó el registro del proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'UsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la última actualización del registro del proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'FechaActualizacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que validó su registro.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores', @level2type=N'COLUMN',@level2name=N'UsuarioValidacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacerá la información de todos los proveedores de Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proveedores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Contacto: Gerente General, Gerente Comercial, Contacto Pago, otros.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresContactos', @level2type=N'COLUMN',@level2name=N'ProveedorContactoTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registro de contactos principales de un proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresContactos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del registro.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresCuentasBancarias', @level2type=N'COLUMN',@level2name=N'ProveedorCuentaBancariaId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Banco de procedencia de la Cta Bancaria del Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresCuentasBancarias', @level2type=N'COLUMN',@level2name=N'ProveedorCuentaBancariaBanco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de Cta Bancaria del Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresCuentasBancarias', @level2type=N'COLUMN',@level2name=N'ProveedorCuentaBancariaNumero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código Interbancario de la Cta Bancaria del Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresCuentasBancarias', @level2type=N'COLUMN',@level2name=N'ProveedorCuentaBancariaCCI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la Moneda de la Cta Bancaria del Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresCuentasBancarias', @level2type=N'COLUMN',@level2name=N'ProveedorCuantaBancariaMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se registrarán las cuentas bancarias de los proveedores.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresCuentasBancarias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que relaciona los proveedores y sus facturas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProveedoresFacturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Utilidad establecida como parte del contrato.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proyectos', @level2type=N'COLUMN',@level2name=N'ProyectoUtilidadContratada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Utilidad Real del Proyecto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proyectos', @level2type=N'COLUMN',@level2name=N'ProyectoUtilidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Importe de Gastos Generales del Proyecto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proyectos', @level2type=N'COLUMN',@level2name=N'ProyectoGastosGenerales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del Proyecto: Activo / Inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proyectos', @level2type=N'COLUMN',@level2name=N'ProyectoEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la empresa a la que pertenece el proyecto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proyectos', @level2type=N'COLUMN',@level2name=N'ProyectoEmpresa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará los proyectos de Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Proyectos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará la relación de los proyectos y sus presupuestos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProyectosPresupuestos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de usuario del responsable del proyecto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProyectosResponsables', @level2type=N'COLUMN',@level2name=N'ResponsableId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Responsable: Residente Obra, Supervisor Obra, Miembro del Equipo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProyectosResponsables', @level2type=N'COLUMN',@level2name=N'ProyectoResponsableTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará los responsables de un proyecto.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProyectosResponsables'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Roles que manejará el sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acción que puede el rol realizar sobre la página:
C=Crear
R=Leer o Consultar
U=Actualizar
D=Eliminar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolesPaginas', @level2type=N'COLUMN',@level2name=N'Accion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Páginas a las que un determinado Rol tiene acceso.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RolesPaginas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Origen de tipo de cambio: Servicio Bco Nacion, Manual.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposdeCambio', @level2type=N'COLUMN',@level2name=N'TipoCambioOrigen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla donde se almacenará los distintos tipos de cambio por día con respecto a la moneda base (soles)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposdeCambio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que registrará los tipos de detracciones posibles de sus proveedores.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposDetracciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que incluye los distintos tipos de facturas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposFacturas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del tipo de proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores', @level2type=N'COLUMN',@level2name=N'TipoProveedorCodigo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del tipo de proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores', @level2type=N'COLUMN',@level2name=N'TipoProveedorDescripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro Tipo de Proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores', @level2type=N'COLUMN',@level2name=N'FechaCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que creó el registro tipo de proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores', @level2type=N'COLUMN',@level2name=N'UsuarioCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de la última actualización del tipo de proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores', @level2type=N'COLUMN',@level2name=N'FechaActualizacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del usuario que realizó la última actualización del registro tipo de proveedor.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores', @level2type=N'COLUMN',@level2name=N'UsuarioActualizacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipos posibles de Proveedores con los que trabaja Norton.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TiposProveedores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla que almacenará los usuarios de la aplicación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuarios'
GO
USE [master]
GO
ALTER DATABASE [norton] SET  READ_WRITE 
GO
