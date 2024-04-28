extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var center = get_viewport_rect().size / 2
	pivot_offset = size / 2
	position = center - pivot_offset
