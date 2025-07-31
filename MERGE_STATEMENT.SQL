MERGE INTO <target_table> alias
USING <source_table> alias ON (<condition>)
WHEN MATCHED THEN UPDATE SET col=val,...
WHEN NOT MATCHED THEN INSERT (col_list) VALUES (val_list);


MERGE INTO dest d 
USING source s  ON (s.id = d.id)
WHEN MATCHED THEN UPDATE SET d.name = s.name, d.mark = s.mark
WHEN NOT MATCHED THEN INSERT (d.id,d.name,d.mark) VALUES (s.id,s.name,s.mark);
