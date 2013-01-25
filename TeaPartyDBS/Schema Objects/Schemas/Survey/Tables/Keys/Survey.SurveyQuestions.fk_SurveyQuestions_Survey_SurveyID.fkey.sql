ALTER TABLE Survey.SurveyQuestions
	ADD CONSTRAINT fk_SurveyQuestions_Survey_SurveyID 
	FOREIGN KEY (surveyID)
	REFERENCES Survey.Survey(surveyID)

