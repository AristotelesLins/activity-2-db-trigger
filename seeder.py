import psycopg2
from psycopg2 import sql

DB_CONFIG = {
    "dbname": "demo_db",
    "user": "user",
    "password": "password",
    "host": "db",
    "port": 5432
}

users = [
    ("Ana Silva", "ana@example.com"),
    ("Bruno Lima", "bruno@example.com"),
    ("Carla Souza", "carla@example.com")
]

def seed():
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()

    # Inserir usuários
    for name, email in users:
        cur.execute("INSERT INTO users (name, email) VALUES (%s, %s)", (name, email))

    conn.commit()

    # Mostrar logs gerados automaticamente pelo trigger
    cur.execute("SELECT * FROM user_log ORDER BY id;")
    logs = cur.fetchall()
    print("\n=== Logs Gerados ===")
    for log in logs:
        print(log)

    cur.close()
    conn.close()

if __name__ == "__main__":
    seed()
