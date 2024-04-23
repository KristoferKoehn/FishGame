extends CharacterBody2D

var SPEED = 600.0
var TURN_SPEED = 3

func _ready() -> void:
	position = get_viewport_rect().size / 2

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "forward", "back")
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
		var targetTransform = transform.looking_at(global_position - direction)
		transform = transform.interpolate_with(targetTransform, TURN_SPEED * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
