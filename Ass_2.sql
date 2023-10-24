/*




drop procedure if EXISTS pro1;
delimiter $
create procedure pro1(in name varchar(10))
BEGIN
	declare x int;
	SET x:=1;
	l1:LOOP
	select substring(name,x,1);
		set x:=x+1;
		if x>length(name)
		then 
		leave l1;
		end if;
	end LOOP l1;
END $
delimiter ;



drop procedure if EXISTS pro1;
delimiter $
create procedure pro1(in name varchar(10))
declare @y;
BEGIN
    declare x int;
	SET @y:="";
	SET x:=1;
	l1:LOOP
	SET @y:=concat(substring(name,x,1),',',@y);
		set x:=x+1;
		if x>length(name)
		then 
		leave l1;
		end if;
	end LOOP l1;
	SELECT @y;
END $
delimiter ;



drop procedure if EXISTS pro1;
delimiter $
create procedure pro1(in name varchar(30))
BEGIN
	declare x int;
	SET x:=1;
	SET @n="";
	SET @c="";
	l1:LOOP
	IF x>length(name)
	THEN
	leave l1;
	end IF;
	if ASCII(substring(name,x,1))>=48 OR ASCII(substring(name,x,1)<=57)
		THEN
		set @n=concat(substring(name,x,1),@n);
		SET x:=x+1;
	ELSE
		set @c=concat(substring(name,x,1),@c);
		SET x:=x+1;
	END IF;
	END LOOP l1;
	SELECT @n "Numbers";
	SELECT @c "Characters";
END $
delimiter ;


drop procedure if EXISTS pro1;
delimiter $
create procedure pro1(st varchar(15))
BEGIN
declare ch varchar(1);
declare n varchar(10);
declare a varchar(10);
declare i int;
set i:=1;
set a:="";
set n:="";

lb:LOOP
if i<=LENGTH(st)then
set ch:=substring(st,i,1);
set i:=i+1;
    if ASCII(ch)>=(48)AND ASCII(ch)<=(57)
then
set n:=concat(ch,n);
   else 
set a:=concat(a,ch);
   end if; 
else 
leave lb;
end if;
end LOOP lb;
select n,a;
end $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(name varchar(30))
BEGIN
declare ch varchar(1);
declare s varchar(20);
declare i int;
set i:=1;
set s:='';
l1:LOOP
set ch:=substring(name,i,1);
	if i=2
	then 
	set s:=concat(s,'(');
	end if;
	if ch=' ' THEN
	set s:=concat(s,") is");
	end if;
	set s:=concat(s,ch);
	set i:=i+1;
if i>LENGTH(name) THEN
leave l1;
end if;
end LOOP l1;
select s;
END $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(name varchar(30))
BEGIN
declare ch varchar(1);
declare s1 varchar(20);
declare s2 varchar(20);
declare i int;
set i:=1;
set s1:='';
set s2:='';
l1:LOOP
set ch:=substring(name,i,1);

IF ASCII(ch)>=65 AND ASCII(ch)<=90  THEN
	set s1:=concat(s1,ch);
	else 
	set s2:=concat(s2,ch);
END IF;
set i:=i+1;
if i>LENGTH(name) THEN
	leave l1;	
end if;
end LOOP l1;
SELECT s1,s2;
END $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(name varchar(20))
BEGIN
declare ch varchar(1);
declare sp,di,vo,i int;
set sp:=0;
set di:=0;
set vo:=0;
set i:=1;
l1:LOOP
	set ch:=substring(name,i,1);
	
		IF ch=" " THEN
		set sp:=sp+1;
		END IF;
		
		IF ch="a" OR ch="e" OR ch="i" OR ch="o" OR ch="u" OR 
		   ch="A" OR ch="E" OR ch="I" OR ch="O" OR ch="U" THEN
		set vo:=vo+1;
		END IF; 
		
	    IF ASCII(ch)>=48 AND ASCII(ch)<=57 THEN
		set di:=di+1;
		END IF; 
		
		set i:=i+1;
		
		IF i>LENGTH(name) THEN
		leave l1;
		END IF;

END LOOP l1;
	SELECT sp "No. of spaces",di "No. of digits",vo "No. of vowels";
END $
delimiter ;


drop procedure if exists pro1;
delimiter $
create procedure pro1(name varchar(30))
BEGIN
declare ch varchar(1);
declare s1 varchar(30);
declare i int;
SET i:=0;
SET s1:="";
l1:LOOP
	SET ch:=substring(name,i,1);
	IF ASCII(ch)>=65 AND ASCII(ch)<=90 OR ASCII(ch)>=97 AND ASCII(ch)<=120 THEN
	SET s1:=concat(s1,ch);
	END IF;
	set i:=i+1;
	IF i>LENGTH(name) THEN
	leave l1;
	end if;
END LOOP l1;
SELECT s1;
END $
delimiter ;



drop procedure if EXISTS pro1;
delimiter $
create procedure pro1(_date date, _day varchar(15))
BEGIN
declare dd date;
SET dd:=_date;
	l1:LOOP
		IF DAYNAME(dd)=_day THEN
		leave l1;
		ELSE
		SET dd = dd + INTERVAL 1 DAY; 
		END IF;
	END LOOP l1;
SELECT dd;	
END $
delimiter ;



drop procedure if exists pro1;
delimiter $
create procedure pro1(d1 date,d2 date)
BEGIN
	declare n int;
	declare d date;
	SET d:=d1;
	SET n:=0;
		l1:LOOP              
		
			IF DAYNAME(d)="Sunday" THEN
				SET n:=n+1;
			END IF;
			SET d:= d + INTERVAL 1 DAY; 
			
			IF d=d2 THEN
				leave l1;
			END IF;
			
		END LOOP l1;
	SELECT n AS "Sunday Count";
END $
delimiter ;

*/

drop procedure if EXISTS pro1;
delimiter $
create procedure pro1( in _num int)
BEGIN
	declare digit,sum1,num int;
	SET digit:=0;
	SET sum1:=0;
	SET num:=_num;
	
	l1:LOOP
		SET digit := num % 10;
		SET num := num / 10;
		SET sum1 := sum1 + digit;
		
		IF num = 0 THEN
		leave l1;
		END IF;
		
	END LOOP l1;
	SELECT sum1;
END $
delimiter ;