ALTER TABLE dbo.VoterContactInfo
	ADD CONSTRAINT fk_VoterContactInfo_ContactInfo_ContactInfoID 
	FOREIGN KEY (contactInfoID)
	REFERENCES dbo.ContactInfo(contactInfoID)

