//DB�� ��� ��ü�� ���İ� �� ���� ���
sp_help student

//�ڽ��� SQL ������ �����ͺ��̽��� ���
sp_databases

//�䳪 ���ν����� ������ �ҽ� ���
sp_helptext advisor_info

�ش� ���̺��̳� ��,���� ���ν����� �����ǰų� ���ӵ� ��ü ���
sp_depends student

//���� ���ν��� ����
//������ �̸��� ���� �ش� ������ ��� ������ ���� �л��� ��� ���� ���
CREATE PROCEDURE advisor_info
	@ad_name varchar(20)
AS
BEGIN
	SELECT i.*,s.*
	FROM
		instructor AS i INNER JOIN advisor AS a ON i.id = a.i_id
		INNER JOIN student AS s on s.id = a.s_id
	WHERE i.name = @ad_name
END

SELECT * FROM instructor

//���� ���ν��� ����
advisor_info @ad_name = 'Kim'

//���� ���ν��� ����
DROP PROCEDURE advisor_info

//Ʈ���� ����
CREATE TRIGGER trg_up_ins
ON instructor
FOR UPDATE
AS
SELECT * FROM instructor

//Ʈ���� ��� �ش� ���̺� ���� ������Ʈ�� �Ͼ�� ���ǹ����� ���� ��
UPDATE instructor
SET salary = 90000
WHERE instructor.dept_name = 'Comp.Sci.'

//Ʈ���� ����
DROP TRIGGER trg_up_ins

//�ε��� ���� ���� ���̺� ����
CREATE TABLE hallym (
	cust_id	CHAR(15)	NOT NULL,
	cust_name	VARCHAR(40)	NOT NULL,
	phone	CHAR(12) NOT NULL,
	[address]	VARCHAR(40)	NULL
);

//�ε��� Ȯ��
sp_helpindex hallym

//�ε��� ����(�ڵ����� �����ϴ� �� -> PRIMARY Ű ���� �� �ε��� Ȯ��
//�⺻���� Clustered index��  ������
ALTER TABLE hallym
ADD CONSTRAINT pk_hallym PRIMARY KEY (cust_id)

//�ε��� ����(���� �ε��� ���� -> �ε��� ���� �� �ε��� Ȯ��)
//�⺻���� NON-Clustered index��  ������
CREATE INDEX idx1 ON hallym(cust_id)

//dept_name�� PRIMARY KEY�� ��Ҿ��� ������ �ε����� �ڵ� ������
sp_helpindex department