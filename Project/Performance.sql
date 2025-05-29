CREATE TABLE performance (
  pno             NUMBER PRIMARY KEY,
  category        VARCHAR2(100),
  image           VARCHAR2(500),
  eventname       VARCHAR2(500),
  period          VARCHAR2(100),
  place           VARCHAR2(300),
  target_audience VARCHAR2(255),
  is_free         VARCHAR2(50),
  fee             VARCHAR2(255),
  homepage        VARCHAR2(500),
  img_key         VARCHAR2(255)
);

select * from performance;

-- CSV������ ������ ����Ʈ �ؾ� �˴ϴ�. �̹��� Ű���� ������� �����Ͱ� �ʿ��ؿ�.
-- Performance ���̺� ��Ŭ�� -> ������ ����Ʈ
-- ������ ���� ����Ʈ ���� ã�ƺ��� Ŭ�� -> csv���� ���� , ���ڵ� utf-8
-- ���� ������ ���� ������ ����Ʈ�� ������ ����
-- csv �����Ͷ� db���̺� Į���̶� ��ġ ��Ű��
-- �� = PNO
-- �з� = CATEGORY
-- ����/���� = EVENTNAME
-- ��¥/�ð� = PERIOD
-- ��� = PLACE
-- �̿��� = TARGET_AUDIENCE
-- �̿��� = FEE
-- Ȩ������ �ּ� = HOMPAGE
-- ��ǥ�̹��� = IMAGE
-- ������ = IS_FREE
-- ���� �Ϸᴩ���� �����Ͱ� insert �˴ϴ�, ������ ������ �����Ͱ� �ѹ��� �� ���ϴ�.


--�̹��� Ű�� ����, IMAGE �����Ϳ��� atchFielId= ���� ���� �� �κ��� Ű������ �����մϴ�  
--api�� db�� ���ؼ� �����͸� ��ȸ�ϴµ� Ȱ�� �˴ϴ� 
UPDATE performance
SET img_key = REGEXP_SUBSTR(image, 'atchFileId=([^&]+)', 1, 1, NULL, 1)
WHERE image LIKE '%atchFileId=%'; --Ű�� ���� �ؼ� img_key�� update

--img_key �ߺ� ������ ���� unique����
ALTER TABLE performance ADD CONSTRAINT unique_img_key UNIQUE (img_key);

select * from performance order by pno desc;

--pno �ڵ����� ������
CREATE SEQUENCE performance_seq
  START WITH 1444 -- ����Ʈ�� ������ ������ ��ȣ ���� ����
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--pno �ڵ����� Ʈ����, insert���� ����� pno �ڵ�����  
CREATE OR REPLACE TRIGGER performance_before_insert
BEFORE INSERT ON performance
FOR EACH ROW
BEGIN
  IF :NEW.pno IS NULL THEN
    SELECT performance_seq.NEXTVAL INTO :NEW.pno FROM dual;
  END IF;
END;
/
