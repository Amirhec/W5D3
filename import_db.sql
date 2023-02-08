CREATE TABLE users ( --users are authors, both original asker and replier
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions ( --being asked by users/authors
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER PRIMARY KEY,

    FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    
    FOREIGN KEY(xx) REFERENCES users(id),
    FOREIGN KEY(xx) REFERENCES questions(id)
    -- inner join questions & users
);

CREATE TABLE replies ( --original question, user(student AND/OR teacher)
  id INTEGER PRIMARY KEY,
-- Reply::find_by_user_id(user_id)
-- Reply::find_by_question_id(question_id)
);

CREATE TABLE questions_like (
);
