drop procedure if exists addUser;
delimiter $
create procedure addUser(username varchar(50),password varchar(50),emailID varchar(50))
BEGIN
	INSERT INTO Login(username,password,emailID)values(username,password,emailID);
	SELECT * FROM Login;
end $
delimiter ;
