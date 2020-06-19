CREATE OR REPLACE TABLE user(
  user_id       INT           NOT NULL  AUTO_INCREMENT,
  name          VARCHAR(30)   NOT NULL,
  last_name_p   VARCHAR(30)   NOT NULL,
  last_name_m   VARCHAR(30)   NOT NULL,
  birthday      DATE          NOT NULL,
  email         VARCHAR(30)   NOT NULL,
  pass          VARCHAR(50)   NOT NULL,
  CONSTRAINT user_pk PRIMARY KEY (user_id)
);

CREATE TABLE school(
  school_id     INT           NOT NULL  AUTO_INCREMENT,
  name          VARCHAR(30)   NOT NULL,
  grade         VARCHAR(10)   NOT NULL,
  user_id       INT           NOT NULL,
  CONSTRAINT school_pk PRIMARY KEY (school_id),
  CONSTRAINT school_user_id_fk FOREIGN KEY (user_id) 
  REFERENCES user (user_id)
);

CREATE TABLE teacher(
  teacher_id    INT           NOT NULL    AUTO_INCREMENT,
  name          VARCHAR(30)   NOT NULL,
  last_name_p   VARCHAR(30)   NOT NULL,
  last_name_m   VARCHAR(30)   NOT NULL,
  phone         VARCHAR(10)   NULL,
  CONSTRAINT teacher_pk PRIMARY KEY (teacher_id)
);

CREATE TABLE grade(
  grade_id      INT           NOT NULL  AUTO_INCREMENT,
  name          VARCHAR(30)   NOT NULL,
  description   VARCHAR(30)   NOT NULL,
  CONSTRAINT grade_pk PRIMARY KEY (grade_id)
);

CREATE TABLE s_group(
  s_group_id      INT           NOT NULL  AUTO_INCREMENT,
  name          VARCHAR(30)   NOT NULL,
  description   VARCHAR(30)   NOT NULL,
  grade_id      INT           NOT NULL,
  CONSTRAINT s_group_pk PRIMARY KEY (s_group_id),
  CONSTRAINT s_group_grade_id_fk FOREIGN KEY (grade_id) 
  REFERENCES grade (grade_id)
);

CREATE TABLE teacher_school(
  teacher_school_id     INT         NOT NULL  AUTO_INCREMENT,
  turn                  VARCHAR(1)  NOT NULL,
  school_id             INT         NOT NULL,
  teacher_id            INT         NOT NULL,
  s_group_id              INT         NOT NULL,
  CONSTRAINT teacher_school_pk PRIMARY KEY (teacher_school_id),
  CONSTRAINT teacher_school_school_id_fk FOREIGN KEY (school_id)
  REFERENCES school (school_id),
  CONSTRAINT teacher_school_teacher_id_fk FOREIGN KEY (teacher_id)
  REFERENCES teacher (teacher_id),
  CONSTRAINT teacher_school_s_group_id_fk FOREIGN KEY (s_group_id)
  REFERENCES s_group (s_group_id)
);

CREATE TABLE p_order(
  p_order_id            INT           NOT NULL  AUTO_INCREMENT,
  name                VARCHAR(30)   NOT NULL,
  quantity            INT           NOT NULL,
  unit_price          FLOAT(4, 2)   NOT NULL,
  total_price         FLOAT(7, 2)   NOT NULL,
  delevered           BOOLEAN       NOT NULL,
  paid_out            BOOLEAN       NOT NULL,
  teacher_school_id   INT           NOT NULL,
  CONSTRAINT p_order_pk PRIMARY KEY (p_order_id),
  CONSTRAINT p_order_teacher_school_id_fk FOREIGN KEY (teacher_school_id)
  REFERENCES teacher_school(teacher_school_id)
);

CREATE TABLE payment(
  payment_id     INT          NOT NULL  AUTO_INCREMENT,
  amount         FLOAT(7,2)   NOT NULL,
  payment_day    DATE         NOT NULL,
  file           BLOB         NULL,
  p_order_id       INT          NOT NULL,
  CONSTRAINT payment_pk PRIMARY KEY (payment_id),
  CONSTRAINT payment_p_order_id_fk FOREIGN KEY (p_order_id)
  REFERENCES p_order(p_order_id)
);