CREATE PROCEDURE dbo.AddImportData
	@firstName varchar(50)
	,@lastName varchar(50)
	,@ID int OUTPUT
AS
BEGIN
	INSERT INTO dbo.Voter (firstName, lastName)
	VALUES (@firstName, @lastName);

	SELECT @ID = SCOPE_IDENTITY();
END