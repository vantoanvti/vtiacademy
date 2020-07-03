CREATE DATABASE score_firts;
use score_firts;

CREATE TABLE department (
    department_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE position (
    position_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(255)
);

CREATE TABLE `account` (
    account_id SMALLINT AUTO_INCREMENT,
    email VARCHAR(255),
    username VARCHAR(255),
    fullname VARCHAR(255),
    department_id TINYINT,
    position_id TINYINT,
    createdate DATE,
    PRIMARY KEY (account_id)
);

CREATE TABLE `group` (
    group_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(255),
    creator_id TINYINT,
    createdate DATE
);

CREATE TABLE group_account (
    group_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    account_id SMALLINT,
    joindate DATE
);

CREATE TABLE typequestion (
    type_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255)
);

CREATE TABLE categoryquestion (
    category_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE question (
    question_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
    content VARCHAR(255),
    category_id SMALLINT,
    type_id SMALLINT,
    creator_id TINYINT,
    createdate DATE
);

CREATE TABLE answer (
    answer_id SMALLINT,
    content VARCHAR(500),
    question_id SMALLINT,
    iscrrect ENUM('T', 'F')
);

CREATE TABLE exam (
    exam_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(100),
    title VARCHAR(255),
    category_id TINYINT,
    duration DATETIME,
    creator_id TINYINT,
    createdate DATE
);

CREATE TABLE examquestion (
    exam_id TINYINT AUTO_INCREMENT PRIMARY KEY,
    question_id SMALLINT
);
