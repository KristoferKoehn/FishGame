extends CharacterBody3D

var camera: Camera3D = null

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 10
const locomotionBlendPositionVector = Vector2.ZERO
const locomotionBlendPositionSpeed = 3.5

func _ready() -> void:
	camera = get_node("../Camera3D") as Camera3D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (camera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		var targetTransform = transform.looking_at(global_position - direction)
		
		transform = transform.interpolate_with(targetTransform, TURN_SPEED * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
