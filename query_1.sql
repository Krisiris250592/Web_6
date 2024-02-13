SELECT s.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
GROUP BY s.name
ORDER BY average_grade DESC
LIMIT 5;