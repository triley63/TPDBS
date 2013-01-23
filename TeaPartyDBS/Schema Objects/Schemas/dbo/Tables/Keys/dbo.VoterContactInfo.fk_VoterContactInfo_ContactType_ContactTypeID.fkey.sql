ALTER TABLE dbo.VoterContactInfo
	ADD CONSTRAINT fk_VoterContactInfo_ContactType_ContactTypeID 
	FOREIGN KEY (contactTypeID)
	REFERENCES dbo.ContactType(contactTypeID)

