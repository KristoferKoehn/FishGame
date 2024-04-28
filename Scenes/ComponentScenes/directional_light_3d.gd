extends DirectionalLight3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = TimeManager.get_time()
	if time < 8 || time > 18:
		visible = true
		print("night light " + str(time))
	else:
		print("night light off" + str(time))
		visible = false
