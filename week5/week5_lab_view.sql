//�� ����
CREATE VIEW test_view AS 
	SELECT i.name AS i_name, s.name AS s_name
	FROM instructor AS i, student AS s
	
//�� selcet
SELECT * FROM test_view

//�� ���� selcet instructor 'i'�� �ι�°�� �ִ� Ʃ�� �˻�
SELECT * FROM test_view
WHERE i_name LIKE '_i%'

//�� ����
DROP VIEW test_view

//������ �� �ǹ��� �� �ǹ��� �� �ǹ� �̸��� ���� Ʃ�� �� ����
CREATE VIEW inst_dept AS
	SELECT i.id, i.name, i.salary, d.dept_name, d.building, d.budget
	FROM instructor AS i, department AS d
	WHERE i.dept_name = d.dept_name

//���� �� �ǹ��� �л� �� �ǹ��� ���� Ʃ�� �˻� �� �̿��Ͽ� ���� ���� �˻�(1)
SELECT *
FROM inst_dept AS id, student AS s
WHERE id.dept_name = s.dept_name

//�並 �̿��Ͽ� �����ϰ� ���� �˻� (2)
SELECT *
FROM inst_dept AS id, advisor AS a
WHERE id.id = a.i_id