/*������ �Է�*/
INSERT INTO student
VALUES (00128, 'Zhang', 'Comp.sci', 102, NULL, NULL)

INSERT INTO student
VALUES (12345, 'Shankar', 'Comp.sci', 32, NULL, NULL)

INSERT INTO student
VALUES (19991, 'Brandt', 'History', 80, NULL, NULL)

INSERT INTO student
VALUES (23121, 'Chavez', 'Finance', 102, NULL, NULL)

INSERT INTO student (ID, NAME, dept_name, e_mail, hompage)
VALUES (11111, 'Lee', 'Comp.sci', 'hwlee@hallym.ac.kr', 'www.google.co.kr')

/*��ü ������ �˻�*/
SELECT * FROM student

/*Ư�� ������ �˻�*/
SELECT ID, NAME FROM student

SELECT * FROM student WHERE ID = 12345

/*Ư�� ������ ����*/
DELETE student WHERE NAME = 'Zhang'

/*Ư�� ������ ����*/
UPDATE student
SET tot_cred = 130
WHERE NAME = 'Lee'

/*�α��� ����*/
CREATE LOGIN tester WITH PASSWORD = 'password'
/*���� ����*/
CREATE USER tester FOR LOGIN tester

/*���� ���*/
GRANT SELECT ON student TO tester
GRANT INSERT ON student TO tester

/*���� ����*/
REVOKE SELECT ON student TO tester
REVOKE INSERT ON student TO tester

/*������ ����*/
INSERT INTO student
VALUES (123456, 'tester', 'History', 133, NULL, NULL)
