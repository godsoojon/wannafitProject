
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

