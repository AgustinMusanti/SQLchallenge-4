## Creación de la base de datos y estructura (DDL)
## Respuestas a las preguntas 1,2,3,4 y 5

DROP DATABASE IF EXISTS streaming_platform;

CREATE DATABASE streaming_platform;

USE streaming_platform;

CREATE TABLE usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL,
    tipo_suscripcion ENUM('Mensual', 'Anual', 'Gratuita', 'Premium Familiar') NOT NULL,
    estado ENUM('Activo', 'Inactivo') NOT NULL
);

CREATE TABLE suscripciones (
    suscripcion_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    monto_pagado DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);


CREATE TABLE contenido (
    contenido_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    tipo ENUM('Película', 'Serie') NOT NULL,
    genero VARCHAR(50) NOT NULL,
    duracion INT NOT NULL, 
    año_lanzamiento YEAR NOT NULL
);


CREATE TABLE visualizaciones (
    visualizacion_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    contenido_id INT,
    fecha_visualizacion DATETIME NOT NULL,
    tiempo_visto INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE,
    FOREIGN KEY (contenido_id) REFERENCES contenido(contenido_id) ON DELETE CASCADE
);


CREATE TABLE calificaciones (
    calificacion_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    contenido_id INT,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 10),
    comentario VARCHAR(500),
    fecha_calificacion DATETIME NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE,
    FOREIGN KEY (contenido_id) REFERENCES contenido(contenido_id) ON DELETE CASCADE
);




CREATE TABLE pagos (
    pago_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    metodo_pago ENUM('Tarjeta de Crédito', 'PayPal', 'Transferencia Bancaria') NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);


CREATE INDEX idx_email ON usuarios(email);
CREATE INDEX idx_fecha_visualizacion ON visualizaciones(fecha_visualizacion);
CREATE INDEX idx_contenido_tipo ON contenido(tipo);
