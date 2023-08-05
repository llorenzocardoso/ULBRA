CREATE TABLE Estados(
    id INT PRIMARY KEY AUTO_INCREMENT,
    UF CHAR(2)
);

CREATE TABLE Cidades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    id_estado INT,
    CONSTRAINT cidades_fk_estados
        FOREIGN KEY(id_estado) REFERENCES Estados(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    user VARCHAR(45),
    senha VARCHAR(45),
    id_cidade INT NOT NULL,
    CONSTRAINT usuarios_fk_cidades
        FOREIGN KEY(id_cidade) REFERENCES Cidades(id)   
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Seguidores(
    id_usuario INT,
    id_usuario_que_sigo INT,
    CONSTRAINT seguidores_fk_usuarios
        FOREIGN KEY(id_usuario) REFERENCES Usuarios(id),
    CONSTRAINT sqs_fk_usuarios
        FOREIGN KEY(id_usuario_que_sigo) REFERENCES Usuarios(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Postagens(
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(45),
    foto_principal VARCHAR(45),
    data_postagem DATE,
    id_usuario INT,
    CONSTRAINT postagens_fk_usuario
        FOREIGN KEY(id_usuario) REFERENCES Usuarios(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE Postagens_Fotos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    foto VARCHAR(45),
    descricao VARCHAR(45),
    id_postagens INT,
    CONSTRAINT pf_fk_usuario
        FOREIGN KEY(id_postagens) REFERENCES Postagens(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);