extends Node2D

var question

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	question = EducationManager.generateQuestion()
	$QuestionUI/MarginContainer/VBoxContainer/QuestionPrompt.text = question.questionPrompt
	$QuestionUI/MarginContainer/VBoxContainer/HBoxContainer/QuestionText.text = question.questionText
	var container = $QuestionUI/MarginContainer
	var scaleValue = (get_viewport_rect().size.x / 2) / container.size.x
	container.scale = Vector2(scaleValue,scaleValue)
	


func _on_submit_button_down() -> void:
	if $QuestionUI/MarginContainer/VBoxContainer/HBoxContainer/LineEdit.text == str(question.answer):
		EducationManager.completeQuestion(true)
		SceneSwitcher.popScene()
	else:
		var incorrectAnswerMenu = load("res://Scenes/Menus/QuestionMenu/IncorrectAnswerMenu/IncorrectAnswerMenu.tscn").instantiate()
		$QuestionUI/MarginContainer/VBoxContainer.add_child(incorrectAnswerMenu)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_on_submit_button_down()
