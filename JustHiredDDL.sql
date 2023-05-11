create database JustHiredDB;
use JustHiredDB;

create table Role(
	roleID int auto_increment,
    role varchar(50),
	primary key (roleID)
) 
engine=InnoDB;

create table JHUser(
userID int auto_increment,
username varchar(50),
password varchar(50),
roleID int,
name varchar(50),
isEnabled boolean,
accessGranted varchar(50),
primary key (userID),
foreign key (roleID) references Role(roleID)
)
engine=InnoDB;

ALTER Table JHUser auto_increment=50;

create table Job(
jobID int auto_increment,
userID int, 
jobTitle varchar(50),
company varchar(50),
jobType varchar(50),
location varchar(50),
jobIndustry varchar(50),
jobDescription varchar(50),
jobPostedDate Date,
primary key(jobID),
foreign key (userID) references JHUser(userID)
)
engine=InnoDB;

Alter table Job auto_increment=100;

create table Application(
applicationID int auto_increment,
resume varchar(100),
coverLetter blob, 
linkedInUrl varchar(50),
userID int, 
jobID int, 
primary key (applicationID),
foreign key (jobID) references Job(jobID),
foreign key (userID) references JHUser(userID)
)
engine=InnoDB;

Alter table Application auto_increment=5;

select * from JHUser;
Select * from Role;
select * from application;
select * from job;

