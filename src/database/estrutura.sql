DROP DATABASE IF EXISTS  salas_aulas;
CREATE DATABASE IF NOT EXISTS salas_aulas;
USE salas_aulas;

CREATE TABLE escolas(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(200) NOT NULL,
  cnpj VARCHAR(18) NOT NULL UNIQUE,
  biblioteca BOOLEAN,
  campo_futebol BOOLEAN,
  quantidade_salas SMALLINT,
  tipo_escola VARCHAR(1)
);

CREATE TABLE alunos(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_escola INTEGER,
  FOREIGN KEY (id_escola) REFERENCES escolas(id),
  nome VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(100) NOT NULL,
  descricao TEXT,
  observacao TEXT,
  data_nascimento DATE
);

INSERT INTO escolas (nome, cnpj, biblioteca, campo_futebol)
    VALUES
      ("Escola Báscia Muncipal João da Pedra", "69.273.941/0001-03", true, true),
      ("Escola Estadual Maria da Pedra", "92.996.980/0001-42", false, true),
      ("Escola Barão do Rio Branco", "72.355.354/0001-60", false, true),
      ("Escola Adventista de Blumenau", "42.726.370/0001-50", true, true),
      ("Bom Jesus Santo Antônio - Blumenau", "52.241.544/0001-49", false, false);

INSERT INTO alunos(nome, email, senha, data_nascimento)
VALUES
  ('Juan Diego Fernando Rodrigues','juan@gmail.com', '', '1995-06-13'),
  ('Davi Emanuel Barros','davi@gmail.com', '', '1980-08-16'),
  ('Marcela Betina Souza','marcela@gmail.com', '', '1994-07-23'),
  ('Mirella Helena Clara Campos','mirella@gmail.com', '', '2000-02-14'),
  ('Emily Débora Monteiro','emily@gmail.com', '', '2003-03-12');