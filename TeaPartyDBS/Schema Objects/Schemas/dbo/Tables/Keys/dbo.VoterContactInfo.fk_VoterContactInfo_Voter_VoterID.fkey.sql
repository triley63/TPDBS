ALTER TABLE dbo.VoterContactInfo
	ADD CONSTRAINT fk_VoterContactInfo_Voter_VoterID 
	FOREIGN KEY (voterID)
	REFERENCES dbo.Voter(voterID)

