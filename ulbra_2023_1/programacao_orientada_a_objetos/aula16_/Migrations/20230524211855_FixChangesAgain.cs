using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ap2.Migrations
{
    /// <inheritdoc />
    public partial class FixChangesAgain : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas");

            migrationBuilder.CreateIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas",
                column: "VeiculoId",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas");

            migrationBuilder.CreateIndex(
                name: "IX_Vagas_VeiculoId",
                table: "Vagas",
                column: "VeiculoId");
        }
    }
}
