extends Control

var questionSettings: QuestionSettings = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questionSettings = EducationManager.questionSettings
	
	var additionSingleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer/AdditionContainer/AdditionOptionsContainer/AdditionSingleDigitOptionContainer/AdditionSingleDigitCheckBox
	additionSingleDigitCheckBox.set_pressed_no_signal(questionSettings.AdditionSingleDigit)
	
	var additionDoubleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer/AdditionContainer/AdditionOptionsContainer/AdditionDoubleDigitOptionContainer/AdditionDoubleDigitCheckBox
	additionDoubleDigitCheckBox.set_pressed_no_signal(questionSettings.AdditionDoubleDigit)
	
	var subtractionSingleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer2/SubtractionContainer/SubtractionOptionsContainer/SubtractionSingleDigitOptionContainer/SubtractionSingleDigitCheckBox
	subtractionSingleDigitCheckBox.set_pressed_no_signal(questionSettings.SubtractionSingleDigit)
	
	var subtractionDoubleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer2/SubtractionContainer/SubtractionOptionsContainer/SubtractionDoubleDigitOptionContainer/SubtractionDoubleDigitCheckBox
	subtractionDoubleDigitCheckBox.set_pressed_no_signal(questionSettings.SubtractionDoubleDigit)
	
	var multiplicationSingleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer3/MultiplicationContainer/MultiplicationOptionsContainer/MultiplicationSingleDigitOptionContainer/MultiplicationSingleDigitCheckBox
	multiplicationSingleDigitCheckBox.set_pressed_no_signal(questionSettings.MultiplicationSingleDigit)
	
	var multiplicationDoubleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer3/MultiplicationContainer/MultiplicationOptionsContainer/MultiplicationDoubleDigitOptionContainer/MultiplicationDoubleDigitCheckBox
	multiplicationDoubleDigitCheckBox.set_pressed_no_signal(questionSettings.MultiplicationDoubleDigit)
	
	var divisionSingleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer4/DivisionContainer/DivisionOptionsContainer/DivisionSingleDigitOptionContainer/DivisionSingleDigitCheckBox
	divisionSingleDigitCheckBox.set_pressed_no_signal(questionSettings.DivisionSingleDigit)
	
	var divisionDoubleDigitCheckBox = $QuestionSettingsVBox/QuestionSettingsContainer/MarginContainer4/DivisionContainer/DivisionOptionsContainer/DivisionDoubleDigitOptionContainer/DivisionDoubleDigitCheckBox
	divisionDoubleDigitCheckBox.set_pressed_no_signal(questionSettings.DivisionDoubleDigit)

func _on_addition_single_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.AdditionSingleDigit = toggled_on
	EducationManager.toggleAdditionSingleDigitQuestionGenerator(toggled_on)

func _on_addition_double_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.AdditionDoubleDigit = toggled_on
	EducationManager.toggleAdditionDoubleDigitQuestionGenerator(toggled_on)

func _on_subtraction_single_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.SubtractionSingleDigit = toggled_on
	EducationManager.toggleSubtractionSingleDigitQuestionGenerator(toggled_on)

func _on_subtraction_double_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.SubtractionDoubleDigit = toggled_on
	EducationManager.toggleSubtractionDoubleDigitQuestionGenerator(toggled_on)

func _on_multiplication_single_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.MultiplicationSingleDigit = toggled_on
	EducationManager.toggleMultiplicationSingleDigitQuestionGenerator(toggled_on)
	
func _on_multiplication_double_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.MultiplicationDoubleDigit = toggled_on
	EducationManager.toggleMultiplicationDoubleDigitQuestionGenerator(toggled_on)

func _on_division_single_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.DivisionSingleDigit = toggled_on
	EducationManager.toggleDivisionSingleDigitQuestionGenerator(toggled_on)
	
func _on_division_double_digit_check_box_toggled(toggled_on: bool) -> void:
	questionSettings.DivisionDoubleDigit = toggled_on
	EducationManager.toggleDivisionDoubleDigitQuestionGenerator(toggled_on)

func _on_target_weaknesses_toggled(toggled_on: bool) -> void:
	questionSettings.TargetWeaknesses = toggled_on
	EducationManager.toggleTargetWeaknesses(toggled_on)

func _on_save_button_down() -> void:
	var isValid = questionSettings.CheckIsValid()
	if isValid:
		var settingsString = questionSettings.ConvertToString()
		var file = FileAccess.open("user://question_settings.dat", FileAccess.WRITE)
		file.store_string(settingsString)
		file.close()
		
		# Go back to main menu
		SceneSwitcher.popScene()
	else:
		# Display Error message
		pass
