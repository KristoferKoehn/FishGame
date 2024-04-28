extends Node

var skybox : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func register_skybox(sky_box : Node3D) -> void:
	skybox = sky_box

func get_time() -> float: 
	return skybox.day_time
