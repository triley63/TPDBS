ALTER TABLE dbo.VoterAddress
	ADD CONSTRAINT fk_VoterAddress_Voter_VoterID 
	FOREIGN KEY (voterID)
	REFERENCES dbo.Voter(voterID)

