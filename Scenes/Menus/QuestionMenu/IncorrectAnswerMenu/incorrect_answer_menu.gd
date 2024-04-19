extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_retry_button_down() -> void:
	$".".get_parent().remove_child($".")

func _on_quit_button_down() -> void:
	EducationManager.completeQuestion(false)
	SceneSwitcher.popScene()
