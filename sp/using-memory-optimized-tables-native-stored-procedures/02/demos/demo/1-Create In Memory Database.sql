CREATE DATABASE SQLAuthority 
	ON PRIMARY (
    NAME = [SQLAuthority_data]
    ,FILENAME = 'D:\Data\SQLAuthority.mdf'
    )
    ,FILEGROUP [SQLAuthority_FG] 
	CONTAINS MEMORY_OPTIMIZED_DATA (
    NAME = [SQLAuthority_dir]
    ,FILENAME = 'D:\Data\SQLAuthority_dir'
    ) 
	LOG ON (
    NAME = [SQLAuthority_log]
    ,Filename = 'D:\Data\SQLAuthority_log.ldf'
    )
GO