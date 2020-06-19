DELIMITER $$
CREATE OR REPLACE PROCEDURE load_groups ()
BEGIN
DECLARE v_grade_id INT;
DECLARE v_aux VARCHAR(10);
DECLARE v_count INT;
DECLARE v_name VARCHAR(30);

  SET v_count = 0;

  get_grade: LOOP

      SET v_count = v_count + 1;

      SET v_aux = CONCAT(v_count, '-P');

      SELECT grade_id INTO v_grade_id
      FROM grade 
      WHERE name = v_aux;

      INSERT INTO s_group (name, description, grade_id)
      VALUES (CONCAT(v_count, 'A'), 
      CONCAT(v_count, '° de primaria del grupo', v_count, 'A'), v_grade_id);
      INSERT INTO s_group (name, description, grade_id)
      VALUES (CONCAT(v_count, 'B'), 
      CONCAT(v_count, '° de primaria del grupo', v_count, 'B'), v_grade_id);
      INSERT INTO s_group (name, description, grade_id)
      VALUES (CONCAT(v_count, 'C'), 
      CONCAT(v_count, '° de primaria del grupo', v_count, 'C'), v_grade_id);
      INSERT INTO s_group (name, description, grade_id)
      VALUES (CONCAT(v_count, 'D'), 
      CONCAT(v_count, '° de primaria del grupo', v_count, 'D'), v_grade_id);

      IF v_count = 6 THEN
        LEAVE get_grade;
      END IF;

  END LOOP get_grade;
  COMMIT;
END$$