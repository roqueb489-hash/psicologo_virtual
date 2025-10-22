-- Crear la base de datos
CREATE DATABASE psicologo_virtual;
USE psicologo_virtual;

-- Crear la tabla 'usuarios'
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    grade VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NULL,
    age INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla 'mensajes'
CREATE TABLE mensajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    mensaje TEXT NOT NULL,
    respuesta_ia TEXT,
    nivel_alerta ENUM('verde', 'anaranjado', 'rojo', 'default') NOT NULL DEFAULT 'verde',
    color_alerta VARCHAR(7) NULL,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Crear la tabla 'emociones'
CREATE TABLE emociones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    estado ENUM('Feliz', 'Triste', 'Estresado', 'Ansioso', 'Cansado', 'Motivado') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Índices para mejorar rendimiento
CREATE INDEX idx_user_id_mensajes ON mensajes(user_id);
CREATE INDEX idx_user_id_emociones ON emociones(user_id);
