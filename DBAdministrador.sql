CREATE DATABASE DBAdministrador
GO

USE DBAdministrador
GO

CREATE TABLE Rol
(
 [Id] int not null primary key identity(1,1),
 [Nombre] varchar(100) not null
)
GO

CREATE TABLE Usuario
(
 [Id] int not null primary key identity(1,1), 
 [IdRol] int not null, 
 [Nombre] varchar(100) not null, 
 [Apellido] varchar(100) not null,
 [Login] varchar(100) not null,
 [Password] varchar(37) not null,
 [Estatus] tinyint not null,
 [FechaRegistro] datetime not null,
 foreign key (IdRol) references Rol(Id) on delete Cascade
)

Create Table Empleado(
 [Id] int not null primary key identity(1,1), 
 [IdUsuario] int not null, 
 [Nombre] varchar(100) not null, 
 [Apellido] varchar(100) not null,
 [Edad] char (5) not null,
 [Departamento] varchar(100) not null,
 [Telefono] varchar(15) not null,
 foreign key (IdUsuario) references Usuario(Id) on delete Cascade
)

CREATE TABLE Producto
(
 [Id] int not null primary key identity(1,1), 
 [NombreProducto] varchar(100) not null, 
 [Marca] varchar(100) not null,
 [Descripcion] varchar(200) not null,
 [Precio] char(15) not null
)

Insert Into Rol(Nombre) Values ('Administrador')
Insert Into Rol(Nombre) Values ('Usuario')

Insert Into Usuario(IdRol,Nombre,Apellido,Login,Password,Estatus,FechaRegistro) Values (1,'Miguel','Alfaro','Miguel','d6cad8870561635eb680ee7f035c6dfe',1,'14/01/2024')


Insert Into Usuario(IdRol,Nombre,Apellido,Login,Password,Estatus,FechaRegistro) Values (1,'franklin','agreda','franklin','202cb962ac59075b964b07152d234b70',1,'02/03/2026')

Insert Into Producto(NombreProducto,Marca,Descripcion,Precio) Values ('Samsung S20 Fe', 'Samsung', 'Procesador Exynos 990 con 6GB de memoria RAM y 128GB de almacenamiento interno', '$550.99')

Select * From Rol
Select * From Usuario
Select * From Producto