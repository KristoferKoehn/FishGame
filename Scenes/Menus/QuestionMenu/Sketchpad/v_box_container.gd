extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	custom_minimum_size.x = get_parent().get_parent().size.x

