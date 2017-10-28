FROM python:3.4
# Cria um usuario e grupo uwsgi 
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
# Adicionado uWSGI a lista de pacotes Python
RUN pip install Flask==0.10.1 uWSGI==2.0.8
WORKDIR /app
COPY app /app
# Adiciona o script ao container
COPY cmd.sh /

# Expose declara as portas abertas para outros contêiner
EXPOSE 9090 9191
# Define o usuário para todas as linhas seguintes
USER uwsgi

#Cria um novo comando para executar o uWSGI: Inicia servidor http escutando a porta 9090 e inicia um servidor de estatisticas na porta 9191
# CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]

#Este comando agora chama o script cmd.sh.
# caso seja passada a variavel DEV no momento da execução o servidor devera funcionar em modo de Desenvolvimento utilizando servidor do Flask. Caso não seja passado o parametro DEV o servidor devera funcionar em modo de Produção utilizando o servidor uWSGI
CMD ["/cmd.sh"]