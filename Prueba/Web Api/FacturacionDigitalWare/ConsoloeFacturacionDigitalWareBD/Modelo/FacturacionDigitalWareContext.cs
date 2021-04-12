using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ConsoloeFacturacionDigitalWareBD.Modelo
{
    public partial class FacturacionDigitalWareContext : DbContext
    {
        public virtual DbSet<Categoria> Categoria { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<DetalleFactura> DetalleFactura { get; set; }
        public virtual DbSet<EncabezadoFactura> EncabezadoFactura { get; set; }
        public virtual DbSet<ModoPago> ModoPago { get; set; }
        public virtual DbSet<Producto> Producto { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer(@"Server=LocalHost;Database=FacturacionDigitalWare;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categoria>(entity =>
            {
                entity.HasKey(e => e.IdCategoria);

                entity.Property(e => e.DescripcionCategoria)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NombreCategoria)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.IdCliente);

                entity.Property(e => e.Apellido)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Direccion)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaNacimiento)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Telefono)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<DetalleFactura>(entity =>
            {
                entity.HasKey(e => new { e.IdFacturaDetalle, e.IdFacturaEncabezado });

                entity.HasIndex(e => e.IdProducto)
                    .HasName("UQ_DetalleFactura")
                    .IsUnique();

                entity.Property(e => e.IdFacturaDetalle).ValueGeneratedOnAdd();

                entity.Property(e => e.Precio).HasColumnType("decimal(18, 0)");
            });

            modelBuilder.Entity<EncabezadoFactura>(entity =>
            {
                entity.HasKey(e => e.IdFacturaEncabezado);

                entity.HasIndex(e => new { e.IdCliente, e.IdModoPago })
                    .HasName("UQ_EncabezadoFactura")
                    .IsUnique();

                entity.Property(e => e.Fecha)
                    .HasColumnName("fecha")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<ModoPago>(entity =>
            {
                entity.HasKey(e => e.IdModoPago);

                entity.Property(e => e.NombreModoPago)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.OtrosDetalles)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Producto>(entity =>
            {
                entity.HasKey(e => e.IdProducto);

                entity.HasIndex(e => e.IdCategoria)
                    .HasName("UQ_Producto")
                    .IsUnique();

                entity.Property(e => e.NombreProducto)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PrecioProducto).HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Stock).HasColumnName("stock");
            });
        }
    }
}
