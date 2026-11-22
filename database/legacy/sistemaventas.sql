-- ARCHIVO HISTORICO: modelo SQL anterior al modelo logico final documentado en docs/modelo-de-datos.md.
-- No representa el esquema canonico de 17 tablas ni debe usarse como entrega final.
-- Se retiro el DROP DATABASE y se sustituyeron las contrasenas de ejemplo por marcadores.
-- Revisa database/README.md antes de usar este archivo.

USE master;
GO
IF DB_ID('SistemaVentas') IS NOT NULL
    THROW 51000, 'SistemaVentas ya existe. Este script historico no la elimina; usa una instancia/base desechable si necesitas reconstruirla.', 1;
GO
CREATE DATABASE SistemaVentas;
GO

USE SistemaVentas;
GO

CREATE TABLE roles (
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre_rol NVARCHAR(50) NOT NULL UNIQUE,
    descripcion NVARCHAR(200)
);
GO

CREATE TABLE proveedores (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre_proveedor NVARCHAR(100) NOT NULL,
    telefono NVARCHAR(20),
    correo NVARCHAR(100),
    direccion NVARCHAR(200)
);
GO

CREATE TABLE categorias (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre_categoria NVARCHAR(100) NOT NULL UNIQUE,
    descripcion NVARCHAR(200)
);
GO

CREATE TABLE descuentos (
    id_descuento INT IDENTITY(1,1) PRIMARY KEY,
    nombre_descuento NVARCHAR(100) NOT NULL,
    porcentaje DECIMAL(5,2) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    CONSTRAINT CK_descuento_porcentaje
        CHECK (porcentaje >= 0 AND porcentaje <= 100)
);
GO

CREATE TABLE usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(100) NOT NULL UNIQUE,
    usuario NVARCHAR(50) NOT NULL UNIQUE,
    contrasena NVARCHAR(100) NOT NULL,
    id_rol INT NOT NULL,
    CONSTRAINT FK_usuarios_roles
        FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);
GO

CREATE TABLE vendedores (
    id_vendedor INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    CONSTRAINT FK_vendedores_usuarios
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
GO

CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    CONSTRAINT FK_clientes_usuarios
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
GO

CREATE TABLE administradores_generales (
    id_administrador INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    CONSTRAINT FK_administradores_usuarios
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
GO

CREATE TABLE productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre_producto NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(250),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT NOT NULL,
    id_descuento INT NULL,
    CONSTRAINT CK_productos_precio CHECK (precio >= 0),
    CONSTRAINT CK_productos_stock CHECK (stock >= 0),
    CONSTRAINT FK_productos_categorias
        FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    CONSTRAINT FK_productos_descuentos
        FOREIGN KEY (id_descuento) REFERENCES descuentos(id_descuento)
);
GO

CREATE TABLE inventarios (
    id_inventario INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT NOT NULL UNIQUE,
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    fecha_actualizacion DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT CK_inventario_stock CHECK (stock_actual >= 0),
    CONSTRAINT CK_inventario_minimo CHECK (stock_minimo >= 0),
    CONSTRAINT FK_inventarios_productos
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
GO

CREATE TABLE promociones (
    id_promocion INT IDENTITY(1,1) PRIMARY KEY,
    nombre_promocion NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(250),
    porcentaje_descuento DECIMAL(5,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    CONSTRAINT CK_promociones_porcentaje
        CHECK (porcentaje_descuento >= 0 AND porcentaje_descuento <= 100),
    CONSTRAINT CK_promociones_fechas
        CHECK (fecha_fin >= fecha_inicio)
);
GO

CREATE TABLE preventas (
    id_preventa INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_preventa DATETIME NOT NULL DEFAULT GETDATE(),
    estado NVARCHAR(30) NOT NULL DEFAULT N'Pendiente',
    CONSTRAINT FK_preventas_clientes
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_preventas_vendedores
        FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);
GO

CREATE TABLE ventas (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta DATETIME NOT NULL DEFAULT GETDATE(),
    total DECIMAL(10,2) NOT NULL,
    metodo_pago NVARCHAR(50) NOT NULL,
    CONSTRAINT CK_ventas_total CHECK (total >= 0),
    CONSTRAINT FK_ventas_clientes
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_ventas_vendedores
        FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);
GO

CREATE TABLE detalles_venta (
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT CK_detalle_cantidad CHECK (cantidad > 0),
    CONSTRAINT CK_detalle_precio CHECK (precio_unitario >= 0),
    CONSTRAINT CK_detalle_subtotal CHECK (subtotal >= 0),
    CONSTRAINT FK_detalles_ventas
        FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    CONSTRAINT FK_detalles_productos
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
GO

CREATE TABLE proveedor_producto (
    id_proveedor INT NOT NULL,
    id_producto INT NOT NULL,
    precio_compra DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_proveedor, id_producto),
    CONSTRAINT CK_proveedor_producto_precio
        CHECK (precio_compra >= 0),
    CONSTRAINT FK_proveedor_producto_proveedor
        FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    CONSTRAINT FK_proveedor_producto_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
GO

CREATE TABLE venta_promocion (
    id_venta INT NOT NULL,
    id_promocion INT NOT NULL,
    PRIMARY KEY (id_venta, id_promocion),
    CONSTRAINT FK_venta_promocion_venta
        FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    CONSTRAINT FK_venta_promocion_promocion
        FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion)
);
GO

CREATE TABLE preventa_producto (
    id_preventa INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_preventa, id_producto),
    CONSTRAINT CK_preventa_producto_cantidad CHECK (cantidad > 0),
    CONSTRAINT CK_preventa_producto_precio CHECK (precio_unitario >= 0),
    CONSTRAINT FK_preventa_producto_preventa
        FOREIGN KEY (id_preventa) REFERENCES preventas(id_preventa),
    CONSTRAINT FK_preventa_producto_producto
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
GO

CREATE TABLE reportes_semanales (
    id_reporte INT IDENTITY(1,1) PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    total_ventas DECIMAL(12,2) NOT NULL,
    cantidad_ventas INT NOT NULL,
    fecha_generacion DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT CK_reporte_fechas CHECK (fecha_fin >= fecha_inicio),
    CONSTRAINT CK_reporte_total CHECK (total_ventas >= 0),
    CONSTRAINT CK_reporte_cantidad CHECK (cantidad_ventas >= 0)
);
GO

INSERT INTO roles (nombre_rol, descripcion)
VALUES
(N'Administrador General', N'Gestiona todo el sistema'),
(N'Vendedor', N'Realiza y administra ventas'),
(N'Cliente', N'Compra productos');
GO

INSERT INTO proveedores (nombre_proveedor, telefono, correo, direccion)
VALUES
(N'Proveedor General', N'70000001', N'proveedor1@sistemaventas.com', N'Direccion General'),
(N'Proveedor Tecnologico', N'70000002', N'proveedor2@sistemaventas.com', N'Direccion Tecnologica'),
(N'Proveedor Comercial', N'70000003', N'proveedor3@sistemaventas.com', N'Direccion Comercial');
GO

INSERT INTO categorias (nombre_categoria, descripcion)
VALUES
(N'Computacion', N'Productos de computacion'),
(N'Accesorios', N'Accesorios tecnologicos'),
(N'Oficina', N'Productos para oficina');
GO

INSERT INTO descuentos (nombre_descuento, porcentaje, fecha_inicio, fecha_fin)
VALUES
(N'Descuento General', 10.00, '2026-01-01', '2026-12-31'),
(N'Descuento Especial', 15.00, '2026-01-01', '2026-12-31');
GO

INSERT INTO usuarios (nombre, correo, usuario, contrasena, id_rol)
VALUES
(N'Administrador General', N'admin@sistemaventas.com', N'admin', N'SIN_CREDENCIAL_CONFIGURADA', 1),
(N'Vendedor', N'vendedor@sistemaventas.com', N'vendedor', N'SIN_CREDENCIAL_CONFIGURADA', 2),
(N'Cliente', N'cliente@sistemaventas.com', N'cliente', N'SIN_CREDENCIAL_CONFIGURADA', 3);
GO

INSERT INTO administradores_generales (id_usuario)
VALUES (1);
GO

INSERT INTO vendedores (id_usuario)
VALUES (2);
GO

INSERT INTO clientes (id_usuario)
VALUES (3);
GO

INSERT INTO productos
(nombre_producto, descripcion, precio, stock, id_categoria, id_descuento)
VALUES
(N'Computadora', N'Equipo de computacion', 4200.00, 10, 1, 1),
(N'Mouse', N'Mouse para computadora', 95.00, 30, 2, NULL),
(N'Teclado', N'Teclado para computadora', 150.00, 25, 2, 2),
(N'Monitor', N'Monitor para computadora', 1200.00, 15, 1, NULL);
GO

INSERT INTO inventarios (id_producto, stock_actual, stock_minimo)
VALUES
(1, 10, 2),
(2, 30, 5),
(3, 25, 5),
(4, 15, 3);
GO

INSERT INTO promociones
(nombre_promocion, descripcion, porcentaje_descuento, fecha_inicio, fecha_fin)
VALUES
(N'Promocion General', N'Promocion para productos seleccionados', 10.00, '2026-01-01', '2026-12-31'),
(N'Promocion Especial', N'Promocion especial del sistema', 15.00, '2026-01-01', '2026-12-31');
GO

INSERT INTO proveedor_producto (id_proveedor, id_producto, precio_compra)
VALUES
(1, 1, 3500.00),
(1, 2, 60.00),
(2, 3, 100.00),
(3, 4, 900.00);
GO

INSERT INTO preventas (id_cliente, id_vendedor, estado)
VALUES (1, 1, N'Pendiente');
GO

INSERT INTO preventa_producto
(id_preventa, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 1, 4200.00),
(1, 2, 1, 95.00);
GO

INSERT INTO ventas
(id_cliente, id_vendedor, total, metodo_pago)
VALUES
(1, 1, 4295.00, N'Efectivo');
GO

INSERT INTO detalles_venta
(id_venta, id_producto, cantidad, precio_unitario, subtotal)
VALUES
(1, 1, 1, 4200.00, 4200.00),
(1, 2, 1, 95.00, 95.00);
GO

INSERT INTO venta_promocion (id_venta, id_promocion)
VALUES (1, 1);
GO

INSERT INTO reportes_semanales
(fecha_inicio, fecha_fin, total_ventas, cantidad_ventas)
VALUES
('2026-09-01', '2026-09-07', 4295.00, 1);
GO
