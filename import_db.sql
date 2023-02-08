PRAGMA foreign_keys = ON

CREATE TABLE users ( --users are authors, both original asker and replier
    author_id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions ( --being asked by users/authors
    question_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER PRIMARY KEY,

    FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    question_follows id INTEGER PRIMARY KEY
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY(author_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
    -- inner join questions & users
);

CREATE TABLE replies ( --original question, user(student AND/OR teacher)
  replies_id INTEGER PRIMARY KEY,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL 
  FOREIGN KEY(author_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id) 
  
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id)
--   body text
--   parent reply id (self referential)

-- Reply::find_by_user_id(user_id)
-- Reply::find_by_question_id(question_id)
);

CREATE TABLE questions_like (
    id INTEGER PRIMARY KEY
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)

);
