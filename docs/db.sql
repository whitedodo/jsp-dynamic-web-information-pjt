-- Oracle 11 - 자동번호 생성 테이블 정의
-- Table 생성 (BOARD)
-- NEW.ID (Table의 id를 가리킴)
CREATE TABLE tablet_notice
(
    id NUMBER PRIMARY KEY,
    dept VARCHAR2(30),
    memo NCLOB,
    ip VARCHAR(128),
    regidate TIMESTAMP
);

-- Sequence 정의
CREATE SEQUENCE tablet_notice_sequence
START WITH 1
INCREMENT BY 1;

-- Trigger 생성
-- BEFORE INSERT on '테이블명'
CREATE OR REPLACE TRIGGER tablet_notice_trigger
BEFORE INSERT
    ON tablet_notice
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT tablet_notice_sequence.nextval INTO :NEW.ID FROM dual;
END;

-- Oracle 11 - 자동번호 생성 테이블 정의
-- Table 생성 (RESERVATION)
-- NEW.ID (Table의 id를 가리킴)
CREATE TABLE tablet_reservation
(
    id NUMBER PRIMARY KEY,
    proposal VARCHAR2(30),
    promise VARCHAR2(30),
    name VARCHAR2(30),
    phone VARCHAR2(20),
    ip VARCHAR(128),
    state VARCHAR2(20),
    regidate DATE
);

-- Sequence 정의
CREATE SEQUENCE tablet_reservation_sequence
START WITH 1
INCREMENT BY 1;

-- Trigger 생성
-- BEFORE INSERT on '테이블명'
CREATE OR REPLACE TRIGGER tablet_reservation_trigger
BEFORE INSERT
    ON tablet_reservation
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT tablet_reservation_sequence.nextval INTO :NEW.ID FROM dual;
END;
