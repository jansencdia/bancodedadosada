import servicos.database as db

#Função para inserir registros no banco de dados
def incluir(nome,idade,profissao):
    db.cur.execute("INSERT into public.funcionarios (nome, idade, profissao) values ('%s', '%s', '%s')" % (nome, idade, profissao))
    db.con.commit()

def excluir(id):
    db.cur.execute("DELETE FROM funcionarios WHERE id = '%s'" % (id))
    db.con.commit()

def selecionar():
    db.cur.execute("SELECT * FROM funcionarios")
    result = db.cur.fetchall()
    linhas = []
    for res in result:
        linhas.append(res)
    
    return linhas

def selecionar_id(id):
    db.cur.execute("SELECT * FROM funcionarios WHERE id = '%s'" % (id))
    cliente = db.cur.fetchone()
     
    return cliente

def alterar(nome, idade, profissao, id):
    db.cur.execute("UPDATE funcionarios SET (nome, idade, profissao) = ('%s', '%s', '%s') WHERE id = '%s'" % (nome, idade, profissao, id))
    db.con.commit()