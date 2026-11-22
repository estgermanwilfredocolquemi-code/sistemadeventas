using System;
using System.Collections.Generic;

namespace NexCodeSales
{
    class Producto
    {
        public int Id;
        public string Nombre = string.Empty;
        public string Categoria = string.Empty;
        public string Proveedor = string.Empty;
        public double Precio;
        public int Stock;
    }
    class Cliente
    {
        public int Id;
        public string Nombre = string.Empty;
        public string Telefono = string.Empty;
        public string Correo = string.Empty;
    }
    class Usuario
    {
        public int Id;
        public string Nombre = string.Empty;
        public string Rol = string.Empty;
    }

    class Program
    {
        static List<Producto> productos = new List<Producto>();
        static List<Cliente> clientes = new List<Cliente>();
        static List<Usuario> usuarios = new List<Usuario>();

        static double totalVentas = 0;
        static int numeroVenta = 1;

        static void Main(string[] args)
        {
            CargarDatos();

            int opcion;

            do
            {
                Console.Clear();

                Console.WriteLine("==========================================");
                Console.WriteLine("             NEXCODE SALES");
                Console.WriteLine(" Sistema de Ventas, Inventario y Clientes");
                Console.WriteLine("==========================================");

                Console.WriteLine("\n1. Administrador General");
                Console.WriteLine("2. Vendedor");
                Console.WriteLine("3. Cliente");
                Console.WriteLine("4. Productos");
                Console.WriteLine("5. Inventario");
                Console.WriteLine("6. Ventas");
                Console.WriteLine("7. Reportes");
                Console.WriteLine("8. Salir");

                Console.Write("\nSeleccione una opcion: ");
                opcion = Convert.ToInt32(Console.ReadLine());

                switch (opcion)
                {
                    case 1:
                        MenuAdministrador();
                        break;

                    case 2:
                        MenuVendedor();
                        break;

                    case 3:
                        MenuCliente();
                        break;

                    case 4:
                        MenuProductos();
                        break;

                    case 5:
                        MostrarInventario();
                        break;

                    case 6:
                        RegistrarVenta();
                        break;

                    case 7:
                        MostrarReporte();
                        break;

                    case 8:
                        Console.WriteLine("\nSistema finalizado.");
                        break;

                    default:
                        Console.WriteLine("\nOpcion no valida.");
                        Pausa();
                        break;
                }

            } while (opcion != 8);
        }

        // =========================
        // DATOS INICIALES
        // =========================
        static void CargarDatos()
        {
            productos.Add(new Producto
            {
                Id = 1,
                Nombre = "Laptop",
                Categoria = "Electronica",
                Proveedor = "Proveedor A",
                Precio = 4500,
                Stock = 10
            });

            productos.Add(new Producto
            {
                Id = 2,
                Nombre = "Mouse",
                Categoria = "Accesorios",
                Proveedor = "Proveedor B",
                Precio = 80,
                Stock = 25
            });

            productos.Add(new Producto
            {
                Id = 3,
                Nombre = "Teclado",
                Categoria = "Accesorios",
                Proveedor = "Proveedor B",
                Precio = 150,
                Stock = 15
            });

            clientes.Add(new Cliente
            {
                Id = 1,
                Nombre = "Cliente General",
                Telefono = "70000000",
                Correo = "cliente@gmail.com"
            });

            usuarios.Add(new Usuario
            {
                Id = 1,
                Nombre = "Administrador",
                Rol = "Administrador General"
            });

            usuarios.Add(new Usuario
            {
                Id = 2,
                Nombre = "Vendedor",
                Rol = "Vendedor"
            });
        }

        // =========================
        // ADMINISTRADOR
        // =========================
        static void MenuAdministrador()
        {
            Console.Clear();

            Console.WriteLine("================================");
            Console.WriteLine("       ADMINISTRADOR GENERAL");
            Console.WriteLine("================================");

            Console.WriteLine("\nUsuarios registrados:");

            foreach (Usuario usuario in usuarios)
            {
                Console.WriteLine(
                    usuario.Id + " - " +
                    usuario.Nombre + " - " +
                    usuario.Rol);
            }

            Console.WriteLine("\nFunciones del administrador:");
            Console.WriteLine("- Gestionar usuarios");
            Console.WriteLine("- Gestionar productos");
            Console.WriteLine("- Gestionar inventario");
            Console.WriteLine("- Consultar reportes");
            Console.WriteLine("- Gestionar proveedores");

            Pausa();
        }

        // =========================
        // VENDEDOR
        // =========================
        static void MenuVendedor()
        {
            Console.Clear();

            Console.WriteLine("==============================");
            Console.WriteLine("          VENDEDOR");
            Console.WriteLine("==============================");

            Console.WriteLine("\n1. Registrar venta");
            Console.WriteLine("2. Ver productos");
            Console.WriteLine("3. Ver clientes");

            Console.Write("\nSeleccione una opcion: ");
            int opcion = Convert.ToInt32(Console.ReadLine());

            if (opcion == 1)
            {
                RegistrarVenta();
            }
            else if (opcion == 2)
            {
                MostrarProductos();
            }
            else if (opcion == 3)
            {
                MostrarClientes();
            }
            else
            {
                Console.WriteLine("\nOpcion no valida.");
                Pausa();
            }
        }

        // =========================
        // CLIENTE
        // =========================
        static void MenuCliente()
        {
            Console.Clear();

            Console.WriteLine("==============================");
            Console.WriteLine("           CLIENTE");
            Console.WriteLine("==============================");

            Console.WriteLine("\nClientes registrados:");

            MostrarClientes();

            Console.WriteLine("\nEl cliente puede:");
            Console.WriteLine("- Consultar productos");
            Console.WriteLine("- Realizar pedidos");
            Console.WriteLine("- Realizar preventas");

            Pausa();
        }

        // =========================
        // PRODUCTOS
        // =========================
        static void MenuProductos()
        {
            Console.Clear();

            Console.WriteLine("==============================");
            Console.WriteLine("          PRODUCTOS");
            Console.WriteLine("==============================");

            MostrarProductos();

            Console.WriteLine("\n1. Agregar producto");
            Console.WriteLine("2. Volver");

            Console.Write("\nSeleccione una opcion: ");
            int opcion = Convert.ToInt32(Console.ReadLine());

            if (opcion == 1)
            {
                AgregarProducto();
            }
        }

        static void MostrarProductos()
        {
            Console.WriteLine("\n--------- LISTA DE PRODUCTOS ---------");

            foreach (Producto producto in productos)
            {
                Console.WriteLine(
                    "ID: " + producto.Id +
                    " | Producto: " + producto.Nombre +
                    " | Categoria: " + producto.Categoria +
                    " | Precio: Bs " + producto.Precio +
                    " | Stock: " + producto.Stock);
            }

            Pausa();
        }

        static void AgregarProducto()
        {
            Console.Clear();

            Producto producto = new Producto();

            Console.WriteLine("--------- NUEVO PRODUCTO ---------");

            Console.Write("ID: ");
            producto.Id = Convert.ToInt32(Console.ReadLine());

            Console.Write("Nombre: ");
            producto.Nombre = Console.ReadLine() ?? string.Empty;

            Console.Write("Categoria: ");
            producto.Categoria = Console.ReadLine() ?? string.Empty;

            Console.Write("Proveedor: ");
            producto.Proveedor = Console.ReadLine() ?? string.Empty;

            Console.Write("Precio: ");
            producto.Precio = Convert.ToDouble(Console.ReadLine());

            Console.Write("Stock: ");
            producto.Stock = Convert.ToInt32(Console.ReadLine());

            productos.Add(producto);

            Console.WriteLine("\nProducto agregado correctamente.");

            Pausa();
        }

        // =========================
        // CLIENTES
        // =========================
        static void MostrarClientes()
        {
            Console.WriteLine("\n--------- CLIENTES ---------");

            foreach (Cliente cliente in clientes)
            {
                Console.WriteLine(
                    "ID: " + cliente.Id +
                    " | Nombre: " + cliente.Nombre +
                    " | Telefono: " + cliente.Telefono +
                    " | Correo: " + cliente.Correo);
            }

            Pausa();
        }

        // =========================
        // INVENTARIO
        // =========================
        static void MostrarInventario()
        {
            Console.Clear();

            Console.WriteLine("================================");
            Console.WriteLine("           INVENTARIO");
            Console.WriteLine("================================");

            foreach (Producto producto in productos)
            {
                Console.WriteLine(
                    "\nProducto: " + producto.Nombre +
                    "\nStock: " + producto.Stock);

                if (producto.Stock == 0)
                {
                    Console.WriteLine("Estado: SIN STOCK");
                }
                else if (producto.Stock <= 5)
                {
                    Console.WriteLine("Estado: STOCK BAJO");
                }
                else
                {
                    Console.WriteLine("Estado: DISPONIBLE");
                }
            }

            Pausa();
        }

        // =========================
        // VENTAS
        // =========================
        static void RegistrarVenta()
        {
            Console.Clear();

            Console.WriteLine("================================");
            Console.WriteLine("        REGISTRO DE VENTA");
            Console.WriteLine("================================");

            MostrarProductosSinPausa();

            Console.Write("\nIngrese ID del producto: ");
            int id = Convert.ToInt32(Console.ReadLine());

            Producto? productoEncontrado = null;

            foreach (Producto producto in productos)
            {
                if (producto.Id == id)
                {
                    productoEncontrado = producto;
                }
            }

            if (productoEncontrado == null)
            {
                Console.WriteLine("\nProducto no encontrado.");
                Pausa();
                return;
            }

            Console.Write("Cantidad: ");
            int cantidad = Convert.ToInt32(Console.ReadLine());

            if (cantidad <= 0)
            {
                Console.WriteLine("\nCantidad no valida.");
            }
            else if (cantidad > productoEncontrado.Stock)
            {
                Console.WriteLine("\nNo existe suficiente stock.");
            }
            else
            {
                double subtotal =
                    productoEncontrado.Precio * cantidad;

                productoEncontrado.Stock -= cantidad;

                totalVentas += subtotal;

                Console.WriteLine("\n========= VENTA =========");
                Console.WriteLine("Nro. venta: " + numeroVenta);
                Console.WriteLine("Producto: " + productoEncontrado.Nombre);
                Console.WriteLine("Cantidad: " + cantidad);
                Console.WriteLine("Precio: Bs " + productoEncontrado.Precio);
                Console.WriteLine("Subtotal: Bs " + subtotal);
                Console.WriteLine("Venta registrada correctamente.");

                numeroVenta++;
            }

            Pausa();
        }

        static void MostrarProductosSinPausa()
        {
            Console.WriteLine("\n--------- PRODUCTOS ---------");

            foreach (Producto producto in productos)
            {
                Console.WriteLine(
                    producto.Id + " - " +
                    producto.Nombre +
                    " - Bs " + producto.Precio +
                    " - Stock: " + producto.Stock);
            }
        }

        // =========================
        // REPORTES
        // =========================
        static void MostrarReporte()
        {
            Console.Clear();

            Console.WriteLine("================================");
            Console.WriteLine("            REPORTES");
            Console.WriteLine("================================");

            Console.WriteLine("\nTotal acumulado de ventas:");
            Console.WriteLine("Bs " + totalVentas);

            Console.WriteLine("\nProductos registrados: " +
                productos.Count);

            Console.WriteLine("Clientes registrados: " +
                clientes.Count);

            Console.WriteLine("Usuarios registrados: " +
                usuarios.Count);

            Pausa();
        }
        static void Pausa()
        {
            Console.WriteLine("\nPresione ENTER para continuar...");
            Console.ReadLine();
        }
    }
}
