
/* 그룹고객목록 */
CREATE TABLE partylist (
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	party_name VARCHAR2(30) NOT NULL /* 그룹이름 */
);

insert into partylist (cs_id, party_name)
		values ('123', 'qqq');
insert into partylist (cs_id, party_name)
		values ('123', 'www');
insert into partylist (cs_id, party_name)
		values ('123', 'eee');
insert into partylist (cs_id, party_name)
		values ('id-001', 'eee');
		

select party_name
from partylist
where cs_id = '123';


select party_name
from party;

select *
from party
where party_name='uuu';

select party_member

select party_name
from party
where cs_id='id-001';

select friend_id
from friendlist
where cs_id='123';


select party_name
from party
where party_right=2 or party_right=3;

update party
set party_right =1
where party_name ='123모두보기'

party_name VARCHAR2(30) NOT NULL, /* 그룹이름 */
	cs_id VARCHAR2(10) NOT NULL, /* 고객_id */
	party_right NUMBER NOT NULL, /* 그룹권한 */
	party_date DATE NOT NULL, /* 생성날짜 */



select party_name, cs_id, party_right, party_date
from party
where party_right=2 or
		party_right=3;


