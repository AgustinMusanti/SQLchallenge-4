## Consultas avanzadas para validar la base de datos

## 11- Obtener la cantidad total de películas y series disponibles en la plataforma.

SELECT tipo, 
COUNT(*) AS cantidad
FROM contenido
GROUP BY tipo;


## 12- Encuentra los 5 usuarios con más minutos de contenido visualizado.
    
SELECT  u.usuario_id, 
        u.nombre, 
        SUM(c.duracion) AS total_minutos_vistos
FROM visualizaciones v
JOIN usuarios u  ON v.usuario_id = u.usuario_id
JOIN contenido c ON v.contenido_id = c.contenido_id
GROUP BY u.usuario_id, u.nombre
ORDER BY total_minutos_vistos DESC
LIMIT 5;


## 13- Lista los géneros más populares en función del número de visualizaciones.

SELECT  c.genero, 
COUNT(v.visualizacion_id) AS total_visualizaciones
FROM visualizaciones v
JOIN contenido c ON v.contenido_id = c.contenido_id
GROUP BY c.genero
ORDER BY total_visualizaciones DESC;


## 14- Encuentra las películas con una calificación promedio superior a 8.

SELECT c.titulo, 
       AVG(t.calificacion) AS calificacion_promedio
FROM calificaciones t
JOIN contenido c ON t.contenido_id = c.contenido_id
WHERE c.tipo = 'película'
GROUP BY c.titulo
HAVING AVG(t.calificacion) > 8
ORDER BY calificacion_promedio DESC;


## 15- Calcula el ingreso total generado por las suscripciones en los últimos 3 meses.

SELECT SUM(p.monto) AS ingreso_total
FROM   pagos p
WHERE  p.fecha_pago >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);


## 16- Identifica el usuario que ha dejado más reseñas en la plataforma.

SELECT u.usuario_id, 
       u.nombre, 
COUNT(c.calificacion_id) AS cantidad_reseñas
FROM calificaciones c
JOIN usuarios u ON c.usuario_id = u.usuario_id
GROUP BY u.usuario_id, u.nombre
ORDER BY cantidad_reseñas DESC
LIMIT 1;


## 17- Encuentra los usuarios inactivos

SELECT usuario_id, nombre 
FROM   usuarios 
WHERE  estado = 'Inactivo';


## 18- Lista las películas y series que no han sido vistas por ningún usuario.
    
SELECT c.contenido_id, c.titulo, c.tipo 
FROM   contenido c
LEFT JOIN visualizaciones v ON c.contenido_id = v.contenido_id
WHERE v.contenido_id IS NULL;


## 19- Obtén la cantidad de usuarios que tienen una suscripción activa en cada tipo de plan.

SELECT u.tipo_suscripcion, COUNT(u.usuario_id) AS cantidad_usuarios
FROM   usuarios u
WHERE  u.estado = 'Activo'
GROUP BY u.tipo_suscripcion
ORDER BY cantidad_usuarios DESC;


## 20- Crea una consulta que prediga cuándo un usuario tendrá que renovar su suscripción basándose en su fecha
       de pago anterior.


SELECT usuario_id, 
       fecha_registro AS ultima_pago, 
       CASE 
           WHEN tipo_suscripcion = 'Mensual' THEN DATE_ADD(fecha_registro, INTERVAL 1 MONTH)
           WHEN tipo_suscripcion = 'Anual' THEN DATE_ADD(fecha_registro, INTERVAL 1 YEAR)
           WHEN tipo_suscripcion = 'Premium Familiar' THEN DATE_ADD(fecha_registro, INTERVAL 1 MONTH)
           WHEN tipo_suscripcion = 'Gratuito con Ads' THEN NULL
       END AS fecha_renovacion
FROM usuarios
WHERE estado = 'Activo';

