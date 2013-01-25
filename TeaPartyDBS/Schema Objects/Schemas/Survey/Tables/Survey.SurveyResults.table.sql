CREATE TABLE Survey.SurveyResults
(
	surveResultsID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,voterID int NOT NULL
	,surveyQuestionsID int NOT NULL
	,result int NULL
)
