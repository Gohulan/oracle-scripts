To delete archived redo logs:

DELETE ARCHIVELOG ALL;



To move archived redo logs to a different location:

ALTER SYSTEM SET LOG_ARCHIVE_DEST_1='LOCATION=your_new_location';

Add Data Files to a Tablespace:

ALTER TABLESPACE your_tablespace ADD DATAFILE 'path_to_new_datafile' SIZE 100M;
