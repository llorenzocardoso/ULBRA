using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ap2.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace ap2.Data
{
    public class DataContext : DbContext
    {
        public DbSet<Carro> Carros { get; set; }
        public DbSet<Moto> Motos { get; set; }
        public DbSet<Estacionamento> Vagas { get; set; }
        public string DbPath { get; }

        public DataContext()
        {
            string path = Directory.GetCurrentDirectory();
            DbPath = Path.Join(path, "AP2_Teste.db");

        }
        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite($"Data Source={DbPath}");
    }
}