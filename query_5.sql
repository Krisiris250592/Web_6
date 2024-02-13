SELECT t.first_name AS teacher, sub.name AS subject
FROM subjects sub
JOIN teachers t ON t.id = sub.teacher_id
WHERE t.id = 1
ORDER BY subject