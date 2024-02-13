SELECT g.name AS group_name, s.name AS student
FROM students s
JOIN groups g  ON g.id = s.group_id
WHERE g.id = 1
ORDER BY student