create table IF NOT EXISTS student(
studentID INT UNSIGNED NOT NULL ,
sName VARCHAR(45) NOT NULL,
marks INT NOT NULL DEFAULT 0,
PRIMARY KEY (studentID)
);

show tables;

create table IF NOT EXISTS collegeadmin(
collegeID INT UNSIGNED NOT NULL ,
collegeName VARCHAR(45) NOT NULL,
collegeAddress TEXT(1000) NOT NULL,
collegeContactEmail VARCHAR(45) NOT NULL,
PRIMARY KEY (collegeID)
);

show tables;

CREATE TABLE IF NOT EXISTS `collegeallotment_dbmsproject`.`courses` (
  `courseID` INT NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`courseID`));
  
create table IF NOT EXISTS user(
uID INT UNSIGNED NOT NULL ,
email VARCHAR(45) NOT NULL,
pwd VARCHAR(45) NOT NULL,
accessLevel INT UNSIGNED NOT NULL,
PRIMARY KEY (uID)
);
  
show tables;

select * from student;

ALTER TABLE student
ADD COLUMN collegeAllocated BINARY NOT NULL DEFAULT 0;

select * from student;