CREATE TABLE dbo.Voter
(
	voterID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,firstName varchar(50) NOT NULL
	,lastName varchar(50) NOT NULL
	,stateVoterID int NULL
)
