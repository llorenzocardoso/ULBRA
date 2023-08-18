﻿// <auto-generated />
using AS;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace Aula19_AS_Teste
{
    [DbContext(typeof(MeuContexto))]
    [Migration("20230619234505_MapeandoMinhasList")]
    partial class MapeandoMinhasList
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder.HasAnnotation("ProductVersion", "7.0.5");

            modelBuilder.Entity("Aula19_AS_Teste.Autor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Autores");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Emprestimo", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int>("LivroId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("UsuarioId")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.HasIndex("LivroId");

                    b.HasIndex("UsuarioId");

                    b.ToTable("Emprestimos");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Livro", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<bool>("Emprestado")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Titulo")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Livros");
                });

            modelBuilder.Entity("Aula19_AS_Teste.LivroAutor", b =>
                {
                    b.Property<int>("LivroId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("AutorId")
                        .HasColumnType("INTEGER");

                    b.HasKey("LivroId", "AutorId");

                    b.HasIndex("AutorId");

                    b.ToTable("LivroAutor");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Usuario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Nome")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Usuarios");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Emprestimo", b =>
                {
                    b.HasOne("Aula19_AS_Teste.Livro", "Livro")
                        .WithMany()
                        .HasForeignKey("LivroId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Aula19_AS_Teste.Usuario", "Usuario")
                        .WithMany("Emprestimos")
                        .HasForeignKey("UsuarioId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Livro");

                    b.Navigation("Usuario");
                });

            modelBuilder.Entity("Aula19_AS_Teste.LivroAutor", b =>
                {
                    b.HasOne("Aula19_AS_Teste.Autor", "Autor")
                        .WithMany("Livros")
                        .HasForeignKey("AutorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Aula19_AS_Teste.Livro", "Livro")
                        .WithMany("Autores")
                        .HasForeignKey("LivroId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Autor");

                    b.Navigation("Livro");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Autor", b =>
                {
                    b.Navigation("Livros");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Livro", b =>
                {
                    b.Navigation("Autores");
                });

            modelBuilder.Entity("Aula19_AS_Teste.Usuario", b =>
                {
                    b.Navigation("Emprestimos");
                });
#pragma warning restore 612, 618
        }
    }
}