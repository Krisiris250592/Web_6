SELECT sub.name, s.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
WHERE sub.id = 3
GROUP BY s.name
ORDER BY average_grade DESC
LIMIT 1;