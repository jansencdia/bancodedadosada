/*
Aula 6 - Consultas SQL com tabelas relacionadas
Jansen Souza
*/

-- Questão 1

select municipio  from floresta where area_ha > 200000;

-- Questão 2

select municipio, estado_sigla  from floresta where area_ha > 150000

-- Questão 3

create table estados(
	nome varchar not null,
	estado_sigla varchar not null,
	pais varchar not null,
	regiao varchar not null
)

-- Utilizei estados ao invés de municípios 

insert into estados values
	('Acre', 'AC','Brasil','Norte'),
	('Alagoas', 'AL','Brasil','Nordeste'),
	('Amapá', 'AP','Brasil','Norte'),
	('Amazonas', 'AM','Brasil','Norte'),
	('Bahia', 'BA','Brasil','Nordeste'),
	('Ceará', 'CE','Brasil','Nordeste'),
	('Espírito Santo', 'ES','Brasil','Sudeste'),
	('Goiás', 'GO','Brasil','Centro Oeste'),
	('Maranhão', 'MA','Brasil','Norte'),
	('Mato Grosso', 'MT','Brasil','Centro Oeste'),
	('Mato Grosso do Sul', 'MS','Brasil','Centro Oeste'),
	('Minas Gerais', 'MG','Brasil','Sudeste'),
	('Pará', 'PA','Brasil','Norte'),
	('Paraíba', 'PB','Brasil','Nordeste'),
	('Paraná', 'PR','Brasil','Sul'),
	('Pernambuco', 'PE','Brasil','Nordeste'),
	('Piauí', 'PI','Brasil','Nordeste'),
	('Rio de Janeiro', 'RJ','Brasil','Sudeste'),
	('Rio Grande do Norte', 'RN','Brasil','Nordeste'),
	('Rio Grande do Sul', 'RS','Brasil','Sul'),
	('Rondônia', 'RO','Brasil','Norte'),
	('Roraima', 'RR','Brasil','Norte'),
	('Santa Catarina', 'SC','Brasil','Sul'),
	('São Paulo', 'SP','Brasil','Sudeste'),
	('Sergipe', 'SE','Brasil','Nordeste'),
	('Tocantins', 'TO','Brasil','Norte'),
	('Distrito Federal', 'DF','Brasil','Centro Oeste')
	
	select * from estados
	
	select e.*
	  from estados e
	 where e.estado_sigla not in (select estado_sigla from floresta) 
  order by e.nome

-- Questão 4

select municipio, especie
    from floresta
   where area_ha > 30000
     and estado_sigla = 'BA'
	 
-- Questão 5

create view vw_floresta as (
	select *
	from floresta
)

-- consultando view

select * from vw_floresta

-- criando uma view materializada

create materialized view vwm_floresta as (
	select *
	from floresta
)

-- consultando view materializada

select * from vwm_floresta

EXPLAIN ANALYZE select * from vwm_floresta
EXPLAIN ANALYZE select * from vw_floresta

-- Executando o comando acima, percebemos que o tempo de execução da view materializada é menor do que na view normal.