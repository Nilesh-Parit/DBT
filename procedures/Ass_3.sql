/*
DROP FUNCTION IF EXISTS sumSalary;
delimiter $
create function sumSalary(_deptno int) RETURNS int
DETERMINISTIC
BEGIN
	SET @x = 0;
	SELECT SUM(sal) INTO @x FROM emp WHERE DEPTNO=_deptno;
	return @x;
END $
delimiter ;


DROP FUNCTION IF EXISTS autoNumber;
delimiter $
CREATE FUNCTION autoNumber() RETURNS int
DETERMINISTIC
BEGIN
	SET @x = 0;
	SELECT MAX(studentID)+1 INTO @x FROM student_new;
	return @x;
END $
delimiter ;


DROP FUNCTION IF EXISTS checkEmail;
delimiter $
CREATE FUNCTION checkEmail(email varchar(40))RETURNS varchar(40)
DETERMINISTIC
BEGIN
	DECLARE n BOOLEAN;
	SET @x:="";
	SET n:=0;
	SELECT true INTO n FROM LOGIN WHERE emailID=email;
		IF n=true THEN
		SELECT concat(username," ",password) INTO @x FROM LOGIN WHERE emailID=email;
		ELSE
		SET @x:="Employee not exists";
		END IF;
	return @x;
END $
delimiter ;



DROP FUNCTION IF EXISTS sumMarks;
delimiter $
CREATE FUNCTION sumMarks(_ID int) RETURNS int
DETERMINISTIC
BEGIN
	SET @sum1:=0;
	SELECT SUM(marks) INTO @sum1 FROM student_qualifications WHERE studentID=_ID AND name in("10","12","BE");
	return @sum1;
END $
delimiter ;

*/

DROP FUNCTION IF EXISTS randNum;
delimiter $
CREATE FUNCTION randNum()returns varchar(10)
DETERMINISTIC
BEGIN
	SET @x:="";
	SELECT floor(rand()*1000000) INTO @x;
	return @x;
END $
delimiter ;