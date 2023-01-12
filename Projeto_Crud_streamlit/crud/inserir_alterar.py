import streamlit as st
import controlador.funcionarios as func
import crud.consultar as select
import time

def inserir_alterar():
    idAlterarcao = st.experimental_get_query_params()
    st.experimental_set_query_params()
    funcSelecionado = None
    if idAlterarcao.get('id') != None:
        idAlterarcao = idAlterarcao.get('id')[0]
        funcSelecionado = func.selecionar_id(idAlterarcao)
        st.experimental_set_query_params(
            id=[funcSelecionado[0]]
        )
        st.title('Alterar Funcionário')
    else:
        st.title('Inserir Funcionário')

    with st.form(key='insert_alterar_func', clear_on_submit=True):
        profissoes = ['Analistas de Dados', 'Engenheiro de Dados', 'Cientista de Dados'] 
        if funcSelecionado == None:
            input_name = st.text_input(label='Insira o nome:')
            input_age = st.number_input(label='Insira a idade', format='%d', step=1)
            input_job = st.selectbox(label='Insira a profissão', options=profissoes)   
        else:    
            input_name = st.text_input(label='Insira o nome', value=funcSelecionado[1])
            input_age = st.number_input(label='Insira a idade', format='%d', step=1, value=funcSelecionado[2])
            input_job = st.selectbox(label='Inserir a profissão', options=profissoes, index=profissoes.index(funcSelecionado[3]))
        
        button_submit = st.form_submit_button('Enviar')
        
    if button_submit:

        if funcSelecionado == None:
            func.incluir(input_name, input_age, input_job)
            st.success('Funcionário incluído com sucesso!!!')
        else:
            st.experimental_set_query_params()
            func.alterar(input_name, input_age, input_job,funcSelecionado[0])
            st.success('Funcionário alterado com sucesso!!!')
            time.sleep(1)
            st.experimental_rerun()
            select.consultar()