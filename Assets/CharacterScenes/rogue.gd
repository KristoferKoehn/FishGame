class_name Rogue
extends CharacterBody3D

var camera: Camera3D = null

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const TURN_SPEED = 10
const locomotionBlendPositionVector = Vector2.ZERO
const locomotionBlendPositionSpeed = 3.5

var ContextNode = null
var InputLockout : bool = false

func _ready() -> void:
	MusicManager.start_music()
	camera = get_node("../Camera3D") as Camera3D
	$CameraAttachPoint.global_position = global_position + Vector3(-10, 4, 0)
	CustomizationManager.register_player(self)


func _physics_process(delta: float) -> void:
	$CameraAttachPoint.global_position = global_position + Vector3(-10, 4, 0)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if !InputLockout:
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir := Input.get_vector("left", "right", "forward", "back")
		var direction := (camera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			$AnimationPlayer.play("Running_A")
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			var targetTransform = transform.looking_at(global_position - direction)
			
			transform = transform.interpolate_with(targetTransform, TURN_SPEED * delta)
		else:
			$AnimationPlayer.play("Idle")
			
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event):
	if event.is_action_pressed("interact") || event.is_action_pressed("fish"):
		if ContextNode != null && !InputLockout:
			ContextNode.player_locked = true
			tween_to_node()
			InputLockout = true;
			ContextNode.interacted()
	

func tween_to_node() -> void:
	var tween = get_tree().create_tween()
	var point_transform = ContextNode.get_node("ContextSnapPoint").global_transform
	tween.tween_property(self, "transform", point_transform, 0.4)
