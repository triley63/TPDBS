CREATE PROCEDURE Survey.AddSurveyQuestion
	@surveyID int
	,@question varchar(255)
	,@questionID int OUTPUT
AS
BEGIN
	INSERT INTO Survey.Questions (question) VALUES (@question);
	
	SELECT @questionID = SCOPE_IDENTITY();
END