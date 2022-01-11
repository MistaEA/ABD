Create table Cliente(
RFC_Cli varchar (13) primary key not null,
Nombre_Cli varchar(30),
Apellidos varchar(30),
Direccion_Cli varchar(70), 
Fecha_Cli varchar (10));

Create table Proveedor(
RFC_prov varchar (13) primary key not null,
Nombre_Pro varchar(50),
Direccion_Prov varchar (70));

Create table producto(
Codigo int primary key not null,
Nombre_Prod varchar (30),
Precio int, 
RFC_Cli varchar (13),
RFC_prov varchar (13),
CONSTRAINT fk_Cliente FOREIGN KEY (RFC_Cli) REFERENCES Cliente (RFC_Cli),
CONSTRAINT fk_Proveedor FOREIGN KEY (RFC_prov) REFERENCES Proveedor (RFC_prov));

/* insert comando de tipo dml que nos permite insertar datos a las tablas*/

/*Insertamos clientes*/
Insert Into Cliente(RFC_Cli,Nombre_Cli,Apellidos,Direccion_Cli,Fecha_Cli)
values ('OOIH830118LS1','HECTOR','JIMENEZ GUERRERO','LA CASILDA ALTO VALLE MZ 41 LT 2 07150', '2003-09-12');
values ('02QW830118LS1','JUAN','LOPEZ','CARRANZA MZ 93 LT 23 93824','2000-01-12');
values ('18LKJF3426DF3','PEPE','CASTILLO VENEGA', 'MARTIN CARRERA MZ 54 LT 92 08289', '1993-03-23');

/*Insertamos proveedores*/
Insert Into Proveedor(RFC_prov, Nombre_Pro, Direccion_Prov)
values('02DL830938JD2','LUCHA MARTINEZ LOPEZ','LAS NIEVES LT 43 09213');
Insert Into Proveedor(RFC_prov, Nombre_Pro, Direccion_Prov)
values('02KDJD7238JL4','JOSE LOPEZ MENDEZ','JOYAS LA CASILDA MZ 92 LT 12 09291');

/*Insertamos productos vendidos*/
Insert Into producto(Codigo, Nombre_Prod, Precio, RFC_Cli ,RFC_prov )
values(1,'TV Plasma 34pulg',3343,'OOIH830118LS1','02DL830938JD2');
Insert Into producto(Codigo, Nombre_Prod, Precio, RFC_Cli ,RFC_prov )
values(2,'Iphone SE 2020',10000,'02QW830118LS1','02KDJD7238JL4');
Insert Into producto(Codigo, Nombre_Prod, Precio, RFC_Cli ,RFC_prov )
values(3,'Mackbook Air',40000,'18LKJF3426DF3','02DL830938JD2');
Insert Into producto(Codigo, Nombre_Prod, Precio, RFC_Cli ,RFC_prov )
values(4,'Bicicleta Oxford',1500,'OOIH830118LS1','02KDJD7238JL4');

/* SELECT nos permite crear busquedas en las tablas segun ciertas condiciones
-> NOS MUESTRA TODOS LOS CAMPOS DE LA TABLA
CAMPO, CAMPO NOS MUESTRA LOS CAMPOS ESPECIFICOS
*/
Select * from Cliente;
Select * from Proveedor;
Select * from Producto;

Select RFC_Cli, Nombre_Cli, Apellidos From Cliente;
Select RFC_prov, Nombre_Pro From Proveedor;
Select Nombre_Prod, Precio, RFC_Cli, RFC_prov From Producto;

/* Consula con filtros where --> cuando se cumpla la siguiente condicion*/
Select * from Cliente Where RFC_Cli = '02QW830118LS1';
Select RFC_prov from Proveedor Where Nombre_Pro = 'Lucha martinez lopez';
Select RFC_Cli, Nombre_Cli, Direccion_Cli  from  Cliente Where Fecha_Cli = '2000-01-12'
Select Nombre_Prod, RFC_Cli From producto Where RFC_prov = '02DL830938JD2';

/*uso operadores logicos and y or
v and v = v   v or v = v
v and f = f   v or f = v
f and v = f   f or v = v
f and f = f   f or f = f*/

Select * from Cliente where RFC_Cli = 'OOIH830118LS1' and Apellidos = 'Jimenez Guerrero'; 
Select * from Cliente where RFC_Cli = '02QW830118LS1' or Apellidos = 'Martinez Lopez';

/* order by --> permite ordenar de manera ascendente o descendente los 
resultados de la consulta*/
Select * from producto order by Nombre_Prod asc;
Select * from Proveedor order by RFC_prov desc;

Select * from Cliente where RFC_Cli in('02QW830118LS1','OOIH830118LS1');