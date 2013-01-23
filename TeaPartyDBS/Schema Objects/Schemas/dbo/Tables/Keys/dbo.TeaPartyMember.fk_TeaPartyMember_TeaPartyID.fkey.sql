ALTER TABLE dbo.TeaPartyMember
	ADD CONSTRAINT fk_TeaPartyMember_TeaPartyID 
	FOREIGN KEY (teaPartyID)
	REFERENCES dbo.TeaParty (teaPartyID)

