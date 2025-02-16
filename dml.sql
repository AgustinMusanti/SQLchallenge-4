## Inserción y manipulación de datos (DML)
## Respuestas a las preguntas 6,7,8,9 y 10

INSERT INTO usuarios (nombre, email, fecha_registro, tipo_suscripcion, estado)
VALUES 
    ('Juan Pérez', 'juanperez@email.com', '2024-01-10', 'Mensual', 'Activo'),
    ('María López', 'marialopez@email.com', '2024-02-15', 'Anual', 'Activo'),
    ('Carlos Gómez', 'carlosgomez@email.com', '2024-03-20', 'Gratuita', 'Activo'),
    ('Lucía Fernández', 'luciafernandez@email.com', '2024-04-05', 'Mensual', 'Inactivo'),
    ('Pedro Martínez', 'pedromartinez@email.com', '2024-05-12', '2', 'Activo'),
    ('Sofía Ramírez', 'sofiaramirez@email.com', '2024-06-18', 'Mensual', 'Activo'),
    ('Diego Torres', 'diegotorres@email.com', '2024-07-01', 'Anual', 'Activo'),
    ('Ana Gutiérrez', 'anagutierrez@email.com', '2024-07-22', 'Gratuita', 'Activo'),
    ('Javier Ruiz', 'javierruiz@email.com', '2024-08-03', 'Mensual', 'Activo'),
    ('Valentina Castro', 'valentinacastro@email.com', '2024-08-19', '1', 'Activo');


INSERT INTO contenido (titulo, tipo, genero, duracion, año_lanzamiento)
VALUES 
    ('El Padrino', 'Película', 'Drama', 175, 1972),
    ('Titanic', 'Película', 'Romance', 195, 1997),
    ('Interestelar', 'Película', 'Ciencia Ficción', 169, 2014),
    ('Gladiador', 'Película', 'Acción', 155, 2000),
    ('Matrix', 'Película', 'Ciencia Ficción', 136, 1999),
    ('Toy Story', 'Película', 'Animación', 81, 1995),
    ('Joker', 'Película', 'Drama', 122, 2019),
    ('Parasite', 'Película', 'Suspenso', 132, 2019),
    ('El Rey León', 'Película', 'Animación', 88, 1994),
    ('Avengers: Endgame', 'Película', 'Acción', 181, 2019),
    ('El Señor de los Anillos', 'Película', 'Fantasía', 178, 2001),
    ('Forrest Gump', 'Película', 'Drama', 142, 1994),
    ('Rapidos y Furiosos', 'Película', 'Acción', 107, 2001),
    ('Coco', 'Película', 'Animación', 105, 2017),
    ('La La Land', 'Película', 'Musical', 128, 2016),
    ('Breaking Bad', 'Serie', 'Drama', 47, 2008),
    ('Game of Thrones', 'Serie', 'Fantasía', 57, 2011),
    ('Stranger Things', 'Serie', 'Ciencia Ficción', 51, 2016),
    ('Dark', 'Serie', 'Misterio', 53, 2017),
    ('Black Mirror', 'Serie', 'Ciencia Ficción', 60, 2011),
    ('The Office', 'Serie', 'Comedia', 22, 2005),
    ('Friends', 'Serie', 'Comedia', 22, 1994),
    ('Sherlock', 'Serie', 'Crimen', 88, 2010),
    ('Narcos', 'Serie', 'Drama', 52, 2015),
    ('The Crown', 'Serie', 'Histórica', 58, 2016);


INSERT INTO visualizaciones (usuario_id, contenido_id, fecha_visualizacion, tiempo_visto)
VALUES 
    (1, 1, '2024-09-01 20:30:00', 175),
    (1, 2, '2024-09-02 18:45:00', 100),
    (2, 3, '2024-09-03 21:00:00', 169),
    (2, 4, '2024-09-04 19:15:00', 90),
    (3, 5, '2024-09-05 22:00:00', 136),
    (3, 6, '2024-09-06 17:30:00', 81),
    (4, 7, '2024-09-07 20:15:00', 120),
    (5, 8, '2024-09-08 23:45:00', 132),
    (5, 9, '2024-09-09 16:10:00', 88),
    (6, 10, '2024-09-10 14:30:00', 181);


INSERT INTO calificaciones (usuario_id, contenido_id, calificacion, comentario, fecha_calificacion)
VALUES 
    (1, 1, 10, 'Una obra maestra del cine.', '2024-09-02 10:00:00'),
    (2, 3, 9, 'Impresionante visualmente.', '2024-09-04 12:30:00'),
    (3, 5, 8, 'Muy entretenida y original.', '2024-09-06 14:00:00'),
    (4, 7, 7, 'Buena película, pero esperaba más.', '2024-09-08 16:45:00'),
    (5, 9, 10, 'Un clásico de la animación.', '2024-09-10 18:15:00');


ALTER TABLE usuarios MODIFY COLUMN tipo_suscripcion ENUM('Mensual', 'Anual', 'Gratuita', 'Premium Familiar') NOT NULL;

