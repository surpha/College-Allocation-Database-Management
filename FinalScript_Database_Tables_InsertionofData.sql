-- creating schema

create schema `collegeallotment_dbmsproject`;


use collegeallotment_dbmsproject;

-- creating user table

create table IF NOT EXISTS user(
uID VARCHAR(45) NOT NULL ,
email VARCHAR(45) NOT NULL,
pwd VARCHAR(45) NOT NULL,
accessLevel INT UNSIGNED NOT NULL,
PRIMARY KEY (uID)
);
  
-- creating student entity table

create table IF NOT EXISTS student(
uID VARCHAR(45) NOT NULL ,
sName VARCHAR(45) NOT NULL,
marks INT NOT NULL DEFAULT 0,
PRIMARY KEY (uID)
);

-- creating collegeadmin table

create table IF NOT EXISTS collegeadmin(
uID VARCHAR(45) NOT NULL ,
collegeName VARCHAR(45) NOT NULL,
collegeAddress TEXT(1000) NOT NULL,
collegeContactEmail VARCHAR(45) NOT NULL,
PRIMARY KEY (uID)
);

-- creating courses table

CREATE TABLE IF NOT EXISTS `collegeallotment_dbmsproject`.`courses` (
  `courseID` INT NOT NULL,
  `courseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`courseID`));
  
-- creating student_preferences table

CREATE TABLE IF NOT EXISTS `collegeallotment_dbmsproject`.`student_preferences` (
  `student_uID` VARCHAR(45) NOT NULL,
  `courseID` INT NOT NULL,
  `collegeadmin_uID` VARCHAR(45) NOT NULL,
  `preferenceNo` INT NOT NULL,
  PRIMARY KEY (`student_uID`, `courseID`,`collegeadmin_uID`),
  -- FOREIGN KEY (`student_uID`) REFERENCES `student` (`uID`),
  FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`)
  -- FOREIGN KEY (`collegeadmin_uID`) REFERENCES `collegeadmin` (`uID`)
);

-- creating courses_offered table

CREATE TABLE IF NOT EXISTS `courses_offered` (
  `collegeadmin_uID` VARCHAR(45) NOT NULL,
  `courseID` INT NOT NULL,
  `coursecapacity` INT NOT NULL,
  PRIMARY KEY (`collegeadmin_uID`, `courseID`)
  -- FOREIGN KEY (`collegeadmin_uID`) REFERENCES `collegeadmin`(`uID`) ON DELETE CASCADE,
 --  FOREIGN KEY (`courseID`) REFERENCES `courses`(`courseID`) -- 
);

-- adding coursecapacity to courses_offered table
ALTER TABLE courses_offered
ADD COLUMN cutOff INT NOT NULL DEFAULT 100 AFTER coursecapacity;

-- creating allocated table

CREATE TABLE allocated (
  `student_uID` VARCHAR(45) NOT NULL,
  `courseID` INT NOT NULL,
  `collegeadmin_uID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_uID`),
  FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`),
  FOREIGN KEY (`collegeadmin_uID`) REFERENCES `collegeadmin` (`uID`)
);

-- inserting values into students

INSERT INTO student VALUES 
(15451, 'Suraj', 269),
(15231, 'Ria', 271),
(15415, 'Kuhoo', 289),
(15670, 'Karan', 204),
(15444, 'Maanya', 234),
(14644, 'Kartik', 249),
(15342, 'Ayush', 278),
(14323, 'Parth', 255),
(16743, 'Vedant', 278),
(18934, 'Agniva', 201),
(15405, 'Aayush', 210),
(12452, 'Divya', 275),
(15232, 'Priya', 284),
(15416, 'Rohit', 263),
(15671, 'Neha', 225),
(15445, 'Rishi', 260),
(14645, 'Shreya', 272),
(15343, 'Sachin', 282),
(14324, 'Tanvi', 267),
(16744, 'Vivek', 291),
(18935, 'Amit', 190),
(15406, 'Alok', 285),
(12453, 'Naman', 254),
(15233, 'Radha', 279),
(15417, 'Pranav', 192),
(15672, 'Riya', 293),
(15446, 'Rajat', 197),
(14646, 'Saurabh', 225),
(15344, 'Tarun', 296),
(14325, 'Shivani', 282),
(16745, 'Yash', 243),
(18936, 'Aakash', 280),
(15407, 'Anjali', 248),
(12454, 'Sarika', 279),
(15234, 'Sahil', 219),
(15418, 'Swati', 226),
(15673, 'Sakshi', 258),
(15447, 'Varun', 189),
(14647, 'Ankita', 274),
(15345, 'Uday', 198),
(14326, 'Shubham', 251),
(16746, 'Zoya', 268),
(18937, 'Arjun', 281),
(15408, 'Arun', 270),
(12455, 'Divyansh', 273),
(15235, 'Preeti', 193),
(15419, 'Shubhankar', 239),
(15674, 'Shaili', 281),
(15448, 'Nehal', 230),
(14648, 'Kavita', 201),
(15346, 'Pooja', 255),
(14327, 'Siddharth', 291),
(16747, 'Himanshu', 289),
(18938, 'Harsh', 277),
(15409, 'Deepak', 259),
(12456, 'Aryan', 290),
(15236, 'Gaurav', 252),
(15420, 'Yogesh', 189),
(15675, 'Mukul', 232),
(15449, 'Riya', 294),
(14649, 'Rajesh', 201),
(15347, 'Ankur', 281),
(14328, 'Anjana', 272),
(16748, 'Kunal', 246);


INSERT INTO courses VALUES 
(1, 'Civil'),
(2, 'Chemical'),
(3, 'EEE'),
(4, 'ECE'),
(5, 'ENI'),
(6, 'Pharma'),
(7, 'CSE'),
(8, 'Mechanical'),
(9, 'Manufacturing');

-- inserting values into collegeadmin

INSERT INTO collegeadmin VALUES 
(0001, 'BITS Pilani, Pilani', 'Vidyavihar, Pilani - 333031', 'admin@pilani.bits-pilani.ac.in'),
(0002, 'BITS Pilani, Goa', 'Goa', 'admin@goa.bits-pilani.ac.in'),
(0003, 'BITS Pilani, Hyderabad', 'Hyderabad', 'admin@hyderabad.bits-pilani.ac.in'),
(0004, 'IIT Bombay', 'Mumbai', 'admin@bombay.iit.ac.in'),
(0005, 'IIT Delhi', 'Delhi', 'admin@delhi.iit.ac.in'),
(0006, 'IIT Kanpur', 'Kanpur', 'admin@kanpur.iit.ac.in'),
(0007, 'IIT Guwahati', 'Guwahati', 'admin@guwahati.iit.ac.in'),
(0008, 'IIT Madras', 'Madras', 'admin@madras.iit.ac.in'),
(0009, 'IIT Roorkee', 'Roorkee', 'admin@roorkee.iit.ac.in');

-- inserting values into courses_offered

INSERT INTO courses_offered (collegeadmin_uID, courseID, courseCapacity) VALUES
(0001, 1, 80),
(0001, 2, 75),
(0001, 3, 90),
(0001, 4, 100),
(0001, 5, 60),
(0001, 6, 70),
(0001, 7, 85),
(0001, 8, 95),
(0002, 1, 85),
(0002, 3, 75),
(0002, 5, 90),
(0002, 6, 80),
(0002, 7, 70),
(0002, 8, 95),
(0002, 9, 60),
(0003, 1, 70),
(0003, 2, 85),
(0003, 3, 90),
(0003, 4, 75),
(0003, 6, 80),
(0003, 7, 95),
(0003, 8, 70),
(0004, 1, 90),
(0004, 2, 80),
(0004, 3, 70),
(0004, 4, 95),
(0004, 5, 75),
(0004, 7, 85),
(0004, 8, 90),
(0004, 9, 60),
(0005, 1, 80),
(0005, 2, 70),
(0005, 4, 90),
(0005, 5, 95),
(0005, 6, 75),
(0005, 7, 85),
(0005, 8, 80),
(0006, 1, 90),
(0006, 2, 75),
(0006, 4, 85),
(0006, 5, 70),
(0006, 6, 95),
(0006, 7, 80),
(0006, 9, 60),
(0007, 1, 75),
(0007, 3, 85),
(0007, 5, 90),
(0007, 7, 95),
(0007, 8, 70),
(0007, 9, 80),
(0008, 1, 85),
(0008, 2, 90),
(0008, 3, 75),
(0008, 4, 80),
(0008, 5, 70),
(0008, 6, 95),
(0008, 7, 85),
(0008, 8, 90),
(0009, 1, 70),
(0009, 2, 85),
(0009, 3, 95),
(0009, 4, 75),
(0009, 5, 80),
(0009, 6, 90),
(0009, 9, 60);

-- inserting values into student_preferences

INSERT INTO student_preferences (student_uID, collegeadmin_uID, courseID, preferenceNo)
VALUES 
(15451, 3, 7, 3),
(15451, 2, 6, 2),
(15451, 1, 1, 1),
(15451, 5, 9, 5),
(15451, 4, 8, 4),
(15231, 8, 2, 2),
(15231, 6, 5, 3),
(15231, 9, 1, 1),
(15231, 7, 7, 4),
(15231, 3, 3, 5),
(15415, 1, 9, 2),
(15415, 7, 6, 5),
(15415, 4, 4, 4),
(15415, 5, 8, 3),
(15415, 2, 2, 1),
(15670, 4, 1, 4),
(15670, 5, 2, 5),
(15670, 8, 8, 1),
(15670, 6, 3, 3),
(15670, 7, 9, 2),
(15444, 9, 6, 2),
(15444, 8, 1, 1),
(15444, 7, 8, 5),
(15444, 3, 3, 3),
(15444, 1, 4, 4),
(14644, 6, 7, 2),
(14644, 1, 1, 1),
(14644, 8, 4, 4),
(14644, 2, 5, 3),
(14644, 9, 9, 5),
(15342, 3, 2, 1),
(15342, 4, 4, 4),
(15342, 5, 7, 3),
(15342, 6, 8, 2),
(15342, 9, 1, 5),
(14323, 8, 6, 1),
(14323, 9, 9, 5),
(14323, 2, 2, 2),
(14323, 1, 7, 3),
(14323, 3, 3, 4),
(16743, 5, 8, 5),
(16743, 9, 9, 1),
(16743, 1, 2, 2),
(16743, 6, 5, 3),
(16743, 3, 7, 4),
(18934, 7, 5, 3),
(18934, 1, 4, 4),
(18934, 6, 3, 2),
(18934, 2, 9, 1),
(18934, 8, 8, 5),
(15405, 4, 1, 1),
(15405, 2, 2, 2),
(15405, 6, 6, 4),
(15405, 9, 7, 5),
(15405, 8, 3, 3);

