extends Panel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		if get_parent().pause_pressed == true:
			get_parent().pause_pressed = false
			return
		get_tree().paused = false
		visible = false
		print("unpause")
