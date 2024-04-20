extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EducationManager.questionCompleted.connect(getReward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Panel/HBoxContainer/MarginContainer/HBoxContainer/WormCount.text = str(CurrencyManager.worms)
	$Panel/HBoxContainer/MarginContainer2/HBoxContainer/SuperWormCount.text = str(CurrencyManager.superworms)
	$Panel/HBoxContainer/MarginContainer3/HBoxContainer/GoldCount.text = str(CurrencyManager.gold)
	$Panel/HBoxContainer/MarginContainer4/HBoxContainer/PearlCount.text = str(CurrencyManager.pearls)
	pass


func getReward(success: bool) -> void:
	if success:
		CurrencyManager.gold += 1


func _on_get_question_button_down() -> void:
	EducationManager.generateQuestionScene()
