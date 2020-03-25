--
--create user gregre identified by gregre
--default tablespace users;
--
--grant connect, resource to gregre;

--================================================
create table TB_admin_count(
    new_member number,
    today_visit number,
    total_member number, 
    total_visit number);

--drop table TB_admin_count;

comment on table TB_admin_count is '관리자 정보 테이블';
comment on column TB_admin_count.new_member is '신규 회원수';
comment on column TB_admin_count.today_visit is '오늘 방문수';
comment on column TB_admin_count.total_member is '총 회원수';
comment on column TB_admin_count.total_visit is '총 방문수';

insert into TB_admin_count values(0, 0, 3, 0);

--=======================================================

create table TB_PWD_hint(
    hint_code char(2),
    PWD_hint varchar2(200) not null,
    constraint pk_pwd_hint primary key(hint_code));

--drop table TB_PWD_hint;

comment on table TB_PWD_hint is '비밀번호 찾기 힌트 목록이 저장된 테이블';
comment on column TB_PWD_hint.hint_code is '비밀번호 찾기 힌트 코드';
comment on column TB_PWD_hint.PWD_hint is '비밀번호 찾기 질문';

insert into TB_PWD_hint values('H1', '당신의 첫 사랑 이름은?');
insert into TB_PWD_hint values('H2', '당신이 좋아하는 색은?');
insert into TB_PWD_hint values('H3', '첫번째 선생님의 성함은?');
insert into TB_PWD_hint values('H4', '당신의 부모님 결혼기념일은?');
insert into TB_PWD_hint values('H5', '당신이 좋아하는 음식은?');
insert into TB_PWD_hint values('H6', '당신에게 가장 소중한 물건은?');
insert into TB_PWD_hint values('H7', '당신이 가장 인상깊게 본 영화는?');
insert into TB_PWD_hint values('H8', '당신의 기억 속에 남는 도시는?');
insert into TB_PWD_hint values('H9', '당신이 졸업한 초등학교 이름은?');

--=======================================================

create table TB_preg_info(cycle number not null, info_url varchar2(500) not null);
--drop table TB_preg_info;

comment on table TB_preg_info is '임신정보 URL';
comment on column TB_preg_info.cycle is '주기';
comment on column TB_preg_info.info_url is '정보값 URL';

--=======================================================

create table TB_MEMBER_INFO(
    member_ID varchar2(15),
    member_PWD  varchar2(300) not null,
    member_name  varchar2(30) not null,
    nickname varchar2(50) not null,
    birthday date not null,
    phone char(11),
    PWD_hint_code char(2) not null,
    PWD_ans varchar2(30) not null,
    address varchar2(300),
    email varchar2(30),
    gender char(1),
    grade char(1),
    age number,
    mate_ID varchar2(15),
    child_number number,
    enroll_date date default sysdate,
    constraint pk_member_ID primary key(member_ID),
    constraint fk_hint_code foreign key(PWD_hint_code) references TB_PWD_hint(hint_code),
    constraint chk_gender check (gender in ('M', 'F')),
    constraint fk_mateID foreign key(mate_ID) references TB_member_info(member_ID) on delete set null);

--drop table TB_MEMBER_INFO;

comment on table TB_MEMBER_INFO is '회원 정보 테이블';
comment on column TB_MEMBER_INFO.member_ID is '회원 아이디';
comment on column TB_MEMBER_INFO.member_PWD is '회원 비밀번호';
comment on column TB_MEMBER_INFO.member_name is '회원 이름';
comment on column TB_MEMBER_INFO.nickname is '회원 닉네임';
comment on column TB_MEMBER_INFO.birthday is '회원 생년월일';
comment on column TB_MEMBER_INFO.phone is '회원 연락처';
comment on column TB_MEMBER_INFO.PWD_hint_code is '회원 비밀번호 찾기 힌트 코드';
comment on column TB_MEMBER_INFO.PWD_ans is '비밀번호 찾기 답';
comment on column TB_MEMBER_INFO.address is '회원 주소';
comment on column TB_MEMBER_INFO.email is '회원 이메일';
comment on column TB_MEMBER_INFO.gender is '회원 성별';
comment on column TB_MEMBER_INFO.grade is '회원 등급';
comment on column TB_MEMBER_INFO.age is '회원 나이';
comment on column TB_MEMBER_INFO.mate_ID is '배우자 아이디';
comment on column TB_MEMBER_INFO.child_number is '자녀 여부(명수)';
comment on column TB_MEMBER_INFO.enroll_date is '회원 등록날짜';

insert into TB_member_info values('admin000', 'admin000', '관리자', '관리자', '1919-03-01', '01012341234', 'H1', '첫 사랑니', '사랑시 고백구 행복동', 'love@care.com', 'M', 'A', 19, null, null, sysdate);
insert into TB_member_info values('user000', 'user000', '아이스', '아메리카노', '2019-03-01', '01012341234', 'H1', '첫 사랑니', '사랑시 고백구 행복동', 'love@care.com', 'F', 'M', 19, null, 1, sysdate);
insert into TB_member_info values('user001', 'user001', '뜨거운', '아메리카노', '2019-03-01', '01012341234', 'H1', '첫 사랑니', '사랑시 고백구 행복동', 'love@care.com', 'M', 'M', 19, 'user000', 1, sysdate);

--=======================================================

create table TB_WITHDRAW_MEMBER_INFO(member_ID varchar2(15), member_PWD  varchar2(300), member_name  varchar2(30), nickname varchar2(50), birthday date, phone  char(11), PWD_hint_code char(2), PWD_ans varchar2(30), address  varchar2(300), email  varchar2(30), gender char(1), age number, mate_ID varchar2(15), child_number number, enroll_date date, withdraw_date date);

--drop table TB_withdraw_member_info;

comment on table TB_WITHDRAW_MEMBER_INFO is '탈퇴 회원 정보 테이블';
comment on column TB_WITHDRAW_MEMBER_INFO.member_ID is '탈퇴회원 아이디';
comment on column TB_WITHDRAW_MEMBER_INFO.member_PWD is '탈퇴회원 비밀번호';
comment on column TB_WITHDRAW_MEMBER_INFO.member_name is '탈퇴회원 이름';
comment on column TB_WITHDRAW_MEMBER_INFO.nickname is '탈퇴회원 닉네임';
comment on column TB_WITHDRAW_MEMBER_INFO.birthday is '탈퇴회원 생일';
comment on column TB_WITHDRAW_MEMBER_INFO.phone is '탈퇴회원 전화번호';
comment on column TB_WITHDRAW_MEMBER_INFO.PWD_hint_code is '탈퇴회원 비밀번호 찾기 힌트 코드';
comment on column TB_WITHDRAW_MEMBER_INFO.PWD_ans is '탈퇴회원 비밀번호 찾기 답';
comment on column TB_WITHDRAW_MEMBER_INFO.address is '탈퇴회원 주소';
comment on column TB_WITHDRAW_MEMBER_INFO.email is '탈퇴회원 이메일';
comment on column TB_WITHDRAW_MEMBER_INFO.gender is '탈퇴회원 성별';
comment on column TB_WITHDRAW_MEMBER_INFO.age is '탈퇴회원 나이';
comment on column TB_WITHDRAW_MEMBER_INFO.mate_ID is '탈퇴회원 배우자 아이디';
comment on column TB_WITHDRAW_MEMBER_INFO.child_number is '탈퇴회원 자녀 여부(명수)';
comment on column TB_WITHDRAW_MEMBER_INFO.enroll_date is '탈퇴회원 등록날짜';
comment on column TB_WITHDRAW_MEMBER_INFO.withdraw_date is '탈퇴날짜';

--=======================================================

create or replace trigger member_withdraw
after
delete on TB_member_info
for each row
begin
    insert into TB_withdraw_member_info values (
        :old.member_ID, :old.member_PWD, :old.member_name,
        :old.nickname, :old.birthday, :old.phone,
        :old.pwd_hint_code, :old.pwd_ans, :old.address,
        :old.email, :old.gender, :old.age, :old.mate_ID,
        :old.child_number, :old.enroll_Date, sysdate
    );
end;
/
--drop trigger member_withdraw;

--=======================================================

create table TB_comp_member(
    Cmember_ID varchar2(15) constraint pk_comp_id primary key,
    member_PWD varchar2(300),
    phone char(11), 
    comp_div char(1) constraint chk_comp_div check(comp_div in ('A', 'H', 'S')));
--drop table TB_comp_member
insert into tb_comp_member values('igre_mall_test', 1234, '01012341234','S');

/*쇼핑몰테스트*/
select * from tb_comp_member;
commit;
/**/
comment on table TB_comp_member is '기업회원 정보';
comment on column TB_comp_member.Cmember_ID is '기업회원 아이디';
comment on column TB_comp_member.member_PWD is '기업회원 비밀번호';
comment on column TB_comp_member.phone is '기업회원 연락처';
comment on column TB_comp_member.comp_div is '기업회원 구분(상담사, 병원, 판매자)';

--=======================================================

create table TB_child(
    parents_ID varchar2(15) constraint fk_child_parents_ID references TB_member_info(member_ID) on delete cascade not null,
    child_ID varchar2(15) constraint pk_child primary key,
    child_name varchar2(30) not null,
    birthday date not null,
    gender char(1) not null constraint chk_child_gender check(gender in ('M', 'F')),
    phone char(11));
--drop table TB_child;
insert into TB_child values('user000', 'child000', '밍밍', '2020-03-03', 'M', null);

comment on table TB_child is '회원 자녀에 대한 정보';
comment on column TB_child.parents_ID is '부모 아이디';
comment on column TB_child.child_name is '자녀 이름';
comment on column TB_child.birthday is '생년월일';
comment on column TB_child.gender is '성별';
comment on column TB_child.phone is '자녀 휴대폰번호';

--=======================================================

create table TB_vaccin(
    vaccin_code varchar2(10) constraint pk_vaccin primary key,
    vaccin_name varchar2(30) not null
);
--drop table TB_vaccin;

comment on table TB_vaccin is '백신정보';
comment on column TB_vaccin.vaccin_code is '백신 코드';
comment on column TB_vaccin.vaccin_name is '백신명';

insert into TB_vaccin values('TB', '결핵');
insert into TB_vaccin values('Hepa B', 'B형 간염');
insert into TB_vaccin values('cerebro', '뇌수막염');
insert into TB_vaccin values('polio', '소아마비');
insert into TB_vaccin values('diplo', '폐렴구균');
insert into TB_vaccin values('DPT', 'DPT');
insert into TB_vaccin values('combo', '콤보');
insert into TB_vaccin values('chick', '수두');
insert into TB_vaccin values('mmr', 'mmr');
insert into TB_vaccin values('JapEncep1', '일본뇌염(생)');
insert into TB_vaccin values('JapEncep2', '일본뇌염(사)');
insert into TB_vaccin values('influ', '인플루엔자');
insert into TB_vaccin values('typhoid', '장티푸스');

--=======================================================

create table TB_vaccination(
    parents_ID varchar2(15) constraint fk_vaccin_parents references TB_member_info(member_ID) on delete cascade,
    child_ID varchar2(15) constraint fk_vaccin_child references TB_child(child_ID) on delete cascade,
    vaccin_code varchar2(10) constraint fk_vaccin_code references TB_vaccin(vaccin_code) on delete cascade,
    vaccin_date date
);
--drop table TB_vaccination;

comment on table TB_vaccination is '자녀 예방접종 정보';
comment on column TB_vaccination.parents_ID is '부모 아이디';
comment on column TB_vaccination.child_ID is '자녀 아이디';
comment on column TB_vaccination.vaccin_code is '백신 코드';
comment on column TB_vaccination.vaccin_date is '예방접종 날짜';

--=======================================================

--create table TB_menses_(member_ID)(menses_no number, menses_start date, menses_end date, menses_cycle number, menses_next date, childbearing_age_start date, childbearing_age_end date, sex_date1 date, sex_date2 date, sex_date3 date, sex_date4 date, sex_date5 date, sex_date6 date, sex_date7 date, sex_date8 date, sex_date9 date, sex_date10 date, sex_date11 date, sex_date12 date, sex_date13 date, sex_date14 date, sex_date15 date, sex_date16 date, sex_date17 date, sex_date18 date, sex_date19 date, sex_date20 date, pregnancy_date date);
create table TB_menses_admin000(menses_no number, menses_start date, menses_end date, menses_cycle number, menses_next date, childbearing_age_start date, childbearing_age_end date, pregnancy_date date);
create table TB_menses_user000(menses_no number, menses_start date, menses_end date, menses_cycle number, menses_next date, childbearing_age_start date, childbearing_age_end date, pregnancy_date date);
create table TB_menses_user001(menses_no number, menses_start date, menses_end date, menses_cycle number, menses_next date, childbearing_age_start date, childbearing_age_end date, pregnancy_date date);

--comment on table TB_menses_(member_ID) is '회원 월경정보';
--comment on column TB_menses_(member_ID).menses_no is '생리 번호(seq_(member_ID)_menses)';
--comment on column TB_menses_(member_ID).menses_start is '생리 시작 날짜';
--comment on column TB_menses_(member_ID).menses_end is '생리 종료 날짜';
--comment on column TB_menses_(member_ID).menses_cycle is '생리주기';
--comment on column TB_menses_(member_ID).menses_next is '다음 생리 예상 날짜';
--comment on column TB_menses_(member_ID).childbearing_age_start is '가임기 시작 날짜';
--comment on column TB_menses_(member_ID).childbearing_age_end is '가임기 종료 날짜';
--comment on column TB_menses_(member_ID).pregnancy_date is '임신날짜';

--=======================================================

create table TB_sex(member_ID varchar2(15) constraint fk_member_sex references TB_member_info(member_ID), sex_date date);
--drop table TB_sex;

comment on table TB_sex is '관계날짜';
comment on column TB_sex.member_ID is '회원 아이디';
comment on column TB_sex.sex_date is '관계날짜';

--=======================================================

create table TB_adviser(
    advis_ID varchar2(15) constraint pk_advis_ID primary key constraint fk_advis_ID references TB_comp_member(Cmember_ID) on delete cascade,
    advis_name varchar2(12),
    advis_intro varchar2(1000),
    advis_career varchar2(1000),
    advis_license varchar2(50),
    advis_grade char(1),
    advis_license_file varchar2(500),
    advis_img varchar2(500)
);
--drop table TB_adviser;

comment on table TB_adviser is '상담사 정보 테이블';
comment on column TB_adviser.advis_ID is '상담사 아이디';
comment on column TB_adviser.advis_name is '상담사 이름';
comment on column TB_adviser.advis_intro is '상담사 소개';
comment on column TB_adviser.advis_career is '상담사 경력';
comment on column TB_adviser.advis_license is '상담사 자격증';
comment on column TB_adviser.advis_grade is '상담사 등급';
comment on column TB_adviser.advis_license_file is '상담사 자격증 사진파일명';
comment on column TB_adviser.advis_img is '상담사 사진파일명';


--=======================================================

create table TB_advis_ship(
    member_ID varchar2(15) constraint fk_advisship references TB_member_info(member_ID) on delete cascade,
    membership varchar2(60),
    ms_start date, ms_end date);
--drop table TB_advis_ship;

comment on table TB_advis_ship is '상담 관련 멤버십 테이블';
comment on column TB_advis_ship.member_ID is '회원 아이디';
comment on column TB_advis_ship.membership is '멤버십 이름';
comment on column TB_advis_ship.ms_start is '멤버십 시작날짜';
comment on column TB_advis_ship.ms_end is '멤버십 종료날짜';

--=======================================================

create table TB_appointment(
    appoint_no number constraint pk_appoint_no primary key,
    member_ID varchar2(15) constraint fk_appoint_member_ID references TB_member_info(member_ID) on delete cascade,
    appoint_date date,
    appoint_time char(5),
    advis_ID varchar2(15) constraint fk_appoint_advis_code references TB_adviser(advis_ID) on delete cascade,
    appoint_ment varchar2(3000)
);
--drop table TB_appointment;

comment on table TB_appointment is '상담 예약 테이블';
comment on column TB_appointment.appoint_no is '예약번호';
comment on column TB_appointment.member_ID is '예약자 아이디';
comment on column TB_appointment.appoint_date is '예약 날짜';
comment on column TB_appointment.appoint_time is '예약 시간(HH:mm)';
comment on column TB_appointment.advis_ID is '피예약 상담사 아이디';
comment on column TB_appointment.appoint_ment is '피상담자 상태(예약 시 예약자가 작성)';

--=======================================================

create table TB_appoint_light(
    appoint_no number constraint pk_appoint_light primary key,
    member_ID varchar2(15) default 'admin000' constraint fk_light_appoint_ID references TB_member_info(member_ID) on delete cascade,
    phone char(11),
    appoint_ment varchar2(3000),
    appoint_date date,
    appoint_stat char(1) constraint chk_appoint_light check (appoint_stat in ('Y', 'N'))
);
--drop table TB_appoint_light;

comment on table TB_appoint_light is '간편예약 테이블';
comment on column TB_appoint_light.appoint_no is '예약번호';
comment on column TB_appoint_light.member_ID is '예약자 아이디';
comment on column TB_appoint_light.phone is '예약자 연락처';
comment on column TB_appoint_light.appoint_ment is '예약자 상태(예약 시 예약자가 작성)';
comment on column TB_appoint_light.appoint_date is '예약 날짜';
comment on column TB_appoint_light.appoint_stat is '예약접수 상태';

--=======================================================

create table TB_adviser_review(
    advis_review_no number constraint pk_advis_review_no primary key,
    appoint_no number constraint fk_adv_rv_appoint_no references TB_appointment(appoint_no),
    advis_ID varchar2(15) constraint fk_adv_ID references TB_adviser(advis_ID) on delete cascade,
    reviewer_ID varchar2(15) constraint fk_rev_ID references TB_member_info(member_ID) on delete set null,
    star_point number,
    review_content varchar2(1000) not null,
    review_date date default sysdate
);
--drop table TB_adviser_review;

comment on table TB_adviser_review is '상담사 리뷰 테이블';
comment on column TB_adviser_review.advis_review_no is '리뷰번호';
comment on column TB_adviser_review.appoint_no is '예약번호';
comment on column TB_adviser_review.advis_ID is '상담사 아이디';
comment on column TB_adviser_review.reviewer_ID is '리뷰어 아이디';
comment on column TB_adviser_review.star_point is '별점';
comment on column TB_adviser_review.review_content is '리뷰 내용';
comment on column TB_adviser_review.review_date is '리뷰 작성 시간';

--========================================================

create table TB_board(board_code varchar2(5) constraint pk_board primary key, board_name varchar2(30));
--drop table TB_board;

comment on table TB_board is '게시판 리스트';
comment on column TB_board.board_code is '게시판 코드';
comment on column TB_board.board_name is '게시판 이름';

insert into TB_board values('B1', '공지사항');
insert into TB_board values('B2', '행사 및 교육');
insert into TB_board values('B3', '자료실');

--=======================================================
/*
create table TB_post_(board_code)(
    board_code varchar2(5) constraint fk_post_(board_code) references TB_board(board_code) on delete cascade not null,
    post_no number constraint pk_post_(board_code) primary key,
    writer varchar2(15) constraint fk_(board_code)_writer references TB_member_info(member_ID) on delete null ,
    notice char(1) constraint chk_(board_code)_notice check (notice in ('Y', 'N')) default 'N' not null,
    post_PWD char(4) default '0000' not null,
    title varchar2(100) default '제목없음' not null,
    content varchar2(3000) default '내용없음' not null,
    post_write_time date default sysdate not null,
    read_count number not null,
    like_count number default 0,
    recommen_count number default 0,
    decommen_count number default 0,
    origin_filename varchar2(500),
    rename_filename varchar2(500)
);
*/
create table TB_post_B1(board_code varchar2(5) constraint fk_post_B1 references TB_board(board_code) on delete cascade not null, post_no number constraint pk_post_B1 primary key, writer varchar2(15) constraint fk_B1_writer references TB_member_info(member_ID) on delete set null, notice char(1) default 'N' not null constraint chk_B1_notice check (notice in ('Y', 'N')), post_PWD char(4) default '0000' not null, title varchar2(100) default '제목없음' not null, content varchar2(3000) default '내용없음' not null, post_write_time date default sysdate not null, read_count number not null, like_count number default 0, recommen_count number default 0, decommen_count number default 0, origin_filename varchar2(500), rename_filename varchar2(500));
create table TB_post_B2(board_code varchar2(5) constraint fk_post_B2 references TB_board(board_code) on delete cascade not null, post_no number constraint pk_post_B2 primary key, writer varchar2(15) constraint fk_B2_writer references TB_member_info(member_ID) on delete set null, notice char(1) default 'N' not null constraint chk_B2_notice check (notice in ('Y', 'N')), post_PWD char(4) default '0000' not null, title varchar2(100) default '제목없음' not null, content varchar2(3000) default '내용없음' not null, post_write_time date default sysdate not null, read_count number not null, like_count number default 0, recommen_count number default 0, decommen_count number default 0, origin_filename varchar2(500), rename_filename varchar2(500));
create table TB_post_B3(board_code varchar2(5) constraint fk_post_B3 references TB_board(board_code) on delete cascade not null, post_no number constraint pk_post_B3 primary key, writer varchar2(15) constraint fk_B3_writer references TB_member_info(member_ID) on delete set null, notice char(1) default 'N' not null constraint chk_B3_notice check (notice in ('Y', 'N')), post_PWD char(4) default '0000' not null, title varchar2(100) default '제목없음' not null, content varchar2(3000) default '내용없음' not null, post_write_time date default sysdate not null, read_count number not null, like_count number default 0, recommen_count number default 0, decommen_count number default 0, origin_filename varchar2(500), rename_filename varchar2(500));
--drop table TB_post_B1;
--select * from TB_post_B1;
--comment on table TB_post_(board_code) is '게시글 리스트';
--comment on column TB_post_(board_code).board_code is '게시판 코드';
--comment on column TB_post_(board_code).post_no is '게시글 번호';
--comment on column TB_post_(board_code).writer is '게시글 작성자 아이디';
--comment on column TB_post_(board_code).notice is '공지글 설정 여부';
--comment on column TB_post_(board_code).post_PWD is '게시글 변경 암호';
--comment on column TB_post_(board_code).title is '게시글 제목';
--comment on column TB_post_(board_code).content is '게시글 내용';
--comment on column TB_post_(board_code).post_write_time is '게시글 작성 시간';
--comment on column TB_post_(board_code).read_count is '게시글 조회수';
--comment on column TB_post_(board_code).like_count is '게시글 선호수';
--comment on column TB_post_(board_code).recommen_count is '게시글 추천수';
--comment on column TB_post_(board_code).decommen_count is '게시글 비추천수';
--comment on column TB_post_(board_code).origin_filename is '첨부파일 원본 이름';
--comment on column TB_post_(board_code).rename_filename is '첨부파일 변경 이름';

--=======================================================

create table TB_delete_post(board_code varchar2(5), post_no number, writer varchar2(15), notice char(1), post_PWD char(4), title varchar2(100), content varchar2(3000), post_write_time date, read_count number, like_count number, recommen_count number, decommen_count number, post_delete_time date default sysdate, post_deleter varchar2(15));
--drop table TB_delete_post;

comment on table TB_delete_post is '삭제 게시글 정보';
comment on column TB_delete_post.board_code is '삭제게시글이 존재했던 게시판 코드';
comment on column TB_delete_post.post_no is '삭제게시글 번호';
comment on column TB_delete_post.writer is '삭제게시글 작성자 아이디';
comment on column TB_delete_post.notice is '삭제게시글 공지 설정 여부';
comment on column TB_delete_post.post_PWD is '삭제게시글 변경 암호';
comment on column TB_delete_post.title is '삭제게시글 제목';
comment on column TB_delete_post.content is '삭제게시글 내용';
comment on column TB_delete_post.post_write_time is '삭제게시글 작성 시간';
comment on column TB_delete_post.read_count is '삭제게시글 조회수';
comment on column TB_delete_post.like_count is '삭제게시글 선호수';
comment on column TB_delete_post.recommen_count is '삭제게시글 추천수';
comment on column TB_delete_post.decommen_count is '삭제게시글 비추천수';
comment on column TB_delete_post.post_delete_time is '삭제 시간';
comment on column TB_delete_post.post_deleter is '게시글 삭제자 아이디';

--=======================================================
/*
create or replace trigger delete_post_(board_code)
after
delete on TB_post_(board_code)
for each row
begin
    insert into TB_delete_post values (
        :old.board_code, :old.post_no, :old.writer, :old.notice,
        :old.post_PWD, :old.title, :old.content, :old.post_write_time,
        :old.read_count, :old.like_count, :old.recommen_count,
        :old.decommen_count, sysdate, 'A'
    );
end;
/
*/
create or replace trigger delete_post_B1 after delete on TB_post_B1 for each row begin insert into TB_delete_post values (:old.board_code, :old.post_no, :old.writer, :old.notice, :old.post_PWD, :old.title, :old.content, :old.post_write_time, :old.read_count, :old.like_count, :old.recommen_count, :old.decommen_count, sysdate, 'A'); end;
/
create or replace trigger delete_post_B2 after delete on TB_post_B2 for each row begin insert into TB_delete_post values (:old.board_code, :old.post_no, :old.writer, :old.notice, :old.post_PWD, :old.title, :old.content, :old.post_write_time, :old.read_count, :old.like_count, :old.recommen_count, :old.decommen_count, sysdate, 'A'); end;
/
create or replace trigger delete_post_B3 after delete on TB_post_B3 for each row begin insert into TB_delete_post values (:old.board_code, :old.post_no, :old.writer, :old.notice, :old.post_PWD, :old.title, :old.content, :old.post_write_time, :old.read_count, :old.like_count, :old.recommen_count, :old.decommen_count, sysdate, 'A'); end;
/

--=======================================================

/*
create table TB_reply_(board_code)(
    board_code varchar2(5) constraint fk_reply_(board_code) references TB_board(board_code) on delete cascade not null,
    post_no number constraint fk_reply_post_(board_code) references TB_post_(board_code)(post_no) on delete cascade not null,
    reply_no number constraint pk_reply primary key,
    reply_writer varchar2(30) constraint fk_reply_writer_(board_code) references TB_member_info(member_ID) on delete set null not null,
    reply_content varchar2(50) not null,
    reply_write_time date default sysdate,
    recommen_count number default 0,
    decommen_count number default 0
);
*/
create table TB_reply_B1(board_code varchar2(5) constraint fk_reply_B1 references TB_board(board_code) on delete cascade not null, post_no number constraint fk_reply_post_B1 references TB_post_B1(post_no) on delete cascade not null, reply_no number constraint pk_B1_reply primary key, reply_writer varchar2(30) constraint fk_reply_writer_B1 references TB_member_info(member_ID) on delete set null not null, reply_content varchar2(50) not null, reply_write_time date default sysdate, recommen_count number default 0, decommen_count number default 0);
create table TB_reply_B2(board_code varchar2(5) constraint fk_reply_B2 references TB_board(board_code) on delete cascade not null, post_no number constraint fk_reply_post_B2 references TB_post_B1(post_no) on delete cascade not null, reply_no number constraint pk_B2_reply primary key, reply_writer varchar2(30) constraint fk_reply_writer_B2 references TB_member_info(member_ID) on delete set null not null, reply_content varchar2(50) not null, reply_write_time date default sysdate, recommen_count number default 0, decommen_count number default 0);
create table TB_reply_B3(board_code varchar2(5) constraint fk_reply_B3 references TB_board(board_code) on delete cascade not null, post_no number constraint fk_reply_post_B3 references TB_post_B1(post_no) on delete cascade not null, reply_no number constraint pk_B3_reply primary key, reply_writer varchar2(30) constraint fk_reply_writer_B3 references TB_member_info(member_ID) on delete set null not null, reply_content varchar2(50) not null, reply_write_time date default sysdate, recommen_count number default 0, decommen_count number default 0);

--comment on table TB_reply_(board_code) is '댓글 정보';
--comment on column TB_reply_(board_code).board_code is '댓글 게시글의 게시판 코드';
--comment on column TB_reply_(board_code).post_no is '댓글 게시글의 번호';
--comment on column TB_reply_(board_code).reply_no is '댓글 번호';
--comment on column TB_reply_(board_code).reply_writer is '댓글 작성자 아이디';
--comment on column TB_reply_(board_code).reply_content is '댓글 내용';
--comment on column TB_reply_(board_code).reply_write_time is '댓글 작성 시간';
--comment on column TB_reply_(board_code).recommen_count is '댓글 추천수';
--comment on column TB_reply_(board_code).decommen_count is '댓글 비추천수';

--=======================================================

create table TB_delete_reply(board_code varchar2(5), post_no number, reply_no number, reply_writer  varchar2(30), reply_content varchar2(50), reply_write_time date, recommen_count number, decommen_count number, reply_delete_time date, reply_deleter varchar2(15));
--drop table TB_delete_reply;

comment on table TB_delete_reply is '삭제댓글 정보';
comment on column TB_delete_reply.board_code is '삭제댓글 게시글의 게시판 코드';
comment on column TB_delete_reply.post_no is '삭제댓글 게시글의 번호';
comment on column TB_delete_reply.reply_no is '댓글 번호';
comment on column TB_delete_reply.reply_writer is '삭제댓글 작성자 아이디';
comment on column TB_delete_reply.reply_content is '댓글 내용';
comment on column TB_delete_reply.reply_write_time is '댓글 작성 시간';
comment on column TB_delete_reply.recommen_count is '댓글 추천수';
comment on column TB_delete_reply.decommen_count is '댓글 비추천수';
comment on column TB_delete_reply.reply_delete_time is '댓글 삭제 시간';
comment on column TB_delete_reply.reply_deleter is '댓글 삭제자 아이디';

--=======================================================
/*
create or replace trigger delete_reply_(board_code)
after
delete on TB_reply_(board_code)
for each row
begin
    insert into TB_delete_reply values(
        :old.board_code, :old.post_no, :old.reply_no, :old.reply_writer,
        :old.reply_content, :old.reply_write_time, :old.recommen_count,
        :old.decommen_count, sysdate, 'B'
    );
end;
/
*/
create or replace trigger delete_reply_B1 after delete on TB_reply_B1 for each row begin insert into TB_delete_reply values(:old.board_code, :old.post_no, :old.reply_no, :old.reply_writer, :old.reply_content, :old.reply_write_time, :old.recommen_count, :old.decommen_count, sysdate, 'B'); end;
/
create or replace trigger delete_reply_B2 after delete on TB_reply_B2 for each row begin insert into TB_delete_reply values(:old.board_code, :old.post_no, :old.reply_no, :old.reply_writer, :old.reply_content, :old.reply_write_time, :old.recommen_count, :old.decommen_count, sysdate, 'B'); end;
/
create or replace trigger delete_reply_B3 after delete on TB_reply_B3 for each row begin insert into TB_delete_reply values(:old.board_code, :old.post_no, :old.reply_no, :old.reply_writer, :old.reply_content, :old.reply_write_time, :old.recommen_count, :old.decommen_count, sysdate, 'B'); end;
/
--=======================================================

create table TB_report(report_no number constraint pk_report primary key, reporter_ID varchar2(15), reportee_ID varchar2(15), report_board varchar2(5), report_post_no number, report_reply_no number, report_content varchar2(2000), report_conf char(1) default 'N' constraint chk_report check(report_conf in ('Y', 'N')));
--drop table TB_report;

comment on table TB_report is '신고내용';
comment on column TB_report.report_no is '신고 번호';
comment on column TB_report.reporter_ID is '신고자 아이디';
comment on column TB_report.reportee_ID is '피신고자 아이디';
comment on column TB_report.report_board is '신고된 게시판 코드';
comment on column TB_report.report_post_no is '신고된 게시글 번호';
comment on column TB_report.report_reply_no is '신고된 댓글 번호';
comment on column TB_report.report_content is '신고 내용';
comment on column TB_report.report_conf is '신고 처리여부';

--=======================================================
--판매자 테이블
create table TB_seller(
    seller_ID varchar2(15) constraint pk_seller primary key constraint fk_seller_ID references TB_comp_member(Cmember_ID) on delete cascade,
    phone char(13) not null,
    comp_ID varchar2(15) constraint unk_comp_ID unique not null,
    comp_name varchar2(30),
    comp_num varchar2(15),
    comp_address varchar2(300),
    seller_comp_img varchar2(500)
);
select * from tb_seller;
--drop table TB_seller;
insert into TB_seller values('igre_mall_test','01012341234','comp0001','아이그레','test','test','test' );
commit;


comment on table TB_seller is '판매자 정보 테이블';
comment on column TB_seller.seller_ID is '판매자 아이디';
comment on column TB_seller.phone is '판매자 연락처';
comment on column TB_seller.comp_ID is '판매사 아이디';
comment on column TB_seller.comp_name is '판매사 이름';
comment on column TB_seller.comp_num is '판매사 연락처';
comment on column TB_seller.comp_address is '판매사 주소';
comment on column TB_seller.seller_comp_img is '판매사 사진파일명';

--=======================================================

--create table TB_type(
--    product_type_id char(3) constraint pk_type primary key, 
--    product_type_name varchar2(20)
--);
--상품 카테고리 테이블
create table TB_category(
    category_id char(3) constraint pk_type primary key,
    category_name varchar2(20)
);
 
insert into TB_category values('CA1','분유');
insert into TB_category values('CA2','이유식');
insert into TB_category values('CA3','기저귀');
insert into TB_category values('CA4','물티슈');
insert into TB_category values('CA5','이유용품');
insert into TB_category values('CA6','수유용품');
insert into TB_category values('CA7','목욕용품');
select * from tb_category;
commit;
--drop table TB_type;

comment on table TB_category is '제품 타입 테이블';
comment on column TB_category.category_id is '제품 카테고리 아이디';
comment on column TB_category.category_name is '제품 카테고리명';

--=======================================================

--create table TB_product(
--    seller_ID varchar2(15) constraint fk_product_seller_ID references TB_seller(seller_ID) on delete cascade,
--    product_ID varchar2(50) constraint pk_product_ID primary key,
--    product_name varchar2(150) not null,
--    price number not null,
--    brand_name varchar2(40) default 'noBrand' not null,
--    product_type char(3) constraint fk_type references TB_type(product_type_ID) on delete set null,
--    delivery_fee number not null,
--    saving_rate number not null,
--    release_date date,
--    state char(1) constraint chk_state check(state in ('Y', 'S', 'D')));


create table TB_product(
    seller_id varchar2(15) constraint fk_product_seller_ID_ references TB_seller(seller_ID) on delete cascade,
    product_id varchar2(50) constraint pk_product_ID_ primary key,
    category_id char(3) not null constraint fk_product_category_ID_ references TB_category(category_id) on delete set null,
    product_name varchar2(150) not null,
    brand_name varchar2(40) default 'noBrand' not null,
    price number,
    delivery_fee varchar2(20) not null,
    point_rate number,
    discount_price number,
    product_images varchar2(3000),
    product_stock number,
    product_detail varchar2(3000),
    enroll_date date default sysdate,
    product_state char(1) default 'Y' constraint chk_product_state check(product_state in ('Y', 'S', 'D')) 
);
--drop table tb_product;
select * from tb_product;
--drop table TB_product;

comment on table TB_product is '판매제품 정보 테이블';
comment on column TB_product.seller_ID is '판매자 아이디';
comment on column TB_product.product_ID is '제품 아이디';
comment on column TB_product.product_name is '제품명';
comment on column TB_product.price is '제품 가격';
comment on column TB_product.brand_name is '브랜드명';
comment on column TB_product.product_type is '제품 타입';
comment on column TB_product.delivery_fee is '배송비';
comment on column TB_product.point_rate is '포인트 적립 비율';
--comment on column TB_product.release_date is '제품 출시일';
comment on column TB_product.state is '판매상태(판매중(Y), 품절(Sold out), 단종(Discontinue))';

--=======================================================

create table TB_prod_img(
    product_ID varchar2(50) constraint fk_prod_img references TB_product(product_ID), 
    original_img varchar2(500),
    renamed_img varchar2(500)
);
--drop table TB_prod_img;

comment on table TB_prod_img is '제품 사진파일';
comment on column TB_prod_img.product_ID is '제품 아이디';
comment on column TB_prod_img.product_img is '제품 사진파일';

--=======================================================

create table TB_prod_option(product_ID varchar2(50) constraint fk_prod_option references TB_product(product_ID), option_name varchar2(100), option_price number, option_img varchar2(500));
--drop table TB_prod_option;

comment on table TB_prod_option is '제품 옵션 테이블';
comment on column TB_prod_option.product_ID is '제품 아이디';
comment on column TB_prod_option.option_name is '옵션명';
comment on column TB_prod_option.option_price is '옵션 선택에 따른 선택요금';
comment on column TB_prod_option.option_img is '옵션 사진파일';

--=======================================================

create table TB_coupon_info(
    coupon_ID varchar2(20) constraint pk_coupon primary key,
    coupon_type char(1) not null constraint chk_coupon_type check(coupon_type in ('A', 'F')),
    expire_date date
);
--drop table TB_coupon;

comment on table TB_coupon_info is '쿠폰 정보 테이블';
comment on column TB_coupon_info.coupon_ID is '쿠폰 아이디';
comment on column TB_coupon_info.coupon_type is '쿠폰 종류(전체 10% 할인"All", 첫결제 할인"First")';
comment on column TB_coupon_info.expire_date is '쿠폰 유효기간';

--=======================================================

create table TB_consumer_info(member_ID varchar2(15) constraint fk_consumer_ID references TB_member_info(member_ID) on delete cascade, point number);
--drop table TB_consumer_info;

comment on table TB_consumer_info is '소비자 정보 테이블';
comment on column TB_consumer_info.member_ID is '회원 아이디';
comment on column TB_consumer_info.point is '가용 포인트';

--=======================================================

create table TB_coupon_list(
    coupon_ID varchar2(20) constraint fk_coupon_ID references TB_coupon_info(coupon_ID) on delete cascade,
    member_ID varchar2(15) constraint fk_coupon_member references TB_member_info(member_ID) on delete cascade,
    expire_date date
);
--drop table TB_coupon_list;

comment on table TB_coupon_list is '발급 쿠폰 테이블';
comment on column TB_coupon_list.coupon_ID is '쿠폰 아이디';
comment on column TB_coupon_list.member_ID is '쿠폰 발급된 회원 아이디';
comment on column TB_coupon_list.expire_date is '쿠폰 유효기간';

--=======================================================

create table TB_wishList(
    wish_no number constraint pk_wish_no primary key,
    member_ID varchar2(15) constraint fk_wishList_member_ID references TB_member_info(member_ID) on delete cascade not null,
    product_ID varchar2(15) constraint fk_wishlist_product_ID references TB_product(product_ID) on delete cascade not null,
    wish_date date default sysdate);
--drop table TB_wishList;

comment on table TB_wishList is '위시리스트(찜한상품) 테이블';
comment on column TB_wishList.wish_no is '위시리스트 번호';
comment on column TB_wishList.member_ID is '회원 아이디';
comment on column TB_wishList.product_ID is '제품 아이디';
comment on column TB_wishList.wish_date is '위시리스트 등록 날짜';

--=======================================================
/*
create table TB_consumer_(member_ID)_basket(
    product_ID varchar2(50) constraint fk_(member_ID)_bk_pid references TB_product(product_ID) on delete cascade,
    product_name varchar2(150),
    product_option varchar2(100),
    price number,
    product_count number,
    ds_option char(1) constraint chk_(member_ID)_ds check(ds_option in ('Y', 'N')),
    basket_date date default sysdate);
*/
create table TB_consumer_admin000_basket(
    product_ID varchar2(50) constraint fk_admin000_bk_pid references TB_product(product_ID) on delete cascade,
    product_name varchar2(150),
    product_option varchar2(100),
    price number,
    product_count number,
    ds_option char(1) constraint chk_admin000_ds check(ds_option in ('Y', 'N')),
    basket_date date default sysdate
);
create table TB_consumer_user000_basket(product_ID varchar2(50) constraint fk_user000_bk_pid references TB_product(product_ID) on delete cascade, product_name varchar2(150), product_option varchar2(100), price number, product_count number, ds_option char(1) constraint chk_user000_ds check(ds_option in ('Y', 'N')), basket_date date default sysdate);
create table TB_consumer_user001_basket(product_ID varchar2(50) constraint fk_user001_bk_pid references TB_product(product_ID) on delete cascade, product_name varchar2(150), product_option varchar2(100), price number, product_count number, ds_option char(1) constraint chk_user001_ds check(ds_option in ('Y', 'N')), basket_date date default sysdate);

--comment on table TB_consumer_(member_ID)_basket is '소비자 장바구니 테이블';
--comment on column TB_consumer_(member_ID)_basket.product_ID is '제품 아이디';
--comment on column TB_consumer_(member_ID)_basket.product_name is '제품명';
--comment on column TB_consumer_(member_ID)_basket.option is '제품 옵션';
--comment on column TB_consumer_(member_ID)_basket.price is '옵션 적용된 제품 가격';
--comment on column TB_consumer_(member_ID)_basket.count is '제품 수량';
--comment on column TB_consumer_(member_ID)_basket.ds_option is '할인 여부';
--comment on column TB_consumer_(member_ID)_basket.basket_date is '장바구니 담은 시간';

--=======================================================

create table TB_orderList(
    order_no number constraint pk_orderList_no primary key,
    member_ID varchar2(15) constraint fk_orderList_member_ID references TB_member_info(member_ID) on delete set null,
    product_ID varchar2(15) not null,
    order_option varchar2(100),
    order_count number not null,
    price number not null,
    order_date date not null
);
--drop table TB_orderList;

comment on table TB_orderList is '상품 주문 테이블';
comment on column TB_orderList.order_no is '주문내역 번호';
comment on column TB_orderList.member_ID is '회원 아이디';
comment on column TB_orderList.product_ID is '제품 아이디';
comment on column TB_orderList.order_option is '제품 옵션';
comment on column TB_orderList.order_count is '제품 수량';
comment on column TB_orderList.price is '결제된 최종 제품 가격';
comment on column TB_orderList.order_date is '주문 시각';

--=======================================================
/*
create table TB_review_(product_ID)(
    product_ID varchar2(50) constraint fk_review_(product_ID) references TB_product(product_ID) on delete cascade,
    product_name varchar2(150),
    review_no number constraint pk_review_(product_ID) primary key,
    reviewer_ID varchar2(15) constraint fk_review_(member_ID) references TB_member_info(member_ID) on delete set null,
    star_point number,
    review_date date,
    review_content varchar2(4000),
    review_img varchar2(500),
    review_recommen number
);
*/

--comment on table TB_review_(product_ID) is '제품 리뷰 테이블';
--comment on column TB_review_(product_ID).product_ID is '제품 아이디';
--comment on column TB_review_(product_ID).product_name is '제품명';
--comment on column TB_review_(product_ID).review_no is '리뷰 번호';
--comment on column TB_review_(product_ID).reviewer_ID is '리뷰 작성자 아이디';
--comment on column TB_review_(product_ID).star_point is '별점';
--comment on column TB_review_(product_ID).review_date is '리뷰 작성 날짜';
--comment on column TB_review_(product_ID).review_content is '리뷰 내용';
--comment on column TB_review_(product_ID).review_img is '리뷰 사진 파일명';
--comment on column TB_review_(product_ID).review_recommen is '리뷰 추천수';

--=======================================================

create table TB_QA(
    QA_no number constraint pk_qa_no primary key,
    product_ID varchar2(50) constraint fk_qa_product_ID references TB_product(product_ID) on delete cascade,
    qtner_ID varchar2(15) constraint fk_qa_member_ID references TB_member_info(member_ID) on delete set null,
    qtn_content varchar2(4000),
    qtn_date date,
    set_secret char(1) constraint chk_qa_secret check(set_secret in ('Y', 'N'))
);
--drop table TB_QA;

comment on table TB_QA is 'QnA 테이블';
comment on column TB_QA.QA_no is 'QnA 번호';
comment on column TB_QA.product_ID is '제품 아이디';
comment on column TB_QA.qtner_ID is 'QnA 질문자 아이디';
comment on column TB_QA.qtn_content is 'QnA 내용';
comment on column TB_QA.qtn_date is 'QnA 작성 날짜';
comment on column TB_QA.set_secret is '비밀글 설정 여부';

--=======================================================

create table TB_event(event_no number constraint pk_event_no primary key, event_title varchar2(150), event_thumb varchar2(500), event_start date, event_end date, event_type char(2), event_content varchar2(3000));
--drop table TB_event;

comment on table TB_event is '이벤트 테이블';
comment on column TB_event.event_no is 'event 번호';
comment on column TB_event.event_title is '이벤트 제목';
comment on column TB_event.event_thumb is '이벤트 썸네일 이미지';
comment on column TB_event.event_start is '이벤트 시작날짜';
comment on column TB_event.event_end is '이벤트 종료날짜';
comment on column TB_event.event_type is '이벤트 참여방식';
comment on column TB_event.event_content is '이벤트 내용';

--=======================================================

create table TB_event_part(
    event_no number constraint fk_event_no references TB_event(event_no) on delete cascade,
    event_part_no number constraint pk_event_part_no primary key,
    event_part_ID varchar2(15) constraint fk_event_member references TB_member_info(member_ID) on delete cascade,
    event_part_content varchar2(3000));
--drop table TB_event_part;

comment on table TB_event_part is '이벤트 참여자 테이블';
comment on column TB_event_part.event_no is 'event 번호';
comment on column TB_event_part.event_part_no is 'event 참여 번호';
comment on column TB_event_part.event_part_ID is '이벤트 참여자 아이디';
comment on column TB_event_part.event_part_content is '이벤트 참여 댓글 내용';

--=======================================================

create sequence seq_appoint_no;
create sequence seq_light_appoint_no;
create sequence seq_adv_review_no;
create sequence seq_report_no;
create sequence seq_wishlist_no;
create sequence seq_order_no;
create sequence seq_QA_no;
create sequence seq_event_no;
create sequence seq_event_part_no;

--create sequence seq_(board_code)_post;
create sequence seq_B1_post;
create sequence seq_B2_post;
create sequence seq_B3_post;
--create sequence seq_(board_code)_reply;
create sequence seq_B1_reply;
create sequence seq_B2_reply;
create sequence seq_B3_reply;
--create sequence seq_review_(product_ID);

--=======================================================

/*
초기값 세팅 초기화
drop trigger delete_reply_B1; drop trigger delete_reply_B2; drop trigger delete_reply_B3;
drop trigger delete_post_B1; drop trigger delete_post_B2; drop trigger delete_post_B3;
drop sequence seq_B1_post; drop sequence seq_B2_post; drop sequence seq_B3_post;
drop sequence seq_B1_reply; drop sequence seq_B2_reply; drop sequence seq_B3_reply;
drop table TB_reply_B1; drop table TB_reply_B2; drop table TB_reply_B3;
drop table TB_post_B1; drop table TB_post_B2; drop table TB_post_B3;
drop table TB_consumer_admin000_basket; drop table TB_consumer_user000_basket; drop table TB_consumer_user001_basket;
drop table TB_menses_admin000; drop table TB_menses_user000; drop table TB_menses_user001;

*/

/*
기본 DB 초기화
drop sequence seq_appoint_no; drop sequence seq_light_appoint_no; drop sequence seq_adv_review_no; drop sequence seq_report_no; drop sequence seq_wishlist_no; drop sequence seq_order_no; drop sequence seq_QA_no; drop sequence seq_event_no; drop sequence seq_event_part_no;
drop trigger member_withdraw;
drop table TB_event_part; drop table TB_event; drop table TB_QA; drop table TB_orderList; drop table TB_wishList; drop table TB_coupon_list; drop table TB_consumer_info; drop table TB_coupon_info; drop table TB_prod_option; drop table TB_prod_img; drop table TB_product; drop table TB_type; drop table TB_seller; drop table TB_report; drop table TB_delete_reply; drop table TB_delete_post; drop table TB_board; drop table TB_adviser_review; drop table TB_appoint_light; drop table TB_appointment; drop table TB_advis_ship; drop table TB_adviser; drop table TB_sex; drop table TB_vaccination; drop table TB_vaccin; drop table TB_child; drop table TB_comp_member; drop table TB_withdraw_member_info; drop table TB_member_info; drop table TB_preg_info; drop table TB_pwd_hint; drop table TB_admin_count;

*/

/*
수동 작동 쿼리문
drop trigger delete_reply_(board_code);
drop trigger delete_post_(board_code);
drop table TB_reply_(board_code);
drop table TB_post_(board_code);
drop table TB_consumer_(member_ID)_basket;
drop table TB_menses_(member_ID);
*/

--=======================================================
/*
GreGre 쿼리문 변경내역
200324.001 TB_member_info grade 등급 추가
200324.002 병원 관련 테이블/컬럼 삭제
*/
--=======================================================



