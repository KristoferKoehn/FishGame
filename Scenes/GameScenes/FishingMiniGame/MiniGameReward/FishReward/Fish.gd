extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate(Vector3(0,1,0), 0.05)

func r_tween():
	var t : Tween = get_tree().create_tween()
	t.tween_property(self, "rotation", Vector3( 1 - (randf() * 2),1 - (randf() * 2),1 - (randf() * 2)), 1)
	t.tween_callback(r_tween)
