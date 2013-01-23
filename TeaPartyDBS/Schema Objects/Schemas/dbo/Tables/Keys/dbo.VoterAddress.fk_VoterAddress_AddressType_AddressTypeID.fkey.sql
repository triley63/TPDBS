ALTER TABLE dbo.VoterAddress
	ADD CONSTRAINT fk_VoterAddress_AddressType_AddressTypeID 
	FOREIGN KEY (addressTypeID)
	REFERENCES dbo.AddressType(addressTypeID)

