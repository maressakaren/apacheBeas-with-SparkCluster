

# Cluster Apache Spark com Docker

Este Relatório detalha a estrutura do projeto e como configurar um cluster Apache Spark usando Docker. O projeto inclui um ambiente de cluster com um nó Master e dois nós Worker, assim como um contêiner para a submissão de jobs ao cluster.


## Estrutura do Projeto

- **Dockerfile**: Define a imagem Docker personalizada para o cluster Spark.
- **docker-compose.yml**: Arquivo de configuração do Docker Compose para iniciar o cluster Spark.
- **file.py**: Código de exemplo que será executado no cluster Spark.

## Passo a Passo para Executar o Cluster

1. **Clone o repositório**

   ```bash
   git clone https://github.com/maressakaren/apacheBeas-with-SparkCluster
   cd .\apacheBeas-with-SparkCluster\
   ```

2. **Construa a imagem Docker**

   Você precisa construir a imagem Docker, antes de iniciar o cluster:

   ```bash
   docker build -t image_bitnami .
   ```

3. **Inicie o Cluster Spark com Docker Compose**

   Utilize o Docker Compose para iniciar o cluster:

   ```bash
   docker-compose up -d
   ```
   Isso criará os seguintes serviços:
   - **spark-master**: Contêiner para o nó Master do Spark.
   - **spark-node-1** e **spark-node-2**: Contêineres para os nós Worker do Spark.
   - **spark-submit**: Contêiner usado para submeter jobs ao cluster.

4. **Verifique se o Cluster está em Execução**

   Use o comando abaixo para verificar se todos os contêineres estão em execução:

   ```bash
   docker-compose ps
   ```

5. **Acesse a Interface Web do Spark**

   A interface web do Spark Master estará disponível em [http://localhost:9090](http://localhost:9090).
   
   Os serviços devem estar criados e o arquivo `file.py` executado. Verifique se há aplicações em andamento ou já finalizadas.

6. **Submeter o Job para o Cluster**

   O script `start-spark.sh` está configurado para submeter automaticamente o arquivo `file.py` ao cluster quando o Master for iniciado. Se precisar submeter um novo job, utilize o contêiner `spark-submit`:

   ```bash
   docker-compose run spark-submit
   ```

7. **Finalizar o Cluster**

   Para parar todos os contêineres do cluster:

   ```bash
   docker-compose down
   ```

## Explicação dos Arquivos

- **Dockerfile**: Utiliza a imagem base do Spark da Bitnami e copia os scripts necessários para o contêiner. Ele define um comando de inicialização (`start-spark.sh`) para configurar o ambiente do Spark.
  
- **file.py**: Exemplo de um job simples em PySpark que calcula a soma de uma série de números.

- **docker-compose.yml**: Configura o ambiente do cluster com um nó Master, dois nós Worker e um contêiner para submissão de jobs. Define a rede e as dependências entre os serviços.

