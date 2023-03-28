--CREATE TABLE Customers(
--[Id] int primary key identity(1,1),
--[Name] nvarchar (10) not null,
--[Surname] nvarchar (20),
--[Age] int
--)

--INSERT INTO Customers VALUES
--('Hesen','Hesenli',20),
--('Nicat','Nicatli',30),
--('Qurban','Qurbanli',45),
--('Qerib','Qeribli',26),
--('Sahin','Sahinli',21),
--('Serxan','Serxanli',19),
--('Ilqar','Ilqarli',23),
--('Tebriz','Tebrizli',18)


--SELECT*FROM Customers

--create view getCustomerById
--as
--select * from Customers where Id=1

--select * from getCustomerById

--create function SayHelloWorld()
--returns nvarchar(50)
--as
--BEGIN
--   return 'Hello World'
--END

--select dbo.SayHelloWorld()



--create function dbo.writeWord(@word nvarchar(20))
--returns nvarchar(50)
--as
--BEGIN
--   return @word
--END

--select dbo.WriteWord('Word')

--create function dbo.writeWord(@word nvarchar(20))
--returns nvarchar(50)
--as
--BEGIN
--   return @word
--END

--declare @word nvarchar(20) = 'P135'

--select dbo.WriteWord(@word)


--create function dbo.WriteWordsWithTwoParametr(@word nvarchar(20),@source nvarchar(20))
--returns nvarchar(50)
--as
--BEGIN
--   return @word + @source
--END


--select dbo.WriteWordsWithTwoParametr('Qerib', 'P135') as 'Data'


--create function dbo.SumOfNumbers(@num1 int,@num2 int)
--returns int
--as
--BEGIN
--   return @num1+@num2
--END

--select dbo.SumOfNumbers(5,10)


----Tablede olan Customerlerin sayi

--create function dbo.getCustomerCount()
--returns int
--as 
--BEGIN
--    declare @count int
--    select @count = COUNT(*) from Customers
--	return @count

--END

--select dbo.getCustomerCount()


----Customorlarin Id-i 3-den boyuk olanlarin   orta yasini goster

--create function dbo.getCustomerAvarageAgeById(@id int)
--returns int
--as 
--BEGIN
--    declare @avgAge int
--    select @avgAge = AVG(Age) from Customers where Id > @id
--	return @avgAge

--END

--select dbo.getCustomerAvarageAgeById(4)

--use Company

--create procedure usp_SayHelloWorld
--as
--BEGIN
--  print 'Hello World'
--END


--usp_SayHelloWorld

--exec usp_SayHelloWorld

--execute usp_SayHelloWorld

--create procedure usp_sumOfNums

--@num1 int,
--@num2 int

--as 
--BEGIN
--   print @num1 + @num2

--END

--exec usp_sumOfNums 5,8

--create procedure usp_addCustomer
--@name nvarchar(50),
--@surname nvarchar(20),
--@age int
--as
--BEGIN
--   insert into Customers([Name],[Surname],[Age])
--   values(@name,@surname,@age)

--END

--exec usp_addCustomer 'Mirze','Beshirzade',27

--exec usp_addCustomer 'Ali','Talibov',21


----Id-ne gore tableden datani silmek.

--create procedure usp_deleteCustomer
--@id int 
--as
--BEGIN
--  delete from Customers where Id = @id
--  END


--  exec usp_deleteCustomer 3

--  SELECT*FROM Customers


--  create procedure usp_deleteCustomerAndShowDatas
--@id int 
--as
--BEGIN
--  delete from Customers where Id = @id
--  select * from Customers
--  END


--  exec usp_deleteCustomerAndShowDatas 9

--  SELECT*FROM Customers





--CREATE TABLE Users(
--[Id] int primary key identity(1,1),
--[Name] nvarchar (10) not null,
--[Surname] nvarchar (20),
--[Age] int,
--[IsDeleted] bit default 'false'
--)

--INSERT INTO Users VALUES
--('Hesen','Hesenli',20,'false'),
--('Nicat','Nicatli',30,'false'),
--('Qurban','Qurbanli',45,'true'),
--('Qerib','Qeribli',26,'false'),
--('Sahin','Sahinli',21,'false'),
--('Serxan','Serxanli',19,'true'),
--('Ilqar','Ilqarli',23,'false'),
--('Tebriz','Tebrizli',18,'true')


--SELECT*FROM Users


--create procedure usp_deleteUsersByIsDeleted
--@id int
--as
--BEGIN
--  update Users set IsDeleted = 'true' where Id = @id
--  select * from Users where IsDeleted = 'false'
--  END

--  exec usp_deleteUsersByIsDeleted 1


--  create procedure usp_searchOperation
--  @text nvarchar (50),
--  @search nvarchar(10)
--  as
--  BEGIN
--    declare @num int
--	SELECT @num = CHARINDEX(@search,@text)

--	if @num > 0
--	    print 'Yes'
-- else
-- print 'No'

-- END
 
-- exec usp_searchOperation 'Azerbaycan' , 'A'



----Trigger

--create table UserLogs(
--[Id] int primary key identity(1,1),
--[UserID] int,
--[Operation] nvarchar (10),
--[Date] datetime

--)

--select*from UserLogs

--create trigger trg_insertUser on Users
--after insert 
--as 
--BEGIN
--   insert into UserLogs([UserID],[Operation],[Date])
--   select Id,'Insert',GETDATE() from inserted
--END

--insert into Users values 
--('Cingiz','Cingizli',19,'false')

--select*from Users

--create procedure usp_insertUser
--@name nvarchar (20),
--@age int
--as
--BEGIN 
--insert into Users ([Name],[Age])
--values (@name,@age)

--END


--exec  usp_insertUser 'Ceyhun',23



--create trigger trg_deletetUser on Users
--after delete 
--as 
--BEGIN
--   insert into UserLogs([UserID],[Operation],[Date])
--   select Id,'Delete',GETDATE() from deleted
--END

--delete from Users where Id = 7


create trigger trg_updatetUser on Users
after update 
as 
BEGIN
   insert into UserLogs([UserID],[Operation],[Date])
   select Id,'Update',GETDATE() from deleted
END


--update Users 
--set [Age] = 30 where Id = 8

--update Users 
--set [Name] = 'Elekber' where Id = 9

select * from UserLogs where UserId = 9