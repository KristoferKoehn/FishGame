extends CharacterBody2D

var speed = 600
var TURN_SPEED = 3
var center = null
var hook = null
var ratio = 2
var scalingFactor = 0.75

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hook = $"../CharacterBody2D/Bobber/Hook"
	center = get_viewport_rect().size / 2
	global_position = center + Vector2(randi_range(-200,201), randi_range(-200,201))
	look_at(hook.global_position)
	velocity = Vector2(1,0) * speed
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var escapeHookVector = (global_position - hook.global_position).normalized()
	var xScalar = abs((center.x * scalingFactor) - global_position.x) / (center.x * scalingFactor)
	var yScalar = abs((center.y * scalingFactor) - global_position.y) / (center.y * scalingFactor)
	var avoidWallsVector = (center - global_position).normalized()
	avoidWallsVector = Vector2(avoidWallsVector.x * xScalar, avoidWallsVector.y * yScalar) * ratio
	var direction = (escapeHookVector + avoidWallsVector).normalized()
	
	var targetTransform = transform.looking_at(global_position - direction)
	transform = transform.interpolate_with(targetTransform, TURN_SPEED * delta)
	
	velocity = Vector2(-speed,0).rotated(rotation)
	
	move_and_slide()
