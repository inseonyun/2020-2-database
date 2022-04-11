//department���̺��� ��� �����̼� ������
SELECT * FROM department

//FROM���� �� ���� ���̺��� ������ īƼ�� ������ ����� ���´�
SELECT * FROM student, instructor

//WHERE�� ���� ����
SELECT * FROM student
WHERE tot_cred > 100

SELECT * FROM student
WHERE dept_name = 'Comp.Sci.'

//���� ����
SELECT i.name, s.name
FROM instructor AS i, student AS s

SELECT i.name, s.name
FROM instructor AS i, student AS s
WHERE i.salary < 70000 AND s.tot_cred > 100

//select�� ���� ����
SELECT i.name AS instructor_name, s.name AS student_name
FROM instructor AS i, student AS s
WHERE i.salary < 70000 AND s.tot_cred > 100

//��Ʈ�� ���� (%)�� (_)���
SELECT * FROM department
WHERE dept_name LIKE '%i%' //dep_name�� i ���ԵǴ� ��� Ʃ�� ���
//name���� S�� �����ϴ� ��� Ʃ�� ���
SELECT * FROM student
WHERE name LIKE 'S%' 
//name���� h�տ� �ѱ���(��������) �ƹ��ų� ���� �ڿ� ������� ��� Ʃ�� ���
SELECT * FROM student
WHERE name LIKE '_h%' 

//������ ����� ����ȭ(ORDER BY), DESC
//��������
SELECT * FROM student
ORDER BY tot_cred
//��������
SELECT * FROM student
ORDER BY tot_cred DESC

//���տ����� UNION, UNION ALL(������)
SELECT id, name, dept_name
FROM instructor
UNION
SELECT id, name, dept_name
FROM student

//���տ����� INTERSECT(������)
SELECT name
FROM instructor
INTERSECT
SELECT name
FROM student

//���տ����� EXCEPT(������)
SELECT name
FROM instructor
EXCEPT
SELECT name
FROM student

//����(JOIN) īƼ�� ��
SELECT *
FROM student,department
//INNER JOIN (WHERE �̿�)
//���� �÷����� ���� ���� �����͸� ���
SELECT *
FROM student AS S, department AS d
WHERE s.dept_name = d.dept_name
//INNER JOIN (ON �̿�)
SELECT *
FROM student AS s INNER JOIN department AS d
ON s.dept_name = d.dept_name

//OUTER JOIN(LEFT) ���� ���̺� ����
SELECT i.name AS ����, s.name AS �л�
FROM instructor AS i LEFT JOIN student AS s
ON i.dept_name = s.dept_name

//OUTER JOIN(RIGHT) ������ ���̺� ����
SELECT i.name AS ����, s.name AS �л�
FROM instructor AS i RIGHT JOIN student AS s
ON i.dept_name = s.dept_name

//�����Լ� ���
SELECT AVG(salary) AS salary_avg FROM instructor
WHERE salary > 50000
//�ּڰ�
SELECT MIN(salary) AS salary_MIN FROM instructor
WHERE salary > 50000
//�ִ�
SELECT MAX(salary) AS salary_MAX FROM instructor
WHERE salary < 80000
//�հ�
SELECT SUM(salary) AS salary_SUM FROM instructor
WHERE salary < 80000
//����
SELECT COUNT(salary) AS salary_COUNT FROM instructor
WHERE salary > 70000

//GROUP BY
SELECT dept_name FROM student
GROUP BY dept_name

SELECT dept_name, AVG(tot_cred) AS tot_cred_avg FROM student
GROUP BY dept_name

//�ߺ����� DISTINCT
SELECT DISTINCT dept_name FROM instructor

//HAVING
SELECT dept_name, AVG(salary) AS salary_avg 
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > '70000'

//��ø ������ (IN & NOT IN)
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
//FROM ������
SELECT *
FROM (
	SELECT DISTINCT dept_name
	FROM student
	) AS tmp
WHERE tmp.dept_name LIKE '_i%'