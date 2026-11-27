CREATE TABLE posts (id TEXT PRIMARY KEY, video_id TEXT NOT NULL UNIQUE, title TEXT NOT NULL, note TEXT NOT NULL DEFAULT '', japanese_key TEXT, korean_key TEXT, created_at TEXT NOT NULL, updated_at TEXT NOT NULL);
CREATE TABLE feedback (id TEXT PRIMARY KEY, post_id TEXT NOT NULL REFERENCES posts(id), author TEXT NOT NULL DEFAULT '', message TEXT NOT NULL, created_at TEXT NOT NULL);
CREATE TABLE feedback_rate (client_hash TEXT PRIMARY KEY, last_at INTEGER NOT NULL);

