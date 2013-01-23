ALTER TABLE dbo.TeaPartyMember
	ADD CONSTRAINT fk_TeaPartyMember_VoterID 
	FOREIGN KEY (voterID)
	REFERENCES dbo.Voter (voterID)	

