use wtprojectdb;

create table credential (
username varchar(50) not null unique, 
password varchar(50), 
userRole varchar(50), 
primary key (username)
) 
engine=InnoDB;

create table hibernate_sequence (next_val bigint) engine=InnoDB;

insert into hibernate_sequence values (1);
insert into hibernate_sequence values (1);
insert into hibernate_sequence values (1);

create table jobcategory (
jobCategoryID int auto_increment, 
jobCategory varchar(50), 
primary key (jobCategoryID)
) 
engine=InnoDB;


create table Recruiter (
recruiterID int auto_increment, 
name varchar(50), 
email varchar(50) not null unique, 
phone bigint, 
company varchar(50), 
jobtitle varchar(255), 
credential_username varchar(255), 
primary key (recruiterID),
foreign key (credential_username) references credential(username)
) 
engine=InnoDB;

ALTER TABLE Recruiter auto_increment=50;

create table Job (
jobID int auto_increment, 
jobTitle varchar(50),
location varchar(50),
company varchar(50),
jobCategoryID int,
jobdescription varchar(200), 
job_status varchar(50),
salary float,
recruiterID int,
emp_type varchar(50), 
primary key (jobID),
foreign key (recruiterID) references recruiter(recruiterID),
foreign key(jobCategoryID) references jobcategory(jobCategoryID)
) 
engine=InnoDB;

ALTER TABLE Job auto_increment=100;

create table jobseeker(
jobSeekerID int auto_increment,
name varchar(50),
credential_username varchar(50),
email varchar(50) unique,
phone bigint,
linkedinurl varchar(50),
jobCategoryID int,
address varchar(50),

primary key (jobSeekerID),
foreign key (credential_username) references credential(username),
foreign key(jobCategoryID) references jobcategory(jobCategoryID)
)
engine=InnoDB;

ALTER TABLE jobseeker auto_increment=150;


create table application(
applicationID int auto_increment,
jobID int,
jobSeekerID int,
dateofapplication date,
jobTitle varchar(50),
company varchar(50),
resumepath varchar(50),
coverletterpath varchar(50),
primary key(applicationID),
foreign key (jobID) references Job(jobID),
foreign key (jobSeekerID) references JobSeeker(jobSeekerID)
)
engine=InnoDB;

ALTER Table application auto_increment = 200;







select * from credential;
select * from hibernate_sequence;
select * from jobcategory;
select * from recruiter;
select * from job;
select * from application;
select * from jobseeker;
