import streamlit as st
import controlador.funcionarios as func
import crud.inserir_alterar as PageIAFuncionarios

def consultar():
    paramId = st.experimental_get_query_params()
    if paramId.get('id') == None:
        st.title('Lista Funcionários')
        st.experimental_set_query_params()
        colunas = st.columns((1,2,1,2,1,1))
        campos = ['Id','Nome','Idade','Profissão']
        for coluna, campo in zip(colunas,campos):
            coluna.write(campo)

        for item in func.selecionar():
            col1, col2, col3, col4, col5, col6 = st.columns((1,2,1,2,1,1))
            col1.write(item[0])
            col2.write(item[1])
            col3.write(item[2])
            col4.write(item[3])
            button_excluir = col5.empty()
            button_alterar = col6.empty()
            on_click_excluir = button_excluir.button('Excluir','btnExcluir' +  str(item[0]))
            on_click_alterar = button_alterar.button('Alterar','btnAlterar' + str(item[0]))

            if on_click_excluir:
                func.excluir(item[0])
                st.experimental_rerun()
            if on_click_alterar:
                st.experimental_set_query_params(
                    id = item[0]
                )
                st.experimental_rerun()
    else:
        PageIAFuncionarios.inserir_alterar()            