extends Node

var questionSettings: QuestionSettings = null
var questionGenerators : Array = []
var aditionSingleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/AdditionQuestionGenerators/AdditionSingleDigitQuestionGenerator/addition_single_digit_question_generator.tscn").instantiate()
var aditionDoubleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/AdditionQuestionGenerators/AdditionDoubleDigitQuestionGenerator/addition_double_digit_question_generator.tscn").instantiate()
var subtractionSingleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/SubtractionQuestionGenerators/SubtractionSingleDigitQuestionGenerator/subtraction_single_digit_question_generator.tscn").instantiate()
var subtractionDoubleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/SubtractionQuestionGenerators/SubtractionDoubleDigitQuestionGenerator/subtraction_double_digit_question_generator.tscn").instantiate()
var multiplicationSingleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/MultiplicationQuestionGenerators/MultiplicationSingleDigitQuestionGenerator/multiplication_single_digit_question_generator.tscn").instantiate()
var multiplicationDoubleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/MultiplicationQuestionGenerators/MultiplicationDoubleDigitQuestionGenerator/multiplication_double_digit_question_generator.tscn").instantiate()
var divisionSingleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/DivisionQuestionGenerators/DivisionSingleDigitQuestionGenerator/division_single_digit_question_generator.tscn").instantiate()
var divisionDoubleDigitQuestionGenerator: QuestionGenerator = load("res://Scenes/Managers/EducationManager/QuestionGenerators/DivisionQuestionGenerators/DivisionDoubleDigitQuestionGenerator/division_double_digit_question_generator.tscn").instantiate()
signal questionCompleted(success: bool)
var currentGenerator: QuestionGenerator  = null
var questionHistory: Dictionary = {"additionSingle": [0,0,0], "additionDouble": [0,0,0], "subtractionSingle": [0,0,0], "subtractionDouble": [0,0,0], "multiplicationSingle": [0,0,0], "multiplicationDouble": [0,0,0], "divisionSingle": [0,0,0], "divisionDouble": [0,0,0], "allTypes": [0,0,0]}
var recentLength: int = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questionSettings = $QuestionSettings
	var fileExists = FileAccess.file_exists("user://question_settings.dat")
	if !fileExists:
		generateSettingsFile()
	
	var file = FileAccess.open("user://question_settings.dat", FileAccess.READ)
	var settingString = file.get_as_text()
	file.close()
	questionSettings.updateFromSettingsCode(settingString)
	
	toggleAdditionSingleDigitQuestionGenerator(questionSettings.AdditionSingleDigit)
	toggleAdditionDoubleDigitQuestionGenerator(questionSettings.AdditionDoubleDigit)
	toggleSubtractionSingleDigitQuestionGenerator(questionSettings.SubtractionSingleDigit)
	toggleSubtractionDoubleDigitQuestionGenerator(questionSettings.SubtractionDoubleDigit)
	toggleMultiplicationSingleDigitQuestionGenerator(questionSettings.MultiplicationSingleDigit)
	toggleMultiplicationDoubleDigitQuestionGenerator(questionSettings.MultiplicationDoubleDigit)
	toggleDivisionSingleDigitQuestionGenerator(questionSettings.DivisionSingleDigit)
	toggleDivisionDoubleDigitQuestionGenerator(questionSettings.DivisionDoubleDigit)
	
	loadQuestionHistory()

func generateSettingsFile() -> void:
	questionSettings.AdditionSingleDigit = true
	var settingString = questionSettings.ConvertToString()
	var file = FileAccess.open("user://question_settings.dat", FileAccess.WRITE)
	file.store_string(settingString)
	file.close()

func generateQuestionScene() -> void:
	SceneSwitcher.instantiateAndPushScene("res://Scenes/Menus/QuestionMenu/QuestionMenu.tscn")

func generateQuestion() -> QuestionGenerator:
	var selection = randi_range(0, questionGenerators.size() - 1)
	currentGenerator = questionGenerators[selection]
	currentGenerator.generateQuestion()
	return currentGenerator

func completeQuestion(success: bool) -> void:
	updateQuestionHistory("allTypes", success)
	updateQuestionHistory(currentGenerator.questionType, success)
	questionCompleted.emit(success)

func updateQuestionHistory(questionType: String, success: bool) -> void:
	var questionHistoryData = questionHistory[questionType]
	var recentCorrect = questionHistoryData[0]
	var totalCorrect = questionHistoryData[1]
	var totalAttempted = questionHistoryData[2]
	
	totalAttempted += 1
	if success:
		totalCorrect += 1
		recentCorrect += 1
		if recentCorrect > recentLength:
			recentCorrect = recentLength
	else:
		if totalAttempted > recentLength:
			recentCorrect -= 1
			if recentCorrect < 0:
				recentCorrect = 0
	
	questionHistoryData[0] = recentCorrect
	questionHistoryData[1] = totalCorrect
	questionHistoryData[2] = totalAttempted
	
	questionHistory[questionType] = questionHistoryData
	saveQuestionHistory()

func toggleAdditionSingleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, aditionSingleDigitQuestionGenerator)

func toggleAdditionDoubleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, aditionDoubleDigitQuestionGenerator)
	
func toggleSubtractionSingleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, subtractionSingleDigitQuestionGenerator)
	
func toggleSubtractionDoubleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, subtractionDoubleDigitQuestionGenerator)

func toggleMultiplicationSingleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, multiplicationSingleDigitQuestionGenerator)

func toggleMultiplicationDoubleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, multiplicationDoubleDigitQuestionGenerator)

func toggleDivisionSingleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, divisionSingleDigitQuestionGenerator)

func toggleDivisionDoubleDigitQuestionGenerator(toggle: bool) -> void:
	toggleGenerator(toggle, divisionDoubleDigitQuestionGenerator)

func toggleGenerator(toggle: bool, generator: QuestionGenerator) -> void:
	if toggle:
		questionGenerators.append(generator)
	else:
		questionGenerators.erase(generator)

func loadQuestionHistory() -> void:
	var fileExists = FileAccess.file_exists("user://question_history.dat")
	if !fileExists:
		saveQuestionHistory()
	
	var file = FileAccess.open("user://question_history.dat", FileAccess.READ)
	var historyString = file.get_as_text()
	file.close()
	
	questionHistory = JSON.parse_string(historyString)

func saveQuestionHistory() -> void:
	var historyString = JSON.stringify(questionHistory)
	var file = FileAccess.open("user://question_history.dat", FileAccess.WRITE)
	file.store_string(historyString)
	file.close()
