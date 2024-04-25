extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size / 2
	var center = get_viewport_rect().size / 2
	var scaleValue = (get_viewport_rect().size.x / 2) / size.x
	scale = Vector2(scaleValue,scaleValue)
	position = center - (size / 2)
