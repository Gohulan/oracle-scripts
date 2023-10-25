SELECT tablespace_name, SUM(bytes) / 1024 / 1024 AS "Size (MB)"
FROM dba_data_files
GROUP BY tablespace_name;