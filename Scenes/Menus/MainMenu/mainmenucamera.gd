extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().progress += 0.05


func _physics_process(delta: float) -> void:
	global_position = get_parent().global_position
	look_at(Vector3(0,0,0))
