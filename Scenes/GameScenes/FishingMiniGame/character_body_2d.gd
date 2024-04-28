extends CharacterBody2D

var speed = 600.0
var defaultSpeed = 600
var sprintSpeed = 900
var turnSpeed = 3

func _ready() -> void:
	position = get_viewport_rect().size / 2

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "forward", "back")
	
	if Input.is_action_pressed("sprint"):
		speed = sprintSpeed
	else:
		speed = defaultSpeed
	
	if direction:
		if !$"../AudioStreamPlayer2D".playing:
			$"../AudioStreamPlayer2D".play()
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
		var targetTransform = transform.looking_at(global_position - direction)
		transform = transform.interpolate_with(targetTransform, turnSpeed * delta)
	else:
		if $"../AudioStreamPlayer2D".playing:
			$"../AudioStreamPlayer2D".stop()
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()
