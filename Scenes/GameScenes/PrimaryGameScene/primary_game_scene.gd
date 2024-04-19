extends Node3D

var rewardCounter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/Label.text = str(rewardCounter)
	EducationManager.questionCompleted.connect(getReward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	EducationManager.generateQuestionScene()
	

func getReward(success: bool) -> void:
	if success:
		rewardCounter = rewardCounter + 1
	$HBoxContainer/Label.text = str(rewardCounter)
