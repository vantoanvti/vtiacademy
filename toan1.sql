

create database if not exists fresher;
use fresher;

CREATE TABLE traines (
    trainee_id INT AUTO_INCREMENT,
    full_name VARCHAR(200),
    birth_day DATE,
    gender ENUM('M', 'F'),
    et_iq TINYINT,
    et_gmath TINYINT,
    et_english TINYINT,
    training_class VARCHAR(500),
    Evaluation_Notes TEXT,
PRIMARY KEY (trainee_id)
);
alter table traines
add column total_score tinyint after et_english;
insert into traines (full_name,birth_day,gender,et_iq,et_gmath,et_english,training_class,evaluation_notes)
values ('vu van toan','2000_04_16','M','15','16','17','a_1','0')
;
alter table traines
add unique key (training_class)
;
alter table traines
change column evaluation_notes evaluation_notes int default 0
;
select * from traines;
alter table traines
alter column evaluation_notes drop default;