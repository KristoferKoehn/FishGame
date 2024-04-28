extends Control

var recentLength
var questionHistory: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questionHistory = EducationManager.questionHistory
	setRecentLength("additionSingle")
	$VBoxContainer/SingleDigitAddition/Recent.text = str(questionHistory["additionSingle"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/SingleDigitAddition/Lifetime.text = str(questionHistory["additionSingle"][1]) + " / " + str(questionHistory["additionSingle"][2]) + " correct"
	setRecentLength("additionDouble")
	$VBoxContainer/DoubleDigitAddition/Recent.text = str(questionHistory["additionDouble"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/DoubleDigitAddition/Lifetime.text = str(questionHistory["additionDouble"][1]) + " / " + str(questionHistory["additionDouble"][2]) + " correct"
	
	setRecentLength("subtractionSingle")
	$VBoxContainer/SingleDigitSubtraction/Recent.text = str(questionHistory["subtractionSingle"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/SingleDigitSubtraction/Lifetime.text = str(questionHistory["subtractionSingle"][1]) + " / " + str(questionHistory["subtractionSingle"][2]) + " correct"
	setRecentLength("subtractionDouble")
	$VBoxContainer/DoubleDigitSubtraction/Recent.text = str(questionHistory["subtractionDouble"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/DoubleDigitSubtraction/Lifetime.text = str(questionHistory["subtractionDouble"][1]) + " / " + str(questionHistory["subtractionDouble"][2]) + " correct"
	
	setRecentLength("multiplicationSingle")
	$VBoxContainer/SingleDigitMultiplication/Recent.text = str(questionHistory["multiplicationSingle"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/SingleDigitMultiplication/Lifetime.text = str(questionHistory["multiplicationSingle"][1]) + " / " + str(questionHistory["multiplicationSingle"][2]) + " correct"
	setRecentLength("multiplicationDouble")
	$VBoxContainer/DoubleDigitMultiplication/Recent.text = str(questionHistory["multiplicationDouble"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/DoubleDigitMultiplication/Lifetime.text = str(questionHistory["multiplicationDouble"][1]) + " / " + str(questionHistory["multiplicationDouble"][2]) + " correct"
	
	setRecentLength("divisionSingle")
	$VBoxContainer/SingleDigitDivision/Recent.text = str(questionHistory["divisionSingle"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/SingleDigitDivision/Lifetime.text = str(questionHistory["divisionSingle"][1]) + " / " + str(questionHistory["divisionSingle"][2]) + " correct"
	setRecentLength("divisionDouble")
	$VBoxContainer/DoubleDigitDivision/Recent.text = str(questionHistory["divisionDouble"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/DoubleDigitDivision/Lifetime.text = str(questionHistory["divisionDouble"][1]) + " / " + str(questionHistory["divisionDouble"][2]) + " correct"
	
	setRecentLength("allTypes")
	$VBoxContainer/AllTypes/Recent.text = str(questionHistory["allTypes"][0]) + " / " + recentLength + " correct"
	$VBoxContainer/AllTypes/Lifetime.text = str(questionHistory["allTypes"][1]) + " / " + str(questionHistory["allTypes"][2]) + " correct"
	

func setRecentLength(questionType: String) -> void:
	recentLength = EducationManager.recentLength
	var totalQuestionsOfType = questionHistory[questionType][2]
	if recentLength > totalQuestionsOfType:
		recentLength = totalQuestionsOfType
	recentLength = str(recentLength)


func _on_continue_button_down() -> void:
	get_parent().find_child("PausePanel", true, false).visible = true
	queue_free()
