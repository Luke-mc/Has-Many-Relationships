
-- SELECT * FROM users;

-- SELECT * FROM posts
-- WHERE users_id = 100;

-- SELECT *, users.first_name, users.last_name
-- FROM posts
-- INNER JOIN users ON posts.users_id =  users.id
-- WHERE posts.users_id = 200
-- AND users.id = 200;

SELECT posts.*, users.username
FROM posts
INNER JOIN users ON posts.users_id = users.id
WHERE users.first_name = 'Norene'
AND users.last_name = 'Schmitt';
