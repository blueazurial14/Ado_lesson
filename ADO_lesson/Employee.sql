CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[BirthDate] DATETIME2 NOT NULL ,
	[Email] NVARCHAR(50) NOT NULL,
	[ResponsableID] INT NULL, 
	CONSTRAINT [PK_Employee] Primary KEY ([Id]),
	CONSTRAINT [UK_Employee_Email] UNIQUE ([Email]),
	CONSTRAINT [CK_Employee_Birthdate] CHECK (YEAR(Birthdate)<2010),
	CONSTRAINT [CK_Employee_Responsable] CHECK (ResponsableID <> Id),
	CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([ResponsableID]) REFERENCES [Employee]([Id])

)

go

CREATE INDEX [IX_Employee_LastName] on [dbo].[Employee] ([LastName])

GO


CREATE TRIGGER [dbo].[Trigger_OnlnsertEmployee]
    ON [dbo].[Employee]
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON
    END