CREATE TABLE dbo.Address
(
	addressID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,address1 varchar(50) NULL
	,address2 varchar(50) NULL
	,city varchar(25) NULL
	,state char(2) NULL
	,zipCode varchar(5) NULL
	,extendedZip varchar(4) NULL
)
