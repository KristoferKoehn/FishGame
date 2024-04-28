extends QuestionGenerator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func generateQuestion() -> void:
	var questionHistory: Dictionary = EducationManager.questionHistory
	var recentLength: int = EducationManager.recentLength
	var numToBeat: int = 0
	var SelectedQuestionType = null
	
	var keys = questionHistory.keys()
	keys.erase("allTypes")
	
	for key in keys:
		var history = questionHistory[key]
		var totalAttempted = history[2]
		if totalAttempted > 0 && totalAttempted < recentLength && totalAttempted > numToBeat:
			numToBeat = totalAttempted
			SelectedQuestionType = key
	
	if SelectedQuestionType == null:
		numToBeat = recentLength
		for key in keys:
			var history = questionHistory[key]
			var recentCorrect = history[0]
			var totalAttempted = history[2]
			if totalAttempted > 0 && recentCorrect <= numToBeat:
				numToBeat = recentCorrect
				SelectedQuestionType = key
		
		if numToBeat == recentLength: # all scores are maxed
			SelectedQuestionType = keys.pick_random()
	
	copyValuesFromSelectedGenerator(SelectedQuestionType)

func copyValuesFromSelectedGenerator(selectedGeneratorString: String) -> void:
	var selectedGenerator: QuestionGenerator = null
	if selectedGeneratorString == "additionSingle":
		selectedGenerator = EducationManager.additionSingleDigitQuestionGenerator
	if selectedGeneratorString == "additionDouble":
		selectedGenerator = EducationManager.additionDoubleDigitQuestionGenerator
	if selectedGeneratorString == "subtractionSingle":
		selectedGenerator = EducationManager.subtractionSingleDigitQuestionGenerator
	if selectedGeneratorString == "subtractionDouble":
		selectedGenerator = EducationManager.subtractionDoubleDigitQuestionGenerator
	if selectedGeneratorString == "multiplicationSingle":
		selectedGenerator = EducationManager.multiplicationSingleDigitQuestionGenerator
	if selectedGeneratorString == "multiplicationDouble":
		selectedGenerator = EducationManager.multiplicationDoubleDigitQuestionGenerator
	if selectedGeneratorString == "divisionSingle":
		selectedGenerator = EducationManager.divisionSingleDigitQuestionGenerator
	if selectedGeneratorString == "divisionDouble":
		selectedGenerator = EducationManager.divisionDoubleDigitQuestionGenerator
	
	selectedGenerator.generateQuestion()
	questionType = selectedGenerator.questionType
	questionPrompt = selectedGenerator.questionPrompt
	firstOperand = selectedGenerator.firstOperand
	secondOperand = selectedGenerator.secondOperand
	answer = selectedGenerator.answer
	questionText = selectedGenerator.questionText
