# Use a imagem base do Bitnami Spark
FROM bitnami/spark:latest

# Copie o script de inicialização e o arquivo Python para dentro do contêiner
COPY start-spark.sh /usr/local/bin/start-spark.sh
COPY file.py /opt/bitnami/spark/file.py

# Alterne para o usuário root para alterar permissões
USER root
RUN chmod +x /usr/local/bin/start-spark.sh

# Retorne para o usuário padrão para maior segurança
USER 1001

# Exponha as portas necessárias para o Spark
EXPOSE 8080 7077

# Defina o comando para rodar o Spark
CMD ["/usr/local/bin/start-spark.sh"]

