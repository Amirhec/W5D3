CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    title TEXT,
    body TEXT

    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    inner join questions
)



