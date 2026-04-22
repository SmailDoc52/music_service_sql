CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS executor (
	executor_id SERIAL PRIMARY KEY,
	executor_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_executor (
	genre_id INTEGER REFERENCES genre(genre_id),
	executor_id INTEGER REFERENCES executor(executor_id),
	CONSTRAINT pk_genre_executor PRIMARY KEY (genre_id, executor_id)
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) NOT NULL,
	year_of_release INTEGER
);

CREATE TABLE IF NOT EXISTS album_executor (
	album_id INTEGER REFERENCES album(album_id),
	executor_id INTEGER REFERENCES executor(executor_id),
	CONSTRAINT pk_album_executor PRIMARY KEY (album_id, executor_id)
);

CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES album(album_id),
	track_name VARCHAR(120) NOT NULL,
	duration INTEGER
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	year_of_release INTEGER
);

CREATE TABLE IF NOT EXISTS collection_track (
	collection_id INTEGER REFERENCES collection(collection_id),
	track_id INTEGER REFERENCES track(track_id),
	CONSTRAINT pk_collection_track PRIMARY KEY (collection_id, track_id)
);