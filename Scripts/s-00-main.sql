DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS p_order;
DROP TABLE IF EXISTS teacher_school;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS s_group;
DROP TABLE IF EXISTS grade;

SOURCE s-01-entities.sql;
SOURCE s-02-load-grade.sql;
SOURCE s-03-procedure-group.sql;

CALL load_groups;