USE [LIN2WORLD]
GO

IF NOT EXISTS(SELECT 1 FROM dbo.syscolumns WITH (NOLOCK) WHERE OBJECT_NAME(id) = N'user_data' AND name = N'country')
	ALTER TABLE user_data ADD country int NOT NULL DEFAULT ((-1))
GO
