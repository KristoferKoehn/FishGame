extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_retry_button_down() -> void:
	deleteSelf()

func _on_quit_button_down() -> void:
	EducationManager.completeQuestion(false)
	$".".get_parent().get_parent().get_parent().get_parent().get_parent().queue_free() # There is for sure a better way to do this
	
func deleteSelf() -> void:
	var panel = $".".get_parent().get_parent().get_parent()
	panel.size.y = panel.size.y - $MarginContainer.size.y
	$".".get_parent().remove_child($".")
