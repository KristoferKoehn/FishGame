extends Node2D

var question

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	question = EducationManager.generateQuestion()
	$QuestionUI/Panel/MarginContainer/VBoxContainer/QuestionPrompt.text = question.questionPrompt
	$QuestionUI/Panel/MarginContainer/VBoxContainer/HBoxContainer/QuestionText.text = question.questionText
	var container : Control = $QuestionUI/Panel
	var scaleValue = (get_viewport_rect().size.x / 2) / container.size.x
	container.scale = Vector2(scaleValue,scaleValue)
	
	container.pivot_offset = container.size / 2
	var center = get_viewport_rect().size / 2
	container.position = center - (container.size / 2)

func _on_submit_button_down() -> void:
	if $QuestionUI/Panel/MarginContainer/VBoxContainer/HBoxContainer/LineEdit.text == str(question.answer):
		EducationManager.completeQuestion(true)
		#SceneSwitcher.popScene()
		queue_free()
	else:
		if $QuestionUI/Panel/MarginContainer/VBoxContainer.get_node_or_null("IncorrectAnswerMenu") != null:
			pass
		else:
			var incorrectAnswerMenu: Node = load("res://Scenes/Menus/QuestionMenu/IncorrectAnswerMenu/IncorrectAnswerMenu.tscn").instantiate()
			$QuestionUI/Panel/MarginContainer/VBoxContainer.add_child(incorrectAnswerMenu)
			$QuestionUI/Panel.size.y = $QuestionUI/Panel.size.y + incorrectAnswerMenu.find_child("MarginContainer").size.y

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_on_submit_button_down()
