/*데이터 입력*/
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

/*전체 데이터 검색*/
SELECT * FROM student

/*특정 데이터 검색*/
SELECT ID, NAME FROM student

SELECT * FROM student WHERE ID = 12345

/*특정 데이터 삭제*/
DELETE student WHERE NAME = 'Zhang'

/*특정 데이터 수정*/
UPDATE student
SET tot_cred = 130
WHERE NAME = 'Lee'

/*로그인 생성*/
CREATE LOGIN tester WITH PASSWORD = 'password'
/*유저 생성*/
CREATE USER tester FOR LOGIN tester

/*권한 등록*/
GRANT SELECT ON student TO tester
GRANT INSERT ON student TO tester

/*권한 해제*/
REVOKE SELECT ON student TO tester
REVOKE INSERT ON student TO tester

/*데이터 삽입*/
INSERT INTO student
VALUES (123456, 'tester', 'History', 133, NULL, NULL)
