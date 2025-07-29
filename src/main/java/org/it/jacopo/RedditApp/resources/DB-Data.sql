INSERT INTO users (username, email, password, created_at, enabled) VALUES
                                                                       ('mario_rossi', 'mario.rossi@example.com', '$2a$10$xJwL5v5Jz7T3Zq9zQ6b0OeXqjGw1k8QYb5pJf6sVnWkLm1Y2XJ7GK', NOW(), true),  -- password: "password123"
                                                                       ('laura_bianchi', 'laura.bianchi@example.com', '$2a$10$xJwL5v5Jz7T3Zq9zQ6b0OeXqjGw1k8QYb5pJf6sVnWkLm1Y2XJ7GK', NOW(), true),
                                                                       ('admin', 'admin@redditclone.com', '$2a$10$X8z5r7sT2mW9pDq1Y3f6gHjKlMnOpQrStUvWxYzA1B2C3D4E5F6G7H', NOW(), true);  -- password: "admin123"

INSERT INTO subreddits (name, description, user_id) VALUES
                                                        ('programmazione', 'Tutto su coding e sviluppo software', 1),
                                                        ('cucina', 'Ricette e segreti dei fornelli', 2),
                                                        ('cinema', 'Film, serie TV e recensioni', 3);

INSERT INTO posts (title, content, vote_count, user_id, subreddit_id, created_at) VALUES
                                                                                      ('Come imparare Java', 'Consigli per iniziare con Java e Spring Boot', 15, 1, 1, NOW() - INTERVAL '2 days'),
                                                                                      ('Ricetta carbonara perfetta', 'La mia versione della pasta alla carbonara', 42, 2, 2, NOW() - INTERVAL '5 hours'),
                                                                                      ('Recensione: Interstellar', 'Un capolavoro di Nolan tra scienza e emozione', 28, 3, 3, NOW() - INTERVAL '1 day');

INSERT INTO votes (vote_type, user_id, post_id) VALUES
                                                    (1, 2, 1),   -- laura_bianchi upvota il post su Java
                                                    (1, 3, 1),   -- admin upvota il post su Java
                                                    (-1, 1, 3),  -- mario_rossi downvota la recensione di Interstellar
                                                    (1, 2, 3);   -- laura_bianchi upvota Interstellar


-- Commenti diretti ai post (senza parent_comment_id)
INSERT INTO comments (text, user_id, post_id, created_at) VALUES
                                                              ('Grazie per i consigli! Proverò Spring Boot', 2, 1, NOW() - INTERVAL '1 day'),
                                                              ('La carbonara ha il guanciale, non la pancetta!', 3, 2, NOW() - INTERVAL '3 hours');

-- Commenti annidati (risposte ad altri commenti)
INSERT INTO comments (text, user_id, post_id, parent_comment_id, created_at) VALUES
                                                                                 ('Esatto! Spring Boot è fantastico', 1, 1, 1, NOW() - INTERVAL '12 hours'),  -- Risposta al commento 1
                                                                                 ('Lo so, ma la pancetta è più facile da trovare', 2, 2, 2, NOW() - INTERVAL '1 hour');  -- Risposta al commento 2