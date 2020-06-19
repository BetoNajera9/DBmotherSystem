SET @fk = CONCAT("
  SELECT grade_id 
  FROM grade
  WHERE name
")