import streamlit as st
import crud.inserir_alterar as insert
import crud.consultar as select

st.sidebar.title('Menu')
page = st.sidebar.selectbox('Funcionario',['Consultar','Inserir'])
st.sidebar.markdown('Desenvolvido pelo: **Grupo 2 - Alex, Jansen,Kaio, Micaelle e Susam.**')
st.sidebar.markdown('GITHUB:')
st.sidebar.markdown('https://github.com/jansencdia/bancodedadosada.git')


#Carregando as páginas de acordo com a seleção do menu
if page == 'Consultar':
    select.consultar()
if page == 'Inserir':
    st.experimental_set_query_params()
    insert.inserir_alterar()