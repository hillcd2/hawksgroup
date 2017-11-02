use hawks

GO 
CREATE TABLE Project
(
	projectID int NOT NULL,
	projectName VARCHAR(20),
	major VARCHAR(20),
	GPA int, 
	size int,
	descr VARCHAR(20),
	primary key (projectID)
);

GO
CREATE TABLE Student  
(
	studentID int NOT NULL,
	major VARCHAR(20),
	GPA int, 
	interests VARCHAR(20),
	primary key (studentID)
);

GO
CREATE TABLE Advisor 
(
	advisorID int NOT NULL,
	advisorName VARCHAR(20),
	primary key (advisorID)
);

GO CREATE TABLE Time_Slot(
	schedtime int
);

GO CREATE TABLE Student_In_Time_Slot(
	schedtime int
	--
);

