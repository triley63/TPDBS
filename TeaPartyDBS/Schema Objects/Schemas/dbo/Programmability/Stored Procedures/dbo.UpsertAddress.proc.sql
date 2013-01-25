CREATE PROCEDURE dbo.UpsertAddress
	@address1 varchar(50)
	,@address2 varchar(50)
	,@city varchar(25)
	,@state varchar(2)
	,@zip varchar(5)
	,@extendedZip varchar(4)
	,@addressID int = 0 OUTPUT
AS
BEGIN
	SELECT @addressID = addressID
	FROM dbo.Address
	WHERE address1 = @address1
		AND address2 = @address2
		AND city = @city
		AND state = @state
		AND zipCode = @zip
		AND extendedZip = @extendedZip

	IF (@addressID = 0)
	BEGIN
		INSERT INTO dbo.Address (address1, address2, city, state, zipCode, extendedZip)
		VALUES (@address1, @address2, @city, @state, @zip, @extendedZip);

		SELECT @addressID = SCOPE_IDENTITY();
	END
END