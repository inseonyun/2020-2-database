//department테이블의 모든 릴레이션 가져옴
SELECT * FROM department

//FROM절에 두 개의 테이블이 들어오면 카티젼 곱으로 결과가 나온다
SELECT * FROM student, instructor

//WHERE절 조건 질의
SELECT * FROM student
WHERE tot_cred > 100

SELECT * FROM student
WHERE dept_name = 'Comp.Sci.'

//재명명 연산
SELECT i.name, s.name
FROM instructor AS i, student AS s

SELECT i.name, s.name
FROM instructor AS i, student AS s
WHERE i.salary < 70000 AND s.tot_cred > 100

//select도 재명명 가능
SELECT i.name AS instructor_name, s.name AS student_name
FROM instructor AS i, student AS s
WHERE i.salary < 70000 AND s.tot_cred > 100

//스트링 연산 (%)와 (_)사용
SELECT * FROM department
WHERE dept_name LIKE '%i%' //dep_name에 i 포함되는 모든 튜플 출력
//name에서 S로 시작하는 모든 튜플 출력
SELECT * FROM student
WHERE name LIKE 'S%' 
//name에서 h앞엔 한글자(공백제외) 아무거나 오고 뒤엔 상관없음 모든 튜플 출력
SELECT * FROM student
WHERE name LIKE '_h%' 

//데이터 출력의 순서화(ORDER BY), DESC
//오름차순
SELECT * FROM student
ORDER BY tot_cred
//내림차순
SELECT * FROM student
ORDER BY tot_cred DESC

//집합연산자 UNION, UNION ALL(합집합)
SELECT id, name, dept_name
FROM instructor
UNION
SELECT id, name, dept_name
FROM student

//집합연산자 INTERSECT(교집합)
SELECT name
FROM instructor
INTERSECT
SELECT name
FROM student

//집합연산자 EXCEPT(차집합)
SELECT name
FROM instructor
EXCEPT
SELECT name
FROM student

//조인(JOIN) 카티젼 곱
SELECT *
FROM student,department
//INNER JOIN (WHERE 이용)
//공통 컬럼에서 값이 같은 데이터만 출력
SELECT *
FROM student AS S, department AS d
WHERE s.dept_name = d.dept_name
//INNER JOIN (ON 이용)
SELECT *
FROM student AS s INNER JOIN department AS d
ON s.dept_name = d.dept_name

//OUTER JOIN(LEFT) 왼쪽 테이블 기준
SELECT i.name AS 교수, s.name AS 학생
FROM instructor AS i LEFT JOIN student AS s
ON i.dept_name = s.dept_name

//OUTER JOIN(RIGHT) 오른쪽 테이블 기준
SELECT i.name AS 교수, s.name AS 학생
FROM instructor AS i RIGHT JOIN student AS s
ON i.dept_name = s.dept_name

//집성함수 평균
SELECT AVG(salary) AS salary_avg FROM instructor
WHERE salary > 50000
//최솟값
SELECT MIN(salary) AS salary_MIN FROM instructor
WHERE salary > 50000
//최댓값
SELECT MAX(salary) AS salary_MAX FROM instructor
WHERE salary < 80000
//합계
SELECT SUM(salary) AS salary_SUM FROM instructor
WHERE salary < 80000
//개수
SELECT COUNT(salary) AS salary_COUNT FROM instructor
WHERE salary > 70000

//GROUP BY
SELECT dept_name FROM student
GROUP BY dept_name

SELECT dept_name, AVG(tot_cred) AS tot_cred_avg FROM student
GROUP BY dept_name

//중복제거 DISTINCT
SELECT DISTINCT dept_name FROM instructor

//HAVING
SELECT dept_name, AVG(salary) AS salary_avg 
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > '70000'

//중첩 부질의 (IN & NOT IN)
SELECT name, salary, dept_name
FROM instructor
WHERE dept_name IN
(
	SELECT dept_name
	FROM student
	WHERE dept_name LIKE '_i%'
)
SELECT name, salary, dept_name
FROM instructor
WHERE dept_name	NOT IN
(
	SELECT dept_name
	FROM student
	WHERE dept_name LIKE '_i%'
)
//SOME & ALL
SELECT name, salary
FROM instructor
WHERE salary < SOME
(
	SELECT salary
	FROM instructor
	WHERE name LIKE '%i%'
)
SELECT name, salary
FROM instructor
WHERE salary < ALL 
(
	SELECT salary
	FROM instructor
	WHERE name LIKE '%i%'
)
//EXISTS & NOT EXISTS
SELECT *
FROM instructor
WHERE EXISTS
(
	SELECT dept_name
	FROM student
	WHERE tot_cred >20
)
SELECT *
FROM instructor
WHERE NOT EXISTS
(
	SELECT dept_name
	FROM student
	WHERE tot_cred >20
)
//FROM 부질의
SELECT *
FROM (
	SELECT DISTINCT dept_name
	FROM student
	) AS tmp
WHERE tmp.dept_name LIKE '_i%'