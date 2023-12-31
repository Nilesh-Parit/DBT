/*
DROP TRIGGER IF EXISTS insertStudent;
delimiter $
CREATE TRIGGER insertStudent BEFORE insert ON student_new for each row
BEGIN
	INSERT INTO LOG (curr_date,curr_time,message)VALUES(curdate(),curtime(),"Record Insertion SUCCESSFUL");
END $
delimiter ;


drop trigger if exists insertDuplicate;
delimiter $
CREATE TRIGGER insertDuplicate BEFORE insert on student_new for each row
BEGIN
	insert into student_log VALUES(new.studentid,new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;


drop trigger if exists insertUpdate;
delimiter $
create trigger insertUpdate before update on student_new for each row
BEGIN
	insert into student_log VALUES(old.studentid,new.namefirst,new.namelast,new.dob,new.emailid);
end $
delimiter ;



drop trigger if exists deleteStudent;
delimiter $
create trigger deleteStudent before delete on student_new for each row
BEGIN
	insert into student_log VALUES(old.studentid,old.namefirst,old.namelast,old.dob,old.emailid);
end $
delimiter ;

*/

drop trigger if exists checkInsert;
delimiter $
create trigger checkInsert before insert on student_new for each row
BEGIN
	if dayname(curdate())="Wednesday" then
	signal sqlstate '42000' set message_text="it's sunday";
	end if;
end $
delimiter ;
