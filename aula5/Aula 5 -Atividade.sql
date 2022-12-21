/*
Aula 5 - Consulta simples e manipulação de dados nas tabelas (CRUD)
Jansen Cruz
*/

-- Questão 1

create database cinema

-- criando uma sequencia para codigo do aluno

create sequence seq_id_filme start 1

create table filmes (
	id				integer default nextval('seq_id_filme'),
	nome			varchar,
	categoria		varchar,
	duracao			integer,
	lancamento		date
)

select * from filmes

-- Questão 2

insert into filmes values (6, 'Bohemian Rhapsody', 'drama', 120, '2019-01-01')

-- Questão 3
-- Resolvi inserir apçenas as 4 colunas pois o id é sequencial
insert into filmes (nome, categoria, duracao, lancamento) values
	('Como eu era Antes de Você', 'drama', 110, '2016-06-16'),
	('Para Sempre', 'romance', 104, '2012-06-07'),
	('Arremessando Alto', 'drama', 117, '2022-06-03'),
	('King Richard: Criando Campeãs', 'drama', 144, '2021-12-02'),
	('No Ritmo do Coração', 'drama', 111, '2021-09-23')

-- Questão 4

delete from filmes where id = 6

-- Questão 5

ALTER TABLE filmes ADD COLUMN VERIFICAR BOOLEAN DEFAULT FALSE
update filmes set verificar = true where categoria = 'drama'

-- Questão 6

select id, nome, categoria from filmes where nome ilike '%eu era antes de%' or categoria = 'romance'

-- Questão 7

select nome from filmes where lancamento < '2022-06-03'

-- Questão 8

select * from filmes where categoria = 'romance'