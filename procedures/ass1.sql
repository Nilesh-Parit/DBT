/*
drop procedure if exists addUser;
delimiter $
create procedure addUser(username varchar(50),password varchar(50),emailID varchar(50))
BEGIN
	INSERT INTO Login(username,password,emailID)values(username,password,emailID);
	SELECT * FROM Login;
end $
delimiter ;



drop procedure if exists checkUser;
delimiter $
create procedure checkUser(_emailID varchar(50))
BEGIN
declare x boolean;
SELECT true into x FROM Login WHERE emailID=_emailID;
IF(x=true)
THEN
SELECT username,password,emailID FROM Login WHERE emailID=_emailID;
ELSE
INSERT INTO LOG(curr_date,curr_time,message)VALUES(curdate(),curtime(),"Email ID not Found");
TABLE LOG;
END IF;
END $ 
delimiter ;



drop procedure if EXISTS getQualification;
delimiter $
create procedure getQualification(_ID int)
BEGIN
declare x boolean;
SELECT true into x FROM student WHERE ID=_ID;
IF(x=true)
THEN
SELECT * FROM student s,student_qualifications WHERE s.ID=studentID AND s.ID=_ID;
ELSE
SELECT "Student Not found" Message;
END IF;
END $
delimiter ;



drop procedure if exists addStudent;
delimiter $
create procedure addStudent(namefirst varchar(10),namelast varchar(10),DOB date,emailID varchar(30),number varchar(10),isActive boolean,address varchar(50))
BEGIN
	declare x,y,z int;
	SELECT max(ID)+1 INTO x FROM student;
	SELECT max(ID)+1 INTO y FROM student_phone;
	SELECT max(ID)+1 INTO z FROM student_address;
	INSERT INTO student(ID,namefirst,namelast,DOB,emailID)VALUES(x,namefirst,namelast,DOB,emailID);
	INSERT INTO student_phone(ID,studentID,number,isActive)VALUES(y,x,number,isActive);
	INSERT INTO student_address(ID,studentID,address)VALUES(z,x,address);
	SELECT * FROM student s JOIN student_phone sp JOIN student_address sa ON s.ID=sp.studentID AND s.ID=sa.studentID WHERE s.ID=x;
END $
delimiter ;

*/


drop procedure if exists addQualification;
delimiter $
create procedure addQualification(_ID int,name varchar(20),college varchar(30),university varchar(30),marks varchar(30),year int)
BEGIN
	declare x BOOLEAN;
	declare y int;
	SELECT true INTO x FROM student WHERE ID=_ID;
	SELECT max(ID)+1 INTO y FROM student_qualifications;
		IF(x=true)
		THEN
		INSERT INTO student_qualifications (ID, studentID, name, college, university, marks, year) VALUES (y,_ID,name,college,university,marks,year);
		SELECT "Record Inserted" Message;
		SELECT * FROM student_qualifications WHERE studentID=_ID;
		ELSE
		SELECT "Student Not found " message;
		END IF;
END $
delimiter ;
