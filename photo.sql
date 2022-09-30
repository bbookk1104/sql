--------------------------------------------------------
--  ������ ������ - ������-9��-14-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PHOTO
--------------------------------------------------------

  CREATE TABLE "WEBSERVER"."PHOTO" 
   (	"PHOTO_NO" NUMBER, 
	"PHOTO_WRITER" VARCHAR2(20 BYTE), 
	"PHOTO_TITLE" VARCHAR2(100 BYTE), 
	"PHOTO_CONTENT" VARCHAR2(1000 BYTE), 
	"FILEPATH" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into WEBSERVER.PHOTO
SET DEFINE OFF;
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (3,'user01','����','��ٶ���','church.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (4,'user01','�������� �����','������ ����','drug.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (1,'user01','����','�׷���','blossom.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (2,'user01','ũ��������','��Ÿ����','christmas.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (5,'user01','���ڱ�','�̷� ���� �־���','gamsung.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (6,'user01','�ָ��� �������� �ü�','�δ㽺����','help.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (7,'user01','��������.','�̷� ���� �־���','hosu.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (8,'user01','�ع�ġ','�ع����','iloveher.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (9,'user01','�ڸ� ����','���۵�����','morunungoyangyi.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (10,'user01','��','�ο�','mybaby.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (11,'user01','â����','�̾���','palace2.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (12,'user01','����','�ٺ�','princess.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (14,'user01','�ٴ�','�ٴٴ�','sea1.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (15,'user01','����','���� ���Ҵµ�','seefall.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (16,'user01','�λ���','���ű���','shirimpggang.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (17,'user01','mybaby','mysweetlittlekitty','sweetlittlekitty.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (18,'user01','�鿩�ٺ���������','���ϴ�','thatsmygirl.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (19,'user01','����','�׷����ϴ�.','uzzultv.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (26,'sweetgirl','���� ������ �������̿���...�ҵ��ҵ���','���� ä�����Ͻó׿�..�̤�����������','ȭ�� ĸó 2022-09-07 143120.png');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (23,'user01','��ä','ä��','yachae.jpg');
Insert into WEBSERVER.PHOTO (PHOTO_NO,PHOTO_WRITER,PHOTO_TITLE,PHOTO_CONTENT,FILEPATH) values (25,'sweetgirl','�Դٰ���~','v^^v','������v1.png');
--------------------------------------------------------
--  DDL for Index SYS_C007235
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEBSERVER"."SYS_C007235" ON "WEBSERVER"."PHOTO" ("PHOTO_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table PHOTO
--------------------------------------------------------

  ALTER TABLE "WEBSERVER"."PHOTO" ADD PRIMARY KEY ("PHOTO_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "WEBSERVER"."PHOTO" MODIFY ("PHOTO_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "WEBSERVER"."PHOTO" MODIFY ("PHOTO_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PHOTO
--------------------------------------------------------

  ALTER TABLE "WEBSERVER"."PHOTO" ADD FOREIGN KEY ("PHOTO_WRITER")
	  REFERENCES "WEBSERVER"."MEMBER_TBL" ("MEMBER_ID") ON DELETE CASCADE ENABLE;
