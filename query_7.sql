SELECT gr.name AS group_name, sub.name AS subject, s.name AS student, g.grade AS grade, g.date_of AS date_of
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN groups gr ON gr.id = s.group_id
JOIN subjects sub ON sub.id = g.subject_id
WHERE gr.id = 2 AND sub.id = 5
ORDER BY student, date_of