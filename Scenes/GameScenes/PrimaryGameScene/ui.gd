extends Control

var rewardCounter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/Count.text = str(rewardCounter)
	EducationManager.questionCompleted.connect(getReward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func getReward(success: bool) -> void:
	if success:
		rewardCounter = rewardCounter + 1
	$HBoxContainer/Count.text = str(rewardCounter)


func _on_get_question_button_down() -> void:
	EducationManager.generateQuestionScene()
