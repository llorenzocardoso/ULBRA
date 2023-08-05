using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ap2.Migrations
{
    /// <inheritdoc />
    public partial class AddColumnVagasId : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
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

            migrationBuilder.AddColumn<int>(
                name: "VagaId",
                table: "Vagas",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas",
                column: "VeiculoId",
                principalTable: "Veiculo",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas");

            migrationBuilder.DropColumn(
                name: "VagaId",
                table: "Vagas");

            migrationBuilder.AlterColumn<int>(
                name: "VeiculoId",
                table: "Vagas",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.AddForeignKey(
                name: "FK_Vagas_Veiculo_VeiculoId",
                table: "Vagas",
                column: "VeiculoId",
                principalTable: "Veiculo",
                principalColumn: "Id");
        }
    }
}
