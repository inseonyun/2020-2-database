//뷰 생성
CREATE VIEW test_view AS 
	SELECT i.name AS i_name, s.name AS s_name
	FROM instructor AS i, student AS s
	
//뷰 selcet
SELECT * FROM test_view

//뷰 조건 selcet instructor 'i'가 두번째에 있는 튜플 검색
SELECT * FROM test_view
WHERE i_name LIKE '_i%'

//뷰 삭제
DROP VIEW test_view

//교수의 과 건물과 과 건물의 과 건물 이름이 같은 튜플 뷰 생성
CREATE VIEW inst_dept AS
	SELECT i.id, i.name, i.salary, d.dept_name, d.building, d.budget
	FROM instructor AS i, department AS d
	WHERE i.dept_name = d.dept_name

//뷰의 과 건물과 학생 과 건물이 같은 튜플 검색 뷰 이용하여 간단 조건 검색(1)
SELECT *
FROM inst_dept AS id, student AS s
WHERE id.dept_name = s.dept_name

//뷰를 이용하여 간단하게 조건 검색 (2)
SELECT *
FROM inst_dept AS id, advisor AS a
WHERE id.id = a.i_id