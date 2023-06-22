CREATE DATABASE cake CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

USE cake;

CREATE TABLE IF NOT EXISTS users
(
    id BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);


CREATE TABLE IF NOT EXISTS categories
(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    category VARCHAR(200) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS products
(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    category_id INT UNSIGNED,
    CONSTRAINT fk_products_category
        FOREIGN KEY(category_id)
        REFERENCES categories(id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    PRIMARY KEY(id)
);
