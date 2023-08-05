# AS - PROGRAMAÇÃO ORIENTADA A OBJETOS - 2023-1

<!-- LIVROS -->

### ADICIONAR LIVRO

POST - localhost:5000/api/livros
{
  "titulo": "Harry Potter 3",
  "genero": "fantasia"
}

### ADICIONAR LIVRO A UM AUTOR

POST - localhost:5000/api/livros/{IDLIVRO}/autores/{IDAUTOR}

### LISTAR TODOS OS LIVROS
GET - localhost:5000/api/livros

### LISTAR O LIVRO POR ID
GETBYID - localhost:5000/api/livros/{IDLIVRO}

### ATUALIZAR LIVRO
UPDATE - localhost:5000/api/livros/{IDLIVRO}
{
  "titulo": "Harry Potter e o Prisioneiro de Azkaban",
  "genero": "Fantasia"
}

### DELETAR LIVRO   
DELETE - localhost:5000/api/livros/{IDLIVRO}

-------------------------------------------------------------------------------------------------
<!-- AUTORES -->

### ADD AUTOR
POST - localhost:5000/api/autores
{
  "nome": "fulano 1"
}

### LISTAR TODOS OS AUTORES
GET - localhost:5000/api/autores

### LISTAR O AUTOR POR ID
GETBYID - localhost:5000/api/autores/{IDAUTOR}

### ATUALIZAR AUTOR
UPDATE - localhost:5000/api/autores/{IDAUTOR}
{
  "nome": "fulano 1"
}

### DELETAR AUTOR   
DELETE - localhost:5000/api/autores/{IDAUTOR}

-------------------------------------------------------------------------------------------------
<!--  USUARIOS -->

### ADD USUARIO
POST - localhost:5000/api/usuarios
{
  "nome": "fulano 1"
}

### EMPRESTAR LIVRO PARA UM USUARIO
POST - localhost:5000/api/usuarios/{IDUSUARIO}/emprestimos/{IDLIVRO}
{
  "nome": "fulano 1"
}

### DEVOLVER LIVRO DE UM USUARIO
POST - localhost:5000/api/usuarios/{IDUSUARIO}/devolucoes/{IDLIVRO}
{
  "nome": "fulano 1"
}

### LISTAR TODOS OS USUARIOS
GET - localhost:5000/api/usuarios

### BUSCAR O USUARIO POR ID
GETBYID - localhost:5000/api/usuarios/{IDUSUARIO}

### ATUALIZAR USUARIO
UPDATE - localhost:5000/api/usuarios/{IDUSUARIO}
{
  "nome": "ciclano 1"
}

### DELETAR USUARIO   
DELETE - localhost:5000/api/usuarios/{IDUSUARIO}