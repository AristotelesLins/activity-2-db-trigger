-- Criação do esquema e das tabelas
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS user_log (
    id SERIAL PRIMARY KEY,
    user_id INT,
    action TEXT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Função executada pelo trigger
CREATE OR REPLACE FUNCTION log_user_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO user_log (user_id, action)
    VALUES (NEW.id, CONCAT('Usuário inserido: ', NEW.name));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger acionado após inserção em users
CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION log_user_insert();
