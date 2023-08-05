using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using aula12_ORM.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace aula12_ORM.Data
{
    public class DataContext : DbContext
    {
        public DbSet<Person> People { get; set; }

        public DbSet<Product> Product { get; set; }

        public string DbPath { get; }

        public DataContext()
        {
            string path = Directory.GetCurrentDirectory();
            DbPath = System.IO.Path.Join(path, "TestEFQuarta.db");
            
        }

        // The following configures EF to create a Sqlite database file in the
        // special "local" folder for your platform.
        protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseSqlite($"Data Source={DbPath}");
    }
}