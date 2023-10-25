DELETE FROM your_table WHERE your_condition;

-- After deleting data, you can shrink the table:
ALTER TABLE your_table DEALLOCATE UNUSED;
