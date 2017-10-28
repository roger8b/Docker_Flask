FROM python:3.4

# Adicionado uWSGI a lista de pacotes Python
RUN pip install Flask==0.10.1 uWSGI==2.0.8
WORKDIR /app
COPY app /app
#Cria um novo comando para executar o uWSGI: Inicia servidor http escutando a porta 9090 e inicia um servidor de estatisticas na porta 9191

CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]