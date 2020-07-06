create database if not exists fresher;
use fresher;
DROP TABLE IF EXISTS trainee;
CREATE TABLE if not exists trainee (
	trainee_id INT AUTO_INCREMENT PRIMARY KEY,
	full_name NVARCHAR(100),
	birth_day DATE,
	gender ENUM('Male', 'Female','unknown'),
	et_iq TINYINT unsigned NOT NULL CHECK(et_iq <= 20 && et_iq > 0 ),
	et_gmath TINYINT CHECK(et_gmath <= 20 && et_gmath > 0 ),
	et_english TINYINT CHECK(et_english <= 50 && et_english > 0 ),
	training_class VARCHAR(50),
	Evaluation_Notes TEXT
);
alter table trainee
add column  vti_account varchar(100) not null unique after et_english;

alter table trainee
change column evaluation_notes evaluation_notes int default 0
;