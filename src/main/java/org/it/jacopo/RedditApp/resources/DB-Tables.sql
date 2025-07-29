CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,  -- Hash della password (es. BCrypt)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    enabled BOOLEAN DEFAULT FALSE  -- Per conferma email
);

CREATE TABLE subreddits (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(100) UNIQUE NOT NULL,
                            description TEXT,
                            user_id INTEGER NOT NULL,
                            FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE posts (
                       id SERIAL PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content TEXT,
                       vote_count INTEGER DEFAULT 0,
                       user_id INTEGER NOT NULL,
                       subreddit_id INTEGER NOT NULL,
                       created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
                       FOREIGN KEY (subreddit_id) REFERENCES subreddits(id) ON DELETE CASCADE
);

CREATE TABLE comments (
                          id SERIAL PRIMARY KEY,
                          text TEXT NOT NULL,
                          user_id INTEGER NOT NULL,
                          post_id INTEGER NOT NULL,
                          parent_comment_id INTEGER,  -- Per commenti annidati (risposte)
                          created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
                          FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
                          FOREIGN KEY (parent_comment_id) REFERENCES comments(id) ON DELETE CASCADE
);

CREATE TABLE votes (
                       id SERIAL PRIMARY KEY,
                       vote_type SMALLINT NOT NULL,  -- Es: 1=UPVOTE, -1=DOWNVOTE
                       user_id INTEGER NOT NULL,
                       post_id INTEGER NOT NULL,
                       FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
                       FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
                       UNIQUE (user_id, post_id)  -- Un voto per utente/post
);

-- Relazioni tra le tabelle
-- users (1) → (N) posts
--users (1) → (N) comments
--users (1) → (N) votes
--ubreddits (1) → (N) posts
--posts (1) → (N) comments
-- comments (1) → (N) comments (gerarchia)