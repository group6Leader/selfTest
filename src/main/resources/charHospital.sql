drop table customer cascade constraints;
drop table role cascade constraints;
drop table board cascade constraints;
drop table healthrecord cascade constraints;
drop table reservation cascade constraints;
drop table prescription cascade constraints;
drop sequence cust_Num_sequence;
drop sequence board_Num_sequence;
drop sequence dia_Num_sequence;
drop sequence res_Num_sequence;
drop sequence pre_Num_sequence;
drop sequence selfTest_Num_sequence;

create table role (
	cust_Id		number		primary key
	, role_Name		varchar2(20)		not null
	, enable		number	default 0	
);

create table customer (
    cust_Num		number		primary key
    , cust_Id    varchar2(20)   not null		unique
    , cust_Name     varchar2(20)        not null
    , cust_Pw		varchar2(20)		not null
    , cust_Sex		varchar2(3)		not null
    , cust_Birth		varchar2(20)		not null
    , cust_Address		varchar2(100)		not null
    , cust_Phone		varchar2(20)		not null
    , cust_Email		varchar2(50)   
    , cust_Major		varchar2(30)
    , original_File		varchar2(30)
    , saved_File		varchar2(30)
    , emailverify		char(1)		default 'N'
    , constraint  fk_role_Id foreign key (role_Id) references role (role_Id)
);
  
create table board (
	board_Num		number		primary key
	, board_Title			varchar2(50)		not null
	, hos_Name		varchar2(50)		not null
	, content		varchar2(500)		not null
	, input_Date		date		default sysdate
	, hits		number
	, score		number
	, original_File		varchar(30)
	, saved_File		varchar2(30)
	, cust_Num		number 		not null
	, constraint  fk_board_cust_Num foreign key (cust_Num) references customer (cust_Num)
);
    
create table healthrecord(
	dia_Num		varchar2(20)		primary key
	, dis_Name		varchar2(100)			not null
	, final_Diagnosis		varchar2(300)
	, dis_Category		varchar2(20)		not null
	, first_Date		date	default sysdate		
	, dia_Date		date		default	sysdate		
	, care_Opinions		varchar2(500)
	, ect		varchar2(100)
	, usage		varchar2(30)
	, issue_Date		date		default	sysdate		
	, hos_Name		varchar2(50)		not null	
	, hos_Address		varchar2(50)		not null
	, hos_Phone		varchar2(50)		not null
	, cust_Num		number		not null
	, constraint  fk_hr_cust_Num foreign key (cust_Num) references customer (cust_Num)
);

create table reservation(
	res_Num		number		primary key
	, res_Date		date		not null
	, res_Hos		varchar2(20)		not null
	, cust_Num		number		not null
	, constraint  fk_res_cust_Num foreign key (cust_Num) references customer (cust_Num)
);

create table prescription(
	pre_Num		varchar2(20)		primary key
	, med_Name		varchar2(50)		not null
	, med_Amount		number		not null
	, med_Count		number		not null
	, med_Content		varchar2(200)		not null
	, cust_Num		number		not null
	, constraint  fk_pre_cust_Num foreign key (cust_Num) references customer (cust_Num)
);

create table selftest(
	selftest_Num		number		primary key
	, blood_Pressure		number		
	, smoking		varchar2(20)		
	, drinking		varchar2(20)		
	, diabetes		varchar2(20)		
	, surgery		varchar2(50)		
	, disability		varchar2(50)		
	, pain				varchar2(300)		
	, symptom		varchar2(500)		
	, outbreak_Day		date			default sysdate
	, medicine		varchar2(100)		
	, allergy			varchar2(50)		
	, overseas_Visist		varchar2(50)		
	, sleep_Time		varchar2(20)		
	, stress		varchar2(50)		
	, family_History		varchar2(100)		
	, pregnant		varchar2(50)
	, selftest_Date		date		default sysdate
	, cust_Num		number		not null
	, constraint  fk_selftest_cust_Num foreign key (cust_Num) references customer (cust_Num)
);


create sequence cust_Num_sequence start with 1 increment by 1;
create sequence board_Num_sequence start with 1 increment by 1;
create sequence dia_Num_sequence start with 1 increment by 1;
create sequence res_Num_sequence start with 1 increment by 1;
create sequence pre_Num_sequence start with 1 increment by 1;
create sequence selfTest_Num_sequence start with 1 increment by 1;

