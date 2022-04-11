CREATE TABLE department (
	dept_name VARCHAR(20),
	building VARCHAR(15),
	budget INT,
	PRIMARY KEY(dept_name)
);
CREATE TABLE instructor(
	id	VARCHAR(5),
	name	VARCHAR(20) NOT NULL,
	dept_name	VARCHAR(20),
	salary	INT,
	PRIMARY KEY(id)
);
CREATE TABLE student(
	id	VARCHAR(5),
	name	VARCHAR(20) NOT NULL,
	dept_name	VARCHAR(20),
	tot_cred	INT,
	PRIMARY KEY(id)
);
//department 테이블 데이터 삽입
INSERT INTO department
VALUES ('Comp.sci.', 'Taylor', 100000)

INSERT INTO department
VALUES ('Biology', 'watson', 90000)

INSERT INTO department
VALUES ('Elec.Eng.', 'Taylor', 85000)

INSERT INTO department
VALUES ('Music', 'Packard', 80000)

INSERT INTO department
VALUES ('Finance', 'Painter', 120000)

INSERT INTO department
VALUES ('History', 'Painter', 50000)

INSERT INTO department
VALUES ('Physics', 'watson', 70000)

//instructor 데이터 삽입
INSERT INTO instructor
VALUES (22222,'Einstein', 'Physics', 95000)

INSERT INTO instructor
VALUES (12121,'Wu', 'Finance', 90000)

INSERT INTO instructor
VALUES (32343,'El Said', 'History', 60000)

INSERT INTO instructor
VALUES (45565,'Katz', 'Comp.Sci.', 75000)

INSERT INTO instructor
VALUES (98345,'Kim', 'Elec.Eng.', 80000)

INSERT INTO instructor
VALUES (76766,'Crick', 'Biology', 72000)

INSERT INTO instructor
VALUES (10101,'Srinivasan', 'Comp.Sci.', 65000)

INSERT INTO instructor
VALUES (58583,'Clifieri', 'History', 92000)

INSERT INTO instructor
VALUES (15151,'Mozrt', 'Music', 40000)

INSERT INTO instructor
VALUES (33456,'Gold', 'physics', 87000)

INSERT INTO instructor
VALUES (76543,'Singh', 'Finance', 80000)

INSERT INTO instructor
VALUES (83821,'Brandt', 'Comp.Sci.', 92000)


//student 테이블 데이터 삽입
INSERT INTO student
VALUES (00128,'Zhang','Comp.Sci.',102)

INSERT INTO student
VALUES (12345,'Shankar','Comp.Sci.',32)

INSERT INTO student
VALUES (19991,'Brandt','History',80)

INSERT INTO student
VALUES (23121,'Chavez','Finance',110)

INSERT INTO student
VALUES (44553,'Peltier','Physics',56)

INSERT INTO student
VALUES (45678,'Levy','Physics',46)

INSERT INTO student
VALUES (54321,'Wiliams','Comp.Sci.',54)

INSERT INTO student
VALUES (55739,'Sanchez','Music',38)

INSERT INTO student
VALUES (70557,'Snow','Physics',0)

INSERT INTO student
VALUES (76543,'Brown','Comp.Sci.',58)

INSERT INTO student
VALUES (76653,'Aoi','Elec.Eng.',60)

INSERT INTO student
VALUES (98765,'Bourikas','Elec.Eng.',98)

SELECT * FROM student