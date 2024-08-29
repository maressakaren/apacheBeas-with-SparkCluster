#!/bin/bash

# Função para iniciar o Spark Master
start_master() {
    /opt/bitnami/spark/bin/spark-class org.apache.spark.deploy.master.Master &
    MASTER_PID=$!
    tail -f /opt/bitnami/spark/logs/spark--org.apache.spark.deploy.master.Master-*.out &
    wait $MASTER_PID
}

# Função para iniciar o Spark Worker
start_worker() {
    /opt/bitnami/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://172.24.0.2:7077 &
    WORKER_PID=$!
    tail -f /opt/bitnami/spark/logs/spark--org.apache.spark.deploy.worker.Worker-*.out &
    wait $WORKER_PID
}

# Verifique o modo do Spark
if [ "$SPARK_MODE" = "master" ]; then
    start_master
elif [ "$SPARK_MODE" = "worker" ]; then
    start_worker
fi

# Execute o script Python com spark-submit (apenas no Master)
if [ "$SPARK_MODE" = "master" ]; then
    /opt/bitnami/spark/bin/spark-submit --master spark://172.24.0.2:7077 /opt/bitnami/spark/file.py
fi

