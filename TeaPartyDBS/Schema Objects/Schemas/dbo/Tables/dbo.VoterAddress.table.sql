CREATE TABLE dbo.VoterAddress
(
	voterAddressID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,voterID int NOT NULL
	,addressID int NOT NULL
	,addressTypeID int NOT NULL
)
