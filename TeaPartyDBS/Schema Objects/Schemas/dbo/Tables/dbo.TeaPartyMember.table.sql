CREATE TABLE dbo.TeaPartyMember
(
	teaPartyMemberID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,voterID int NOT NULL
	,teaPartyID int NOT NULL
)
