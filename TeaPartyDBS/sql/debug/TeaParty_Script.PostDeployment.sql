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
