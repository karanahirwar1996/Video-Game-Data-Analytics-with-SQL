-- DROP TABLEs IF EXISTS 

DROP TABLE IF EXISTS sales CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS console CASCADE;
DROP TABLE IF EXISTS publisher CASCADE;
DROP TABLE IF EXISTS developer CASCADE;


--CREATE TABLES REQUIRED

CREATE TABLE genre (
    genre_id INT   NOT NULL,
    genre VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_genre PRIMARY KEY (
        genre_id
     )
);

CREATE TABLE console (
    console_id INT   NOT NULL,
    console VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_console PRIMARY KEY (
        console_id
     )
);

CREATE TABLE publisher (
    publisher_id INT   NOT NULL,
    publisher VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_publisher PRIMARY KEY (
        publisher_id
     )
);

CREATE TABLE developer (
    developer_id INT   NOT NULL,
    developer VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_developer PRIMARY KEY (
        developer_id
     )
);

CREATE TABLE games (
    game_id inT   NOT NULL,
    rank INT   NOT NULL,
    game_name VARCHAR(255)   NOT NULL,
    release_year INT   NULL,
    release_date DATE   NULL,
    vgchartz_score FLOAT   NULL,
    critic_score FLOAT   NULL,
    user_score FLOAT   NULL,
    developer_id INT   NULL,
    genre_id INT   NOT NULL,
    console_id INT   NOT NULL,
    publisher_id INT   NOT NULL,
    CONSTRAINT pk_games PRIMARY KEY (
        game_id
     )
);

CREATE TABLE sales (
    game_id INT   NOT NULL,
    na_sales_in_millions float   NULL,
    pal_sales_in_millions float   NULL,
    japan_sales_in_millions float   NULL,
    other_sales_in_millions float   NULL,
    global_sales_in_millions float   NULL,
    total_shipped_in_millions float   NULL,
    CONSTRAINT pk_sales PRIMARY KEY (
        game_id
     )
);

-- RELATIONSHIP BETWEEN TABLES 

ALTER TABLE games ADD CONSTRAINT fk_games_developer_id FOREIGN KEY(developer_id)
REFERENCES developer (developer_id);

ALTER TABLE games ADD CONSTRAINT fk_games_genre_id FOREIGN KEY(genre_id)
REFERENCES genre (genre_id);

ALTER TABLE games ADD CONSTRAINT fk_games_console_id FOREIGN KEY(console_id)
REFERENCES console (console_id);

ALTER TABLE games ADD CONSTRAINT fk_games_publisher_id FOREIGN KEY(publisher_id)
REFERENCES publisher (publisher_id);

ALTER TABLE sales ADD CONSTRAINT fk_sales_game_id FOREIGN KEY(game_id)
REFERENCES games (game_id);

