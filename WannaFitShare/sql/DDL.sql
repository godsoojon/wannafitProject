/* �� */
DROP TABLE customer 
	CASCADE CONSTRAINTS;

/* �ǰ� */
DROP TABLE health 
	CASCADE CONSTRAINTS;

/* ģ����� */
DROP TABLE friendlist 
	CASCADE CONSTRAINTS;

/* Į�θ� */
DROP TABLE calorie 
	CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE photo 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE reple 
	CASCADE CONSTRAINTS;

/* �׷� */
DROP TABLE party 
	CASCADE CONSTRAINTS;

/* �׷����� */
DROP TABLE partylist 
	CASCADE CONSTRAINTS;

/* ��ü �� */
DROP TABLE totalcustomer 
	CASCADE CONSTRAINTS;

/* ��ü�׷� */
DROP TABLE totalparty 
	CASCADE CONSTRAINTS;

/* Į�θ�Ķ���� */
DROP TABLE caloriecalendar 
	CASCADE CONSTRAINTS;



--------------------------------------------------------

	
/* �� */
CREATE TABLE customer (
	cs_id VARCHAR2(10) NOT NULL, /* ��_id */
	cs_password VARCHAR2(20) NOT NULL, /* �н����� */
	cs_name VARCHAR2(30) NOT NULL, /* ���̸� */
	cs_email VARCHAR2(50) NOT NULL, /* �̸��� */
	cs_phone VARCHAR2(20) NOT NULL /* ����ȣ */
);

ALTER TABLE customer
	ADD
		CONSTRAINT PK_customer
		PRIMARY KEY (
			cs_id
		);

/* �ǰ� */
CREATE TABLE health (
	cs_id VARCHAR2(10) NOT NULL, /* ��_id */
	h_weight NUMBER, /* ������ */
	h_tall NUMBER, /* Ű */
	h_bloodtype VARCHAR2(10), /* ������ */
	h_bloodsugar NUMBER, /* ���� */
	h_bmi NUMBER, /* BMI */
	h_bloodpressure NUMBER, /* ���� */
	h_ldl NUMBER, /* LDL */
	h_hdh NUMBER /* HDH */
);

ALTER TABLE health
	ADD
		CONSTRAINT PK_health
		PRIMARY KEY (
			cs_id
		);

/* ģ����� */
CREATE TABLE friendlist (
	fl_key NUMBER NOT NULL, /* ģ����Ͻĺ�Ű */
	cs_id VARCHAR2(10) NOT NULL, /* ��_id */
	friend_id VARCHAR2(10) /* ģ��ID */
);

ALTER TABLE friendlist
	ADD
		CONSTRAINT PK_friendlist
		PRIMARY KEY (
			fl_key
		);

/* Į�θ� */
CREATE TABLE calorie (
	calorie_food VARCHAR2(50) NOT NULL, /* �����̸� */
	calorie_calorie NUMBER /* Į�θ� */
);

ALTER TABLE calorie
	ADD
		CONSTRAINT PK_calorie
		PRIMARY KEY (
			calorie_food
		);

/* ���� */
CREATE TABLE photo (
	photo_id NUMBER NOT NULL, /* ����ID */
	party_name VARCHAR2(30) NOT NULL, /* �׷��̸� */
	cs_id VARCHAR2(10) NOT NULL, /* ��_id */
	photo_name VARCHAR2(20), /* �����̸� */
	photo_path VARCHAR2(30) NOT NULL, /* ��� */
	photo_time DATE, /* �ð� */
	photo_comment VARCHAR2(100) /* �������� */
);

ALTER TABLE photo
	ADD
		CONSTRAINT PK_photo
		PRIMARY KEY (
			photo_id,
			party_name,
			cs_id
		);

/* ��� */
CREATE TABLE reple (
	reple_id NUMBER NOT NULL, /* ���id */
	photo_id NUMBER, /* ����ID */
	replet_content VARCHAR2(50), /* ��۳��� */
	reple_time DATE, /* �ð� */
	party_name VARCHAR2(30), /* �׷��̸� */
	cs_id VARCHAR2(10) /* ��_id */
);

ALTER TABLE reple
	ADD
		CONSTRAINT PK_reple
		PRIMARY KEY (
			reple_id
		);

/* �׷� */
CREATE TABLE party (
	party_name VARCHAR2(30) NOT NULL, /* �׷��̸� */
	cs_id VARCHAR2(10) NOT NULL, /* ��_id */
	party_right NUMBER NOT NULL, /* �׷���� */
	party_date DATE NOT NULL /* ������¥ */
);

ALTER TABLE party
	ADD
		CONSTRAINT PK_party
		PRIMARY KEY (
			party_name,
			cs_id
		);

/* Į�θ�Ķ���� */
CREATE TABLE caloriecalendar (
	cs_id VARCHAR2(10) NOT NULL, /* ��_id */
	calorie_date DATE NOT NULL, /* ��¥ */
	total_calorie NUMBER /* ��Į�θ� */
);

ALTER TABLE caloriecalendar
	ADD
		CONSTRAINT PK_caloriecalendar
		PRIMARY KEY (
			cs_id,
			calorie_date
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
drop sequence reple_reple_id_seq;
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

	photo_id number(20) NOT NULL, /* 사진ID */

	
	party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	photo_name VARCHAR2(20), /* 사진이름 */
	photo_path VARCHAR2(30) NOT NULL, /* 경로 */
	photo_time DATE, /* 시간 */
	photo_comment VARCHAR2(100) /* 사진설명 */
);

/* 댓글 */
CREATE TABLE reple (

	reple_id NUMBER(20) NOT NULL, /* 댓글id */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	photo_id number(20), /* 사진ID */
	
	reple_content VARCHAR2(50), /* 댓글내용 */
	reple_time DATE ,/* 시간 */
	party_name VARCHAR2(30)/* 그룹이름 */


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
		create sequence reple_reple_id_seq;