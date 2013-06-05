IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = '$(SchemaName)')
BEGIN
EXEC ('CREATE SCHEMA $(SchemaName) AUTHORIZATION dbo')
END

CREATE TABLE $(QualifiedTableName) (
	ChangeId INT IDENTITY(1,1) NOT NULL,
	Folder VARCHAR(256) NOT NULL,
	ScriptNumber SMALLINT NOT NULL,
	ScriptName VARCHAR(512) NOT NULL,
	StartDate DATETIME NOT NULL,
	CompleteDate DATETIME NULL,
	AppliedBy VARCHAR(128) NOT NULL,
	ScriptStatus TINYINT NOT NULL,
	ScriptOutput VARCHAR(max) NOT NULL,
 CONSTRAINT PK_$(TableName) PRIMARY KEY CLUSTERED 
(
	ChangeId ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE UNIQUE NONCLUSTERED INDEX IX_$(TableName) ON $(QualifiedTableName)
(
	Folder ASC,
	ScriptNumber ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]