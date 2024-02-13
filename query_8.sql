SELECT t.first_name AS teacher, sub.name AS subject, ROUND(AVG(g.grade), 2) AS average_grade
FROM teachers t
JOIN subjects sub ON sub.teacher_id = t.id
JOIN grades g ON g.subject_id = sub.id
WHERE t.id = 1
GROUP BY subject
ORDER BY subject