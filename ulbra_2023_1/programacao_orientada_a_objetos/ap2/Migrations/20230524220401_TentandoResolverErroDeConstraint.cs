using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ap2.Migrations
{
    /// <inheritdoc />
    public partial class TentandoResolverErroDeConstraint : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas");

            migrationBuilder.DropIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas");

            migrationBuilder.AlterColumn<int>(
                name: "VeiculoId",
                table: "Vagas",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.CreateIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas",
                column: "VeiculoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas",
                column: "VeiculoId",
                principalTable: "Veiculo",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas");

            migrationBuilder.DropIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas");

            migrationBuilder.AlterColumn<int>(
                name: "VeiculoId",
                table: "Vagas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "INTEGER",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas",
                column: "VeiculoId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas",
                column: "VeiculoId",
                principalTable: "Veiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
