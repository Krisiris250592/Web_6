SELECT t.first_name AS teacher, s.name AS student, sub.name AS subject
FROM subjects sub
JOIN teachers t ON t.id = sub.teacher_id
JOIN grades g ON g.subject_id = sub.id
JOIN students s ON g.student_id = s.id
WHERE t.id = 3 AND s.id = 10
GROUP BY subject
ORDER BY subject