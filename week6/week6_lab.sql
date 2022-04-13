//DB의 모든 객체의 형식과 그 정보 출력
sp_help student

//자신의 SQL 서버의 데이터베이스들 출력
sp_databases

//뷰나 프로시저를 정의한 소스 출력
sp_helptext advisor_info

해당 테이블이나 뷰,저장 프로시저와 연관되거나 종속된 객체 출력
sp_depends student

//저장 프로시저 생성
//교수의 이름을 통해 해당 교수의 모든 정보와 지도 학생의 모든 정보 출력
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

//저장 프로시저 실행
advisor_info @ad_name = 'Kim'

//저장 프로시저 삭제
DROP PROCEDURE advisor_info

//트리거 생성
CREATE TRIGGER trg_up_ins
ON instructor
FOR UPDATE
AS
SELECT * FROM instructor

//트리거 사용 해당 테이블에 관해 업데이트가 일어나면 질의문장이 실행 됨
UPDATE instructor
SET salary = 90000
WHERE instructor.dept_name = 'Comp.Sci.'

//트리거 삭제
DROP TRIGGER trg_up_ins

//인덱스 생성 전에 테이블 생성
CREATE TABLE hallym (
	cust_id	CHAR(15)	NOT NULL,
	cust_name	VARCHAR(40)	NOT NULL,
	phone	CHAR(12) NOT NULL,
	[address]	VARCHAR(40)	NULL
);

//인덱스 확인
sp_helpindex hallym

//인덱스 생성(자동으로 생성하는 법 -> PRIMARY 키 설정 및 인덱스 확인
//기본으로 Clustered index로  설정됨
ALTER TABLE hallym
ADD CONSTRAINT pk_hallym PRIMARY KEY (cust_id)

//인덱스 생성(지정 인덱스 생성 -> 인덱스 설정 및 인덱스 확인)
//기본으로 NON-Clustered index로  설정됨
CREATE INDEX idx1 ON hallym(cust_id)

//dept_name을 PRIMARY KEY로 잡았었기 때문에 인덱스가 자동 생성됨
sp_helpindex department