extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_quit_button_down() -> void:
	var ui: Node = get_parent().get_parent()
	var baitSelection: Node = ui.find_child("BaitSelection", false, false)
	baitSelection.visible = true
	get_parent().queue_free()


func _on_retry_button_down() -> void:
	EducationManager.questionCompleted.connect(getReward)
	$VBoxContainer.visible = false
	var scene : Node = SceneSwitcher.instantiateScene("res://Scenes/Menus/QuestionMenu/QuestionMenu.tscn")
	add_child(scene)

func getReward(success: bool) -> void:
	EducationManager.questionCompleted.disconnect(getReward)
	if success:
		SceneSwitcher.replaceSelfOnParent(get_parent(), "res://Scenes/GameScenes/FishingMiniGame/FishingMiniGame.tscn")
	else:
		$VBoxContainer.visible = true
