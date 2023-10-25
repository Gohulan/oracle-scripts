SELECT table_name, TRUNC(SUM(bytes) / 1024 / 1024) AS "Size (MB)"
FROM dba_segments
WHERE tablespace_name = 'your_tablespace_name'
GROUP BY table_name
ORDER BY "Size (MB)" DESC;