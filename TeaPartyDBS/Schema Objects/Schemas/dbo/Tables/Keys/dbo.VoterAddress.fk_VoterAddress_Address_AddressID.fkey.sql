ALTER TABLE dbo.VoterAddress
	ADD CONSTRAINT fk_VoterAddress_Address_AddressID 
	FOREIGN KEY (addressID)
	REFERENCES dbo.Address(addressID)

