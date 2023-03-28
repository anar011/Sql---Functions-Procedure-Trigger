CREATE TABLE Students(
[Id] int primary key identity(1,1),
[Name] nvarchar (10) not null,
[Surname] nvarchar (20),
[Age] int,
[Email] nvarchar(20) unique,
[Address] nvarchar(20) 
)

INSERT INTO Students VALUES
('Hesen','Hesenli',20,'hesen@gmail.com','Ehmedli'),
('Nicat','Nicatli',30,'nicat@gmail.com','Xirdalan'),
('Qurban','Qurbanli',45,'qurban@gmail.com','Xalqlar'),
('Qerib','Qeribli',26,'qerib@gmail.com','Razin'),
('Sahin','Sahinli',21,'sahin@gmail.com','Sumqayit'),
('Serxan','Serxanli',19,'serxan@gmail.com','Bayil'),
('Ilqar','Ilqarli',23,'ilqar@gmail.com','Ehmedli'),
('Tebriz','Tebrizli',18,'tebriz@gmail.com','Nizami')


select* from Students



create table StudentArchives(
[Id] int primary key identity(1,1),
[StudentID] int,
[Operation] nvarchar(10),
[Date] datetime

)
select * from StudentArchives



create procedure usp_deleteStudent
@id int
as 
BEGIN 
  delete from Students where Id = @id
END

exec usp_deleteStudent 4





create trigger trg_deleteStudents on Students
after delete 
as 
BEGIN 
  insert into StudentArchives([StudentID],[Operation],[Date])
  select Id,'Delete',GETDATE() from deleted
END

delete from Students where Id = 3


