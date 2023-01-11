/*
Atividade 7 - Consultas SQL com agrupamento de dados
Aluno: Jansen Cruz de Souza
*/

-- Questão 1

select count(distinct(municipio)) from floresta

-- Questão 2

select sum(area_ha) as total_area from floresta

-- Questão 3

select especie, 
	   sum(area_ha) as total_area
  from floresta
 group by especie;
 
-- Questão 4

select date_part('year', data_ano) as ano, 
	   sum(area_ha) as total_area
  from florestas
 group by 1;

-- Questão 5

select date_part('year', data_ano) as ano,
	   count(distinct(municipio)) as qtd_municipio	   
  from florestas
 group by 1; 

-- Questão 6

with media_area_ha as (
		select estado_sigla as uf,
			   avg(area_ha) as media_uf	   
		  from florestas
	  group by estado_sigla
)
select
	f.municipio_estado , f.area_ha  
from florestas f 
inner join media_area_ha mah on mah.uf = f.estado_sigla
where f.area_ha > mah.media_uf
group by f.municipio_estado , f.area_ha

-- Questão 7

select * 
from (
	select regiao,
		sum(area_ha) as total_area,
		rank() over (order by sum(area_ha) desc)
	from florestas 
	group by regiao
) tab
where rank <=5