/*
Deployment script for TeaParty
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TeaParty"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
USE [master]
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [TeaParty], FILENAME = N'$(DefaultDataPath)TeaParty.mdf')
    LOG ON (NAME = [TeaParty_log], FILENAME = N'$(DefaultLogPath)TeaParty_log.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)]
GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Creating [Survey]...';


GO
CREATE SCHEMA [Survey]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [dbo].[Address]...';


GO
CREATE TABLE [dbo].[Address] (
    [addressID]   INT          IDENTITY (1, 1) NOT NULL,
    [address1]    VARCHAR (50) NULL,
    [address2]    VARCHAR (50) NULL,
    [city]        VARCHAR (25) NULL,
    [state]       CHAR (2)     NULL,
    [zipCode]     VARCHAR (5)  NULL,
    [extendedZip] VARCHAR (4)  NULL,
    PRIMARY KEY CLUSTERED ([addressID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[AddressType]...';


GO
CREATE TABLE [dbo].[AddressType] (
    [addressTypeID] INT          IDENTITY (1, 1) NOT NULL,
    [description]   VARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([addressTypeID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[ContactInfo]...';


GO
CREATE TABLE [dbo].[ContactInfo] (
    [contactInfoID]   INT          IDENTITY (1, 1) NOT NULL,
    [contactInfoData] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([contactInfoID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[ContactType]...';


GO
CREATE TABLE [dbo].[ContactType] (
    [contactTypeID] INT          IDENTITY (1, 1) NOT NULL,
    [description]   VARCHAR (15) NOT NULL,
    PRIMARY KEY CLUSTERED ([contactTypeID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[TeaParty]...';


GO
CREATE TABLE [dbo].[TeaParty] (
    [teaPartyID] INT           IDENTITY (1, 1) NOT NULL,
    [name]       VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([teaPartyID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[TeaPartyMember]...';


GO
CREATE TABLE [dbo].[TeaPartyMember] (
    [teaPartyMemberID] INT IDENTITY (1, 1) NOT NULL,
    [voterID]          INT NOT NULL,
    [teaPartyID]       INT NOT NULL,
    PRIMARY KEY CLUSTERED ([teaPartyMemberID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[Voter]...';


GO
CREATE TABLE [dbo].[Voter] (
    [voterID]      INT          IDENTITY (1, 1) NOT NULL,
    [firstName]    VARCHAR (50) NOT NULL,
    [lastName]     VARCHAR (50) NOT NULL,
    [stateVoterID] INT          NULL,
    PRIMARY KEY CLUSTERED ([voterID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[VoterAddress]...';


GO
CREATE TABLE [dbo].[VoterAddress] (
    [voterAddressID] INT IDENTITY (1, 1) NOT NULL,
    [voterID]        INT NOT NULL,
    [addressID]      INT NOT NULL,
    [addressTypeID]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([voterAddressID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[VoterContactInfo]...';


GO
CREATE TABLE [dbo].[VoterContactInfo] (
    [voterContactInfoID] INT IDENTITY (1, 1) NOT NULL,
    [voterID]            INT NOT NULL,
    [contactInfoID]      INT NOT NULL,
    [contactTypeID]      INT NOT NULL,
    PRIMARY KEY CLUSTERED ([voterContactInfoID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [dbo].[VoterCrossOver]...';


GO
CREATE TABLE [dbo].[VoterCrossOver] (
    [importID] INT NOT NULL,
    [voterID]  INT NOT NULL
);


GO
PRINT N'Creating [Survey].[Questions]...';


GO
CREATE TABLE [Survey].[Questions] (
    [questionID] INT           IDENTITY (1, 1) NOT NULL,
    [question]   VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([questionID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [Survey].[Survey]...';


GO
CREATE TABLE [Survey].[Survey] (
    [surveyID] INT           IDENTITY (1, 1) NOT NULL,
    [name]     VARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([surveyID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [Survey].[SurveyQuestions]...';


GO
CREATE TABLE [Survey].[SurveyQuestions] (
    [surveyQuestionsID] INT IDENTITY (1, 1) NOT NULL,
    [surveyID]          INT NOT NULL,
    [questionID]        INT NOT NULL,
    PRIMARY KEY CLUSTERED ([surveyQuestionsID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating [Survey].[SurveyResults]...';


GO
CREATE TABLE [Survey].[SurveyResults] (
    [surveResultsID]    INT IDENTITY (1, 1) NOT NULL,
    [voterID]           INT NOT NULL,
    [surveyQuestionsID] INT NOT NULL,
    [result]            INT NULL,
    PRIMARY KEY CLUSTERED ([surveResultsID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating fk_TeaPartyMember_TeaPartyID...';


GO
ALTER TABLE [dbo].[TeaPartyMember] WITH NOCHECK
    ADD CONSTRAINT [fk_TeaPartyMember_TeaPartyID] FOREIGN KEY ([teaPartyID]) REFERENCES [dbo].[TeaParty] ([teaPartyID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_TeaPartyMember_VoterID...';


GO
ALTER TABLE [dbo].[TeaPartyMember] WITH NOCHECK
    ADD CONSTRAINT [fk_TeaPartyMember_VoterID] FOREIGN KEY ([voterID]) REFERENCES [dbo].[Voter] ([voterID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_VoterAddress_Address_AddressID...';


GO
ALTER TABLE [dbo].[VoterAddress] WITH NOCHECK
    ADD CONSTRAINT [fk_VoterAddress_Address_AddressID] FOREIGN KEY ([addressID]) REFERENCES [dbo].[Address] ([addressID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_VoterAddress_AddressType_AddressTypeID...';


GO
ALTER TABLE [dbo].[VoterAddress] WITH NOCHECK
    ADD CONSTRAINT [fk_VoterAddress_AddressType_AddressTypeID] FOREIGN KEY ([addressTypeID]) REFERENCES [dbo].[AddressType] ([addressTypeID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_VoterAddress_Voter_VoterID...';


GO
ALTER TABLE [dbo].[VoterAddress] WITH NOCHECK
    ADD CONSTRAINT [fk_VoterAddress_Voter_VoterID] FOREIGN KEY ([voterID]) REFERENCES [dbo].[Voter] ([voterID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_VoterContactInfo_ContactInfo_ContactInfoID...';


GO
ALTER TABLE [dbo].[VoterContactInfo] WITH NOCHECK
    ADD CONSTRAINT [fk_VoterContactInfo_ContactInfo_ContactInfoID] FOREIGN KEY ([contactInfoID]) REFERENCES [dbo].[ContactInfo] ([contactInfoID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_VoterContactInfo_ContactType_ContactTypeID...';


GO
ALTER TABLE [dbo].[VoterContactInfo] WITH NOCHECK
    ADD CONSTRAINT [fk_VoterContactInfo_ContactType_ContactTypeID] FOREIGN KEY ([contactTypeID]) REFERENCES [dbo].[ContactType] ([contactTypeID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_VoterContactInfo_Voter_VoterID...';


GO
ALTER TABLE [dbo].[VoterContactInfo] WITH NOCHECK
    ADD CONSTRAINT [fk_VoterContactInfo_Voter_VoterID] FOREIGN KEY ([voterID]) REFERENCES [dbo].[Voter] ([voterID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_SurveyQuestions_Questions_QuestionID...';


GO
ALTER TABLE [Survey].[SurveyQuestions] WITH NOCHECK
    ADD CONSTRAINT [fk_SurveyQuestions_Questions_QuestionID] FOREIGN KEY ([questionID]) REFERENCES [Survey].[Questions] ([questionID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating fk_SurveyQuestions_Survey_SurveyID...';


GO
ALTER TABLE [Survey].[SurveyQuestions] WITH NOCHECK
    ADD CONSTRAINT [fk_SurveyQuestions_Survey_SurveyID] FOREIGN KEY ([surveyID]) REFERENCES [Survey].[Survey] ([surveyID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating [dbo].[AddImportData]...';


GO
CREATE PROCEDURE dbo.AddImportData
	@firstName varchar(50)
	,@lastName varchar(50)
	,@ID int OUTPUT
AS
BEGIN
	INSERT INTO dbo.Voter (firstName, lastName)
	VALUES (@firstName, @lastName);

	SELECT @ID = SCOPE_IDENTITY();
END
GO
PRINT N'Creating [dbo].[UpsertAddress]...';


GO
CREATE PROCEDURE dbo.UpsertAddress
	@address1 varchar(50)
	,@address2 varchar(50)
	,@city varchar(25)
	,@state varchar(2)
	,@zip varchar(5)
	,@extendedZip varchar(4)
	,@addressID int = 0 OUTPUT
AS
BEGIN
	SELECT @addressID = addressID
	FROM dbo.Address
	WHERE address1 = @address1
		AND address2 = @address2
		AND city = @city
		AND state = @state
		AND zipCode = @zip
		AND extendedZip = @extendedZip

	IF (@addressID = 0)
	BEGIN
		INSERT INTO dbo.Address (address1, address2, city, state, zipCode, extendedZip)
		VALUES (@address1, @address2, @city, @state, @zip, @extendedZip);

		SELECT @addressID = SCOPE_IDENTITY();
	END
END
GO
PRINT N'Creating [Survey].[AddSurveyQuestion]...';


GO
CREATE PROCEDURE Survey.AddSurveyQuestion
	@surveyID int
	,@question varchar(255)
	,@questionID int OUTPUT
AS
BEGIN
	INSERT INTO Survey.Questions (question) VALUES (@question);
	
	SELECT @questionID = SCOPE_IDENTITY();
END
GO
-- Refactoring step to update target server with deployed transaction logs
CREATE TABLE  [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
GO
sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- =============================================
-- Script Template
-- =============================================

INSERT INTO dbo.TeaParty (name) VALUES ('Humphreys County');
-- =============================================
-- Script Template
-- =============================================

INSERT INTO dbo.AddressType (description) VALUES ('Home');
INSERT INTO dbo.AddressType (description) VALUES ('Work');
INSERT INTO dbo.AddressType (description) VALUES ('Other');
-- =============================================
-- Script Template
-- =============================================

INSERT INTO dbo.ContactType (description) VALUES ('Home Phone');
INSERT INTO dbo.ContactType (description) VALUES ('Work Phone');
INSERT INTO dbo.ContactType (description) VALUES ('Cell Phone');
INSERT INTO dbo.ContactType (description) VALUES ('Other Phone');
INSERT INTO dbo.ContactType (description) VALUES ('Email');
-- =============================================
-- Script Template
-- =============================================

INSERT INTO Survey.Survey (name) VALUES ('Tea Party - Third Party Proposition');

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[TeaPartyMember] WITH CHECK CHECK CONSTRAINT [fk_TeaPartyMember_TeaPartyID];

ALTER TABLE [dbo].[TeaPartyMember] WITH CHECK CHECK CONSTRAINT [fk_TeaPartyMember_VoterID];

ALTER TABLE [dbo].[VoterAddress] WITH CHECK CHECK CONSTRAINT [fk_VoterAddress_Address_AddressID];

ALTER TABLE [dbo].[VoterAddress] WITH CHECK CHECK CONSTRAINT [fk_VoterAddress_AddressType_AddressTypeID];

ALTER TABLE [dbo].[VoterAddress] WITH CHECK CHECK CONSTRAINT [fk_VoterAddress_Voter_VoterID];

ALTER TABLE [dbo].[VoterContactInfo] WITH CHECK CHECK CONSTRAINT [fk_VoterContactInfo_ContactInfo_ContactInfoID];

ALTER TABLE [dbo].[VoterContactInfo] WITH CHECK CHECK CONSTRAINT [fk_VoterContactInfo_ContactType_ContactTypeID];

ALTER TABLE [dbo].[VoterContactInfo] WITH CHECK CHECK CONSTRAINT [fk_VoterContactInfo_Voter_VoterID];

ALTER TABLE [Survey].[SurveyQuestions] WITH CHECK CHECK CONSTRAINT [fk_SurveyQuestions_Questions_QuestionID];

ALTER TABLE [Survey].[SurveyQuestions] WITH CHECK CHECK CONSTRAINT [fk_SurveyQuestions_Survey_SurveyID];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        DECLARE @VarDecimalSupported AS BIT;
        SELECT @VarDecimalSupported = 0;
        IF ((ServerProperty(N'EngineEdition') = 3)
            AND (((@@microsoftversion / power(2, 24) = 9)
                  AND (@@microsoftversion & 0xffff >= 3024))
                 OR ((@@microsoftversion / power(2, 24) = 10)
                     AND (@@microsoftversion & 0xffff >= 1600))))
            SELECT @VarDecimalSupported = 1;
        IF (@VarDecimalSupported > 0)
            BEGIN
                EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
            END
    END


GO
