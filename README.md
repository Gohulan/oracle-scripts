# Oracle Scripts - Managing Drive Space with Oracle
Guide on how to free up space on the drive and manage Oracle databases effectively.

**Title**: Managing Drive Space with Oracle

**Description**: A guide on how to free up space on the D drive and manage Oracle databases effectively.

---

### Identify What's Taking Up Space

Start by identifying which files or directories are consuming the most space on the D drive. You can use Windows tools like File Explorer or third-party disk space analysis tools to help with this. In particular, look for large log files, temporary files, or unnecessary data that can be safely removed.

### Archived Redo Logs

Oracle databases generate archived redo logs. These logs can take up a considerable amount of space over time. You may want to consider moving them to a different drive if possible or deleting old ones that are no longer needed. Be cautious when deleting redo logs, as they are essential for database recovery.

### Backup Files

Review your database backup strategy. Backup files can also consume a lot of space. Make sure you have a well-structured backup and retention policy. You can consider moving older backup files to another drive or a backup storage location.

### Oracle Data Files

If Oracle data files are stored on the D drive, you may want to consider moving some of them to a different drive with more space. This can be a complex operation and should be done with caution to avoid affecting database operations. Be sure to follow Oracle's procedures for moving data files.

### Clean Up Logs and Temporary Files

Within Oracle, you can manage logs and temporary files using SQL commands. Clean up any unnecessary logs and temporary data. For example, you can use the DELETE and TRUNCATE statements to remove old data.

### Purge and Shrink Tables

Depending on your application, you may have tables with a lot of unused or outdated data. You can consider purging and shrinking these tables to free up space. This may require working closely with your DBA or application developer.

### Optimize Tablespaces

If your database is configured with multiple tablespaces, check if any of them are low on space. You may be able to add data files to these tablespaces or resize them to allocate more space.

### Regular Maintenance

Implement a regular maintenance schedule for cleaning up and managing database objects, logs, and temporary files to prevent the D drive from filling up in the future.

### Consider Adding More Storage

If none of the above options are sufficient, you may need to consider adding more storage to the D drive or migrating parts of the Oracle database to a different drive with more space.

### Consult Your DBA

It's crucial to work closely with your database administrator (DBA) throughout this process to ensure that any actions you take do not impact the integrity and performance of the Oracle database.

---

### SQL Queries for Managing Oracle:

**Identify Tablespace Usage:**

```sql
SELECT tablespace_name, SUM(bytes) / 1024 / 1024 AS "Size (MB)"
FROM dba_data_files
GROUP BY tablespace_name;

```

**Identify Large Tables:**
```sql

SELECT table_name, TRUNC(SUM(bytes) / 1024 / 1024) AS "Size (MB)"
FROM dba_segments
WHERE tablespace_name = 'your_tablespace_name'
GROUP BY table_name
ORDER BY "Size (MB)" DESC;

```

**Purge and Shrink Tables:**
```sql

DELETE FROM your_table WHERE your_condition;

-- After deleting data, you can shrink the table:
ALTER TABLE your_table DEALLOCATE UNUSED;


```

**Reclaim Space in a Tablespace:**
```sql

ALTER TABLESPACE your_tablespace COALESCE;

```

**To delete archived redo logs:**
```sql
DELETE ARCHIVELOG ALL;

```

**To move archived redo logs to a different location:**
```sql
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=your_new_location';
```
**Add Data Files to a Tablespace:**
```sql
ALTER TABLESPACE your_tablespace ADD DATAFILE 'path_to_new_datafile' SIZE 100M;
```

**Resizing Data Files:**
You can resize data files if they have free space or need to be expanded:

```sql
ALTER DATABASE DATAFILE 'path_to_datafile' RESIZE 200M;
```
