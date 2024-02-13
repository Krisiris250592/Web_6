SELECT sub.name, gr.name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN subjects sub ON sub.id = g.subject_id
JOIN groups gr ON gr.id = s.group_id
WHERE sub.id = 1
GROUP BY gr.name, sub.name
ORDER BY average_grade DESC;