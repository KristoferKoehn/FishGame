extends VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size / 2
	var center = get_viewport_rect().size / 2.
	var scaleValue = (center.x) / size.x
	scale = Vector2(scaleValue,scaleValue)
	position = center - (size / 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
