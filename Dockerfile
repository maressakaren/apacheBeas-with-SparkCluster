
FROM bitnami/spark:latest

COPY file.py /opt/bitnami/spark/file.py

EXPOSE 8080 7077


