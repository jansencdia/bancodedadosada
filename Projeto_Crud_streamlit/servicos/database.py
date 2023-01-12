import psycopg2

#conexão com o banco de dados PostgreSQL
con = psycopg2.connect(host='localhost',
                       database='postgres',
                       user='postgres',
                       password='postgres')

cur = con.cursor()

'''CREATE TABLE funcionarios (
 id SERIAL PRIMARY KEY,
 nome varchar NOT NULL, 
 idade integer NOT NULL,
 profissao varchar NOT NULL
);'''
