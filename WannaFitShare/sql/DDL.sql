drop table calorie;
drop table health;
drop table partylist;
drop table reple;
drop table totalcustomer;
drop table totalparty;
drop table photo;
drop table friendlist;
drop table party;
drop table caloriecalendar;
drop table customer;

drop sequence person_no_seq;
--------------------------------------------------------

/* 고객 */
DROP TABLE customer 
	CASCADE CONSTRAINTS;

/* 건강 */
DROP TABLE health 
	CASCADE CONSTRAINTS;

/* 친구목록 */
DROP TABLE friendlist 
	CASCADE CONSTRAINTS;

/* 칼로리 */
DROP TABLE calorie 
	CASCADE CONSTRAINTS;

/* 사진 */
DROP TABLE photo 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE reple 
	CASCADE CONSTRAINTS;

/* 그룹 */
DROP TABLE party 
	CASCADE CONSTRAINTS;

/* 칼로리캘린더 */
DROP TABLE caloriecalendar 
	CASCADE CONSTRAINTS;

/* 고객 */
CREATE TABLE customer (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	cs_password VARCHAR2(20) NOT NULL, /* 패스워드 */
	cs_name VARCHAR2(30) NOT NULL, /* 고객이름 */
	cs_email VARCHAR2(50) NOT NULL, /* 이메일 */
	cs_phone VARCHAR2(20) NOT NULL /* 폰번호 */
);

/* 건강 */
CREATE TABLE health (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	h_weight NUMBER, /* 몸무게 */
	h_tall NUMBER, /* 키 */
	h_bloodtype VARCHAR2(10), /* 혈액형 */
	h_bloodsugar NUMBER, /* 혈당 */
	h_bmi NUMBER, /* BMI */
	h_bloodpressure NUMBER, /* 혈압 */
	h_ldl NUMBER, /* LDL */
	h_hdh NUMBER /* HDH */
);

/* 친구목록 */
CREATE TABLE friendlist (
	fl_key NUMBER NOT NULL, /* 친구목록식별키 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	friend_id VARCHAR2(10) /* 친구ID */
);

/* 칼로리 */
CREATE TABLE calorie (
	calorie_food VARCHAR2(50) NOT NULL, /* 음식이름 */
	calorie_calorie NUMBER /* 칼로리 */
);

/* 사진 */
CREATE TABLE photo (
	photo_id VARCHAR2(20) NOT NULL, /* 사진ID */
	party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	photo_name VARCHAR2(20), /* 사진이름 */
	photo_path VARCHAR2(30) NOT NULL, /* 경로 */
	photo_time DATE, /* 시간 */
	photo_comment VARCHAR2(100) /* 사진설명 */
);

/* 댓글 */
CREATE TABLE reple (
	reple_id VARCHAR2(20) NOT NULL, /* 댓글id */
	photo_id VARCHAR2(20), /* 사진ID */
	replet_content VARCHAR2(50), /* 댓글내용 */
	reple_time DATE, /* 시간 */
	party_name VARCHAR2(30), /* 그룹이름 */
	cs_id VARCHAR2(10) /* 고객_id */
);

/* 그룹 */
CREATE TABLE party (
	party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	party_right NUMBER NOT NULL, /* 그룹권한 */
	party_date DATE NOT NULL /* 생성날짜 */
);

/* 칼로리캘린더 */
CREATE TABLE caloriecalendar (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	calorie_date DATE NOT NULL, /* 날짜 */
	total_calorie NUMBER /* 총칼로리 */
);

ALTER TABLE health
	ADD
		CONSTRAINT FK_customer_TO_health
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE friendlist
	ADD
		CONSTRAINT FK_customer_TO_friendlist
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE photo
	ADD
		CONSTRAINT FK_party_TO_photo
		FOREIGN KEY (
			party_name,
			cs_id
		)
		REFERENCES party (
			party_name,
			cs_id
		);

ALTER TABLE reple
	ADD
		CONSTRAINT FK_photo_TO_reple
		FOREIGN KEY (
			photo_id,
			party_name,
			cs_id
		)
		REFERENCES photo (
			photo_id,
			party_name,
			cs_id
		);

ALTER TABLE party
	ADD
		CONSTRAINT FK_customer_TO_party
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

ALTER TABLE caloriecalendar
	ADD
		CONSTRAINT FK_customer_TO_caloriecalendar
		FOREIGN KEY (
			cs_id
		)
		REFERENCES customer (
			cs_id
		);

		
---------------------------------------------------
----------------------------------------------------

		ALTER TABLE customer
	ADD
		CONSTRAINT del_customer
		FOREIGN KEY (cs_id 
		REFERENCES party ( s_id)

    	ON DELETE CASCADE
		);
---------------------------------------------------
----------------------------------------------------	
----------------------------------------------------	
		create sequence friendlist_fl_key_seq;