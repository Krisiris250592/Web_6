SELECT s.name AS student, sub.name AS subject
FROM subjects sub
JOIN grades g ON g.subject_id = sub.id
JOIN students s ON g.student_id = s.id
WHERE s.id = 1
GROUP BY subject
ORDER BY subject