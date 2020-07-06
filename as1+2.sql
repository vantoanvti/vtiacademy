
drop database if exists score_firts;
CREATE DATABASE  if not exists score_firts;
use score_firts ;

 /*========Tạo phòng ban======= */
CREATE TABLE department (
    department_id 					TINYINT unsigned AUTO_INCREMENT PRIMARY KEY,
    department_name 				NVARCHAR(100) 		not null
);
------------------------------------------------------------------------------------------
/* ==========tạo bảng chức vụ==========*/
CREATE TABLE position (
    position_id 					TINYINT unsigned AUTO_INCREMENT PRIMARY KEY,
    position_name 					NVARCHAR(100) 		NOT NULL
);

----------------------------------------------------------------------------------------
/* ========tạo bảng người sủ dụng=====*/
CREATE TABLE `account` (
    account_id 						smallint UNSIGNED AUTO_INCREMENT,
    email 							VARCHAR(100) 		UNIQUE KEY,
    username 						NVARCHAR(100) 		NOT NULL,
    fullname 						NVARCHAR(100) 		NOT NULL,
    department_id 					TINYINT UNSIGNED 	not null,
    position_id 					TINYINT UNSIGNED 	not null,
    createdate 						DATE 				not null,
    PRIMARY KEY (account_id)
    );
alter table 		`account`
add FOREIGN KEY (department_id)
        REFERENCES department (department_id) on delete cascade;
 alter table       `account`  
 add foreign key (position_id) references position (position_id) on delete cascade;
 --------------------------------------------------------------------------------
/* =========tạo nhóm====*/
CREATE TABLE `group` (
    group_id 						TINYINT unsigned AUTO_INCREMENT PRIMARY KEY,
    group_name 						NVARCHAR(100) 		NOT NULL,
    creator_id 						SMALLINT UNSIGNED 	NOT NULL,
    createdate 						DATE 				not null,
    foreign key (creator_id)  references `account` (account_id ) on delete cascade
);
------------------------------------------------------------------------------
/* =========tạo thông tin nhóm của nsd==== */
CREATE TABLE group_account (
    group_id 						TINYINT UNSIGNED AUTO_INCREMENT ,
    account_id 						SMALLINT UNSIGNED 					not null,
    joindate 						DATE 								not null,
    primary key ( group_id, account_id),
     foreign key (group_id)  references  `group`( group_id)			 	on delete cascade,
      foreign key( account_id)  references  `account`(account_id) 		on delete cascade
     
);
-------------------------------------------------------------------------------
/*=========tạo B loại câu hỏi =====*/
CREATE TABLE typequestion (
    type_id 						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name 						NVARCHAR(100) 						not null
);
----------------------------------------------------------------------------------
/* =========tạo B chủ đề câu hỏi=====*/
CREATE TABLE categoryquestion 
(
    category_id 					TINYINT UNSIGNED PRIMARY KEY,
    category_name 					NVARCHAR(100) 						not null
);
---------------------------------------------------------------------------
/*========tạo b câu hỏi=====*/
CREATE TABLE question (
    question_id 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content 						TEXT 								not null,
    category_id 					TINYINT UNSIGNED 					not null,
    type_id 						TINYINT UNSIGNED 					not null,
    creator_id 				        SMALLINT UNSIGNED 					not null,
    createdate 						DATE 								not null,
    FOREIGN KEY (type_id)
        REFERENCES typequestion (type_id) on delete cascade,
    FOREIGN KEY (category_id)
        REFERENCES categoryquestion (category_id) on delete cascade,
    FOREIGN KEY (creator_id)
        REFERENCES `group` (creator_id) on delete cascade
);
--------------------------------------------------------------------------
/* ======tạo b câu trả lơi(đáp án)===*/
CREATE TABLE answer (
    answer_id 						TINYINT UNSIGNED,
    content	 						NVARCHAR(100)						not null,
    question_id 					TINYINT UNSIGNED 					not null,
    iscrrect 						ENUM('T', 'F'),
    FOREIGN KEY (question_id)
        REFERENCES question (question_id)  on delete cascade
);
------------------------------------------------------------------------
/*=========tạo b thông tin đề thi====*/
CREATE TABLE exam (
    exam_id 						TINYINT unsigned AUTO_INCREMENT PRIMARY KEY,
    `code` 							NVARCHAR(100) 						not null,
    title							NVARCHAR(100) 						not null,
    category_id 					TINYINT UNSIGNED 					not null,
    duration 						DATETIME 							not null,
    creator_id 						SMALLINT UNSIGNED 					not null,
    createdate 						DATE 								not null,
    FOREIGN KEY (category_id)
        REFERENCES categoryquestion (category_id)  		on delete cascade,
    FOREIGN KEY (creator_id)
        REFERENCES question (creator_id) 			 	on delete cascade
        
);
----------------------------------------------------------------
/* ------tạo b định danh của đề thi với câu hỏi========*/
CREATE TABLE examquestion (
    exam_id 						TINYINT UNSIGNED AUTO_INCREMENT ,
    question_id 					TINYINT UNSIGNED 	NOT NULL,
    primary key (exam_id,question_id),
    FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id)  						on delete cascade,
    FOREIGN KEY (question_id)
        REFERENCES question (question_id) 				on delete cascade
        
);
