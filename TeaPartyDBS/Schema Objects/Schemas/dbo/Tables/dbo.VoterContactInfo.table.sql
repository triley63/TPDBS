CREATE TABLE dbo.VoterContactInfo
(
	voterContactInfoID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,voterID int NOT NULL
	,contactInfoID int NOT NULL
	,contactTypeID int NOT NULL
)
