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
	
	if cameraTransform1 == null:
		var cameraNode: Node3D = get_node("../CameraPosition1")
		cameraTransform1 = cameraNode.transform
	else:
		transform = transform.interpolate_with(cameraTransform1, 0.1 * delta)
		
