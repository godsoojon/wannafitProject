--table 삭제
delete from PARTY;
delete from PHOTO;
drop table customer;
CREATE TABLE friendlist (``
	fl_key VARCHAR2(20) NOT NULL, /* 친구목록식별키 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	firend_id VARCHAR2(10) /* 친구ID */
);
drop table friendlist;

ALTER TABLE friendlist
	ADD
		CONSTRAINT PK_friendlist
		PRIMARY KEY (
			fl_key
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




--table 생성
create table customer(
	cs_id 		varchar2(10) primary key, --primary key 
	cs_password varchar2(15) not null, --pw 6~15자 이하 조건 ,영문+숫자+특수문자
	cs_name 	varchar2(10) not null, --null 제외 조건 
	cs_email	varchar2(20) not null,
	cs_phone	varchar2(20) not null											
);
-- 기본값 설정해주는 방식
-- customerMileage number(7) default 10000 --default는 not null보다 먼저 선언

--insert
insert into customer values ('id-001','1111','유재석', 'ryujs@abc.com','010-6363-0844');
--table customer DB 전체 삭제
delete from photo
--table customer 전체 조회
select * from customer


-- rownum : ResultSet에 생기는 컬럼으로 행번호 값을 가진다.
-- ceil (rownum/10) : 각 행이 포함될 page 번호 ( 10-page당 보여질 데이터(row) 수 ) 

select page, cs_id, cs_password, cs_name, cs_email, cs_phone
from(
	select ceil(rownum/10) page, page, cs_id, cs_password, cs_name, cs_email, cs_phone
	from(
		select page, cs_id, cs_password, cs_name, cs_email, cs_phone
		from customer
			order by cs_id
	)	
)
where page = 1;

--select
-- from select : 각 row에 page(번호) 컬럼 만들기 위해 (rownum 쓰기 위해)
-- from select : 원하는 조건으로 정렬하기 위해

-- 부서 테이블 페이지 처리, 1페이지에 3개씩, 정렬 : 부서이름
-- n 페이지 보는 쿼리문 작성


--select departmentId, departmentName, location
--from(
--select ceil(rownum/3) page, departmentId, departmentName, location
--from(
--select departmentId, departmentName, location
--from department
--order by departmentName
--	)
--)
--where page =3
--
--
--select page, customerId, customerPassword, customerName, customerEmail, customerMileage
--	from(
--			select ceil(rownum/10) page, customerId, customerPassword, customerName, customerEmail, customerMileage
--				from(
--					select customerId, customerPassword, customerName, customerEmail, customerMileage
--					from customer
--					order by customerId
--					)
--	)
--	where page = 1
insert into customer values('1113','1','1','1','1');

insert into HEALTH values('id-001',2.2,3.2,'a',12.2,12.2,1.2,2.2,3.2); 


			update health
			set  h_weight=1,
					h_tall=11, 
					h_bloodtype='B',
					h_bloodsugar=1,
					h_bmi=1,
					h_bloodpressure=1,
					h_ldl=1,
					h_hdh=1
			where cs_id ='1111'	;	
			
			select fl_key,cs_id,friend_id
			from friendList
			where cs_id='1111' AND friend_id='id-003';
	

			select fl_key,cs_id,friend_id
			from (select * from friendList where cs_id='1111')
			where friend_id='soojongk';
			
			select fl_key,cs_id,friend_id
			from (select * from friendList where cs_id='1111')
			where friend_id='soojongk';