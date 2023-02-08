DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions_like;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;



PRAGMA foreign_keys = ON;
-- Drop table?

CREATE TABLE users ( 
    author_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL

);

CREATE TABLE questions ( 
    question_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    question_follows id INTEGER PRIMARY KEY,
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY(author_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies ( 
  replies_id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE questions_like (
    id INTEGER PRIMARY KEY,
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Bob', 'Smith');

-- INSERT INTO 
--     questions (title, body, author_id)
-- VALUES  
    -- ('sample question', 'is this my sample question?', (SELECT author_id FROM users WHERE fname = 'Bob'));