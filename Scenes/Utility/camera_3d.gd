class_name MainCamera
extends Camera3D

var character : CharacterBody3D = null
var alternate_follow : Node3D = null

@export var default_offset : Vector3 = Vector3(-10,4,0)

@export var follow_coefficient : float = 0.8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CameraManager.Camera = self
	character = get_node("../Rogue")
	var node : Node3D = character.get_node("CameraAttachPoint")
	CameraManager.default_follow = node
	CameraManager.assign_follow_point(character.get_node("CameraAttachPoint"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if character == null:
		character = get_node("../Rogue")
	
	if alternate_follow == null:
		var horizontal_offset = Vector3(character.global_position.x, 0 , character.global_position.z)
		global_position = horizontal_offset + default_offset
	else:
		global_transform = global_transform.interpolate_with(alternate_follow.global_transform, follow_coefficient * delta)
