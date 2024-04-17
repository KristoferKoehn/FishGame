extends Camera3D

var character : CharacterBody3D = null
var cameraTransform1 = null 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if character == null:
		character = get_node("../Rogue")
	
	var horizontal_offset = Vector3(character.global_position.x, 0 , character.global_position.z)

	global_position = horizontal_offset + Vector3(-10,4,0)
	#var cameraNode: Node3D = get_node("../CameraPosition1")
	#var cameraNode: Node3D = character.get_node("CameraNode")
	
	#cameraTransform1 = cameraNode.global_transform
	#transform = transform.interpolate_with(cameraTransform1, 1 * delta)
		
