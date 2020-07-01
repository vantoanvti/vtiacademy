CREATE DATABASE score_firts;
use score_firts;

create table department
(
department_id tinyint auto_increment primary key,
department_name varchar(255)
);

create table position
(
position_id tinyint auto_increment primary key,
position_name varchar(255)
);

create table `account`
(
account_id smallint auto_increment,
email varchar(255),
username varchar(255),
fullname varchar(255),
department_id tinyint,
position_id tinyint,
createdate date,
primary key (account_id)
);

create table `group`
(
group_id tinyint auto_increment primary key,
group_name varchar(255),
creator_id tinyint,
createdate date
);

create table group_account
(
group_id tinyint auto_increment primary key,
account_id smallint,
joindate date
);

create table typequestion
(
type_id smallint auto_increment primary key,
type_name varchar(255)
);

create table categoryquestion
(
category_id smallint auto_increment primary key,
category_name varchar(255)
);

create table question
(
question_id smallint auto_increment primary key,
content varchar(255),
category_id smallint,
type_id smallint,
creator_id tinyint,
createdate date
);

create table answer
(
answer_id smallint,
content varchar(500),
question_id smallint,
iscrrect enum('T','F')
);

create table exam
(
exam_id tinyint auto_increment primary key,
`code` varchar(100),
title  varchar(255),
category_id tinyint,
duration datetime,
creator_id tinyint,
createdate date
);

create table examquestion
(
exam_id tinyint auto_increment primary key,
question_id smallint
);
