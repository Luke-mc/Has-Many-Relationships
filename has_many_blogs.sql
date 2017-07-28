DROP DATABASE IF EXISTS has_many_blogs;

DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

\c has_many_blogs

CREATE TABLE IF NOT EXISTS users (
 id serial NOT NULL PRIMARY KEY,
 username varchar(90) NOT NULL,
 first_name varchar(90),
 last_name varchar(90),
 created_at timestamp NOT NULL DEFAULT now(),
 updated_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS posts (
 id serial NOT NULL PRIMARY KEY,
 title varchar(180),
 url varchar(510),
 content text,
 created_at timestamp NOT NULL DEFAULT NOW(),
 updated_at timestamp NOT NULL DEFAULT NOW(),
 users_id int REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS comments (
 id serial NOT NULL PRIMARY KEY,
 body varchar(510),
 created_at timestamp NOT NULL DEFAULT NOW(),
 updated_at timestamp NOT NULL DEFAULT NOW(),
 users_id int REFERENCES users(id),
 posts_id int REFERENCES posts(id)
);

\i scripts/blog_data.sql
