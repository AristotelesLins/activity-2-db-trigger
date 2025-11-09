# Activity 2 - Let's Trigger (PostgreSQL)

Este repositório contém a solução para a Atividade 2, focada na criação e demonstração de Triggers em um banco de dados PostgreSQL.

## 🎯 Objetivo

Criar um esquema de banco de dados e adicionar um trigger que seja acionado após uma inserção, registrando a ação em uma tabela de log separada.

## 🛠️ Como Executar

O projeto é executado usando **Docker Compose** e **Python**.

### Pré-requisitos
* Docker e Docker Compose instalados.
* Python 3.x instalado.

### Passos de Execução

1.  **Levantar o ambiente do banco de dados:**
    O `docker-compose.yml` irá subir o PostgreSQL e inicializar o esquema e os triggers através do `scheme.sql`.

    ```bash
    docker compose up -d
    ```

2.  **Instalar dependências do Python:**
    O script `seeder.py` requer a biblioteca `psycopg2` para se conectar ao banco de dados.

    ```bash
    pip install -r requirements.txt
    ```

3.  **Popular o banco e checar o Trigger:**
    Execute o script `seeder.py`. Ele irá inserir três usuários na tabela `users` e, em seguida, consultará a tabela `user_log` para demonstrar que o trigger funcionou automaticamente.

    ```bash
    python seeder.py
    ```
    
    O output esperado deve mostrar os logs gerados pelo trigger.

### Esquema e Trigger Implementados

O `scheme.sql` define duas tabelas (`users` e `user_log`) e o `TRIGGER after_user_insert` que, após a inserção de um novo usuário, executa a função `log_user_insert()` para registrar a ação na tabela `user_log`.