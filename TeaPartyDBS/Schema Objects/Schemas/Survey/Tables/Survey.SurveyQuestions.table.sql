CREATE TABLE Survey.SurveyQuestions
(
	surveyQuestionsID int IDENTITY (1,1) NOT NULL PRIMARY KEY
	,surveyID int NOT NULL
	,questionID int NOT NULL
)
