extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size / 2
	var center = get_viewport_rect().size / 2.
	var scaleValue = (center.x) / size.x
	scale = Vector2(scaleValue,scaleValue)
	global_position = center - (size / 2)
