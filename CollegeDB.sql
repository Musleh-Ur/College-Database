create database collegeDB

--Q1
On
(Name='CollegeDB_Data_01.mdf',
FileName='E:\C# 1274023\CollegeDB_Data_01.mdf',
Size=25mb,
MaxSize=100mb,
Filegrowth=5%
)
Log On
(
Name='CollegeDB_Log_01.ldf',
FileName='E:\C# 1274023\CollegeDB_Log_01.ldf',
Size=2mb,
MaxSize=25mb,
Filegrowth=1%
)

use CollegeDB

Create table Teachers
(
TeacherID int primary key,
TeacherName varchar(30)
);

Create table Students
(
StudentID int primary key,
StudentName varchar(30)
);

Create table Semester
(
SemesterID int primary key,
SemesterName varchar(30)
);

Create table Subjects
(
SubjectID int primary key,
SubjectName varchar(30)
);

Create table Relation
(
TeacherID int references Teachers(TeacherID),
StudentID int references Students(StudentID),
SemesterID int references Semester(SemesterID),
SubjectID int references Subjects(SubjectID)
);

insert into Teachers values(1,'A'),
                           (2,'B'),
						   (3,'C'),
						   (4,'A')

insert into Students values(1,'AA'),
                           (2,'EE'),
						   (3,'II'),
						   (4,'EE')

insert into Semester values(1,'Spring'),
                           (2,'Summer'),
						   (3,'Fall'),
						   (4,'Winter')

insert into Subjects values(1,'C#'),
                           (2,'Data Base'),
						   (3,'Web Design'),
						   (4,'Data Minning');

insert into relation values(1,1,1,1),
                           (2,2,1,2),
						   (3,3,1,3),
						   (4,4,2,4);

---Q.2(a)
Select Students.StudentID,Students.StudentName,Teachers.TeacherName,Semester.SemesterName,Subjects.SubjectName from Relation
join Students on Students.StudentID=Relation.StudentID
join Teachers on Teachers.TeacherID=Relation.TeacherID
join Semester on Semester.SemesterID=Relation.SemesterID
join Subjects on Semester.SemesterID=Relation.SemesterID
group by Students.StudentID,Students.StudentName,Teachers.TeacherName,Semester.SemesterName,Subjects.SubjectName
having SubjectName='C#';

---Q.3(C)

Select SemesterName,
Case
When SemesterName='Spring' then 'Cold'
When SemesterName ='Summer' then 'Hot'
else 'Rainy'
end as comments
from relation
join Semester on Relation.SemesterID=semester.SemesterID

---Q.2(B)

Select distinct Students.StudentName, StudentQuery.NoOfSubject
from Students,
(select count(Relation.SubjectID) as [NoOfSubject]
from Relation
join Students on Relation.StudentID=Students.StudentID
group by Students.StudentName,Relation.StudentID) as StudentQuery

---Q.2(D)
select cast('20-June-2019' as date)

---Q.2(E)
select datetime = CONVERT(datetime,'01-june-2019 10:00:10:00')