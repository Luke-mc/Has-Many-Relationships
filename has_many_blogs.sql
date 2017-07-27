DROP DATABASE IF EXISTS has_many_blogs;

DROP USER IF EXISTS has_many_user;
CREATE USER has_many_user;

CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

CREATE TABLE IF NOT EXISTS users
(
 userID serial NOT NULL PRIMARY KEY,
 username character varying(90) NOT NULL,
 first_name character varying(90),
 last_name character varying(90),
 created_at timestamp NOT NULL DEFAULT NOW(),
 updated_at timestamp NOT NULL DEFAULT NOW(),
);

CREATE TABLE IF NOT EXISTS posts
(
 postsID serial NOT NULL PRIMARY KEY,
 title character varying(180),
 url character varying(510),
 content text,
 created_at timestamp NOT NULL DEFAULT NOW(),
 updated_at timestamp NOT NULL DEFAULT NOW(),
 PRIMARY KEY (id)
 users_ID int FOREIGN KEY REFERENCES users(userID)
);



CREATE TABLE IF NOT EXISTS comments
(
 commentsID serial NOT NULL PRIMARY KEY,
 make_code character varying(125) NOT NULL,
 make_title character varying(125) NOT NULL,
 model_code character varying(125) NOT NULL,
 model_title character varying(125) NOT NULL,
 year integer NOT NULL,
 users_ID int FOREIGN KEY REFERENCES users(userID),
 posts_ID int FOREIGN KEY REFERENCES posts(postsID)
);
