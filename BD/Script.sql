CREATE DATABASE crud

GO

USE [crud]

GO

CREATE TABLE [dbo].[tbl_Empresa](
	[id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[razon_social] [varchar](50) NULL,
	[ruc] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Empresa] PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GO

CREATE TABLE [dbo].[tbl_Empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [int] NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cedula] [varchar](50) NULL,
	[sexo] [varchar](10) NULL,
	[carga_familiar] [int] NULL,
	[telefono] [varchar](50) NULL,
	[direccion] [varchar](100) NULL,
	[nivel_estudios] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_Empleados]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Empleados_tbl_Empresa] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[tbl_Empresa] ([id_empresa])
GO

ALTER TABLE [dbo].[tbl_Empleados] CHECK CONSTRAINT [FK_tbl_Empleados_tbl_Empresa]

GO

CREATE PROCEDURE listarEmpresas
AS    
   SELECT * FROM tbl_Empresa;
RETURN 
GO

CREATE PROCEDURE insertarEmpresa
   @nombre VARCHAR(50),  
   @razon_social VARCHAR(50),
   @ruc VARCHAR(20),
   @direccion VARCHAR(50),
   @telefono VARCHAR(10)
AS 
BEGIN 
   INSERT INTO tbl_Empresa(nombre, razon_social, ruc, direccion, telefono) 
	VALUES (@nombre,@razon_social,@ruc,@direccion,@telefono);
END

GO

CREATE PROCEDURE modificarEmpresa
   @id INT,
   @nombre VARCHAR(50),  
   @razon_social VARCHAR(50),
   @ruc VARCHAR(20),
   @direccion VARCHAR(50),
   @telefono VARCHAR(10)
AS 
BEGIN 
	UPDATE tbl_Empresa SET nombre = @nombre, razon_social = @razon_social, ruc = @ruc, direccion = @direccion, telefono = @telefono
	WHERE id_empresa = @id;
END

GO

CREATE PROCEDURE eliminarEmpresa
   @id INT
AS 
BEGIN 
	DELETE FROM tbl_Empresa
	WHERE id_empresa = @id;
END

GO

CREATE PROCEDURE listarEmpleados
AS    
   SELECT E.id_empleado, P.id_empresa, P.nombre AS nombreEmpresa, E.nombres, E.apellidos, E.cedula, E.sexo, E.carga_familiar, E.telefono, E.direccion, E.nivel_estudios 
   FROM tbl_Empleados E, tbl_Empresa P
   WHERE E.id_empresa = P.id_empresa;
RETURN 

GO

CREATE PROCEDURE insertarEmpleado
   @id_empresa INT,  
   @nombres VARCHAR(50),  
   @apellidos VARCHAR(50),
   @cedula VARCHAR(50),
   @sexo VARCHAR(10),
   @carga_familiar INT,
   @telefono VARCHAR(50),
   @direccion VARCHAR(100),
   @nivel_estudios VARCHAR(50)
AS 
BEGIN 
   INSERT INTO tbl_Empleados(id_empresa, nombres, apellidos, cedula, sexo, carga_familiar, telefono, direccion, nivel_estudios) 
	VALUES (@id_empresa, @nombres, @apellidos, @cedula, @sexo, @carga_familiar, @telefono, @direccion, @nivel_estudios);
END

GO

CREATE PROCEDURE modificarEmpleado
   @id_empleado INT,
   @id_empresa INT,  
   @nombres VARCHAR(50),  
   @apellidos VARCHAR(50),
   @cedula VARCHAR(50),
   @sexo VARCHAR(10),
   @carga_familiar INT,
   @telefono VARCHAR(50),
   @direccion VARCHAR(100),
   @nivel_estudios VARCHAR(50)
AS 
BEGIN 
   UPDATE tbl_Empleados SET id_empresa = @id_empresa, nombres = @nombres, apellidos = @apellidos, cedula = @cedula, sexo = @sexo, carga_familiar = @carga_familiar, telefono = @telefono, direccion = @direccion, nivel_estudios = @nivel_estudios
	WHERE id_empleado = @id_empleado;
END

GO

CREATE PROCEDURE eliminarEmpleado
   @id INT
AS 
BEGIN 
	DELETE FROM tbl_Empleados
	WHERE id_empleado = @id;
END

GO
-- Reporte

CREATE PROCEDURE listarEmpleadosEmpresa
   @idEmpresa INT
AS    
   SELECT E.id_empleado, P.id_empresa, P.nombre AS nombreEmpresa, E.nombres, E.apellidos, E.cedula, E.sexo, E.carga_familiar, E.telefono, E.direccion, E.nivel_estudios 
   FROM tbl_Empleados E, tbl_Empresa P
   WHERE E.id_empresa = P.id_empresa AND P.id_empresa = @idEmpresa;
RETURN 
