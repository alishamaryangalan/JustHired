drop schema wtprojectdb;

create schema wtprojectdb;
use wtprojectdb;



create table user_roles(
	user_role_id int auto_increment,
    role varchar(50),
    
	primary key (user_role_id)
) 
engine=InnoDB;


create table User(
userId int auto_increment,
username varchar(50),
password varchar(50),
user_role_id int,
firstName varchar(50),
lastName varchar(50),
enable boolean,
isAllowedAccess varchar(50),

primary key (userID),
foreign key (user_role_id) references user_roles(user_role_id)
)
engine=InnoDB;


ALTER Table User auto_increment=50;



create table JobDetails(
jobId int auto_increment,
userid int, 
title varchar(50),
companyName varchar(50),
typeOfJob varchar(50),
country varchar(50),
state varchar(50),
industry varchar(50),
major varchar(50),
minGpa float,
jobUrl varchar(50),
description varchar(50),
postedOn Date,


primary key(jobId),
foreign key (userid) references User(userId)
)
engine=InnoDB;


Alter table JobDetails auto_increment=100;


create table JobApplication(
appId int auto_increment,
resumePath varchar(50),
coverLetterPath varchar(50),
userid int, 
jobId int, 

primary key (appId),
foreign key (jobId) references JobDetails(jobId)

)
engine=InnoDB;

Alter table JobApplication auto_increment=5;

drop user root@localhost;

CREATE USER 'root'@'localhost' IDENTIFIED BY 'Justgowithit@123';
GRANT ALL ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

SET GLOBAL time_zone = '+3:00';
SHOW GRANTS FOR 'root'@'localhost';


ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Justgowithit@123';
FLUSH PRIVILEGES;


update user set authentication_string=password('Justgowithit@123') where user='root';



select * from user;
select * from jobdetails;
