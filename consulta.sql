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

/*consulta distinct --> nos muestra los valores 
distintos de un campo */

Select distinct RFC_Cli from producto ORDER BY RFC_Cli asc;
Select distinct RFC_prov from producto;
/*es between*/
Select * from producto where precio between 3000 and 100000; /* cuando el cliente quiera saber que le alcanza con el dinero de su cuenta*/
Select * from Cliente where Fecha_Cli between '2000-01-12' and '2003-09-12';

/* like --> nos permite buscar patrones cuando el tabulador 
% se encuentre al final del patron lo busca al inicio hacer dos cunsultas para cada tabla d
una %patron% y otra %pa %patron% pa%*/

Select * from Cliente where Nombre_Cli like '%ua%' or Apellidos like'%ro';

/* Las funciones SQL MIN() y MAX()
la función MIN() devuelve el valor más pequeño de lacoluna seleccionada.

La función MAX() devuelve el valor más grande de 
la columna selccionada.*/

Select min(Precio) as elPrecioMasBajo From producto;
Select max(Precio) as elPrecioMasAlto From producto;
Select max(Fecha_Cli) as laFechaMasAlto From Cliente;

/*la funcion count devuelve el número de filas 
que coinciden una condicion*/

Select count(Nombre_Prod) as totalDeProductos from producto;/*puedo contar cuantas mujeres y cuantos hombres hay de una escuela usando el 'count' y una condicion 'where'*/
Select count(RFC_prov) as totalProveedores from Proveedor;

Select * from producto;

/* avg devuelve el valor promedio de una columna*/
Select * from producto;
Select avg (Precio) as PromedioDePrecio From producto;

/*funcion sum devuelve la suma total de una columna*/
select sum (Precio) as SumaAllPrecios From producto;
select sum (Precio) as SumaAllPrecios From producto and avg(SumaAllPrecio) as promedio from producto;

/*CONSULTA DE DOS TABLAS*/
/* join permite hacer una consulta para multiples tablas, 
por lo general se dice que dos tablas, pero pueden ser mas....
el punto en una consulta sirve apra concatenar, unir--> tablas*/

Select * from Cliente INNER JOIN producto ON
Cliente.RFC_Cli = producto.RFC_Cli where producto.RFC_Cli = 'OOIH830118LS1';

Select * from Proveedor INNER JOIN producto ON
Proveedor.RFC_prov = producto.RFC_prov Where Nombre_Pro like '%CH%';

Select Cliente.RFC_Cli, Proveedor.RFC_prov, codigo from producto JOIN Cliente ON
producto.RFC_Cli = Cliente.RFC_Cli JOIN Proveedor ON
producto.RFC_prov = Proveedor.RFC_prov;

Update Cliente set Apellidos = 'LOPEZ PORTILLO' where RFC_Cli = '02QW830118LS1';
Select * from Cliente;

Update producto set Nombre_Prod = 'Mackbook Air 8GB 1tb' where codigo = 3; 
Select * from producto;

Update producto set [Nombre_Prod] = 'Mackbook Air 8GB 1tb',
[precio] = 20000 where codigo = 3; 

Delete from producto where RFC_Cli = '02QW830118LS1';
Delete from Cliente where RFC_Cli = '02QW830118LS1';
Select * from Cliente;

/* BEGIN TRAN ,,,, ROLLBACK*/

BEGIN TRAN
Delete from producto where RFC_Cli = 'OOIH830118LS1'
Select * from producto;
ROLLBACK

/*truncate --> eliminar todas los registros tabla, eliminar toda la tabla y vuelve a crearla*/
BEGIN TRAN
TRUNCATE TABLE producto;
Select * from producto;
ROLLBACK
/*Drop table --> eliminar la tabla definitivamente de la base 
 de datos y no hay forma de recuperacion estandar*/
 BEGIN TRAN
 Drop table producto;
 Select * from producto;
 ROLLBACK

 Create procedure insertarClientes

 @RFC varchar (13),
 @nombre varchar (30),
 @apellido varchar(30),
 @direccion varchar(50),
 @fNac varchar (10)
 as
 begin
 Insert into cliente (RFC_Cli, Nombre_Cli, Apellidos, Direccion_Cli, Fecha_Cli)
				values(@RFC,@nombre,@apellido,@direccion,@fNac);
end
execute insertarClientes 'kdkdjdkskj1232','Nombre','apellido','direccion','2000-09-23';
select * from cliente

 create procedure PA_Calculo
 @codigo int,
 @precionuevo INT
 as
 begin
 update producto set precio = (precio + @precionuevo) where codigo = @codigo;
 end
 drop procedure PA_Calculo
 Select * from producto;

 execute PA_Calculo 3, 5000;
