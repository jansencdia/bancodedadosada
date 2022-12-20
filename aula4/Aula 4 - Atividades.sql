/*
Aula 4 - Atividades
Aluno: Jansen Cruz de Souza
*/

-- Questão 1

CREATE DATABASE LETSCODE
CREATE DATABASE LETSCODE_DEL

-- Questão 2

ALTER DATABASE LETSCODE RENAME TO TURMA889

-- Questão 3

DROP DATABASE IF EXISTS LETSCODE_DEL

-- Questão 4.

CREATE TABLE ALUNOS (
	ID      		INTEGER,
	MATRICULA		VARCHAR,
	NOME			VARCHAR,
	ESTADO			VARCHAR,
    FORMACAO		VARCHAR
)

-- Questão 5

ALTER TABLE ALUNOS RENAME COLUMN ESTADO TO UF

-- Questão 6

ALTER TABLE ALUNOS ADD COLUMN EMAIL VARCHAR
ALTER TABLE ALUNOS ADD COLUMN TELEFONE VARCHAR

-- Questão 7

ALTER TABLE ALUNOS ALTER COLUMN EMAIL TYPE VARCHAR(100)

-- Questão 8

ALTER TABLE ALUNOS DROP COLUMN ID

-- Questão 9

DROP TABLE ALUNOS

-- Questão 10

/*R: A chave primária, para manter a integradidade da informação, sempre deve ser única e sequencial. Sem contar que,
para uma melhor performance no retorno de uma consulta numa tabela de milhões de dados, um simples INTEIRO seria bem mais rápido
que uma consulta por um VARCHAR, logo a chave primária seria o ID.*/

-- Questão 11

/*R: Falso, ele cria um SCHEMA padrão público e não uma tabela.*/

-- Questão 12

/*R: Verdadeiro.*/

-- Questão 13

/*R: Falso.*/

-- Questão 14

/*R: CREATE TABLE.*/

-- Questão 15

/*R: DROP DATABASE.*/

-- Questão 16

/*R: Verdadeiro.*/
