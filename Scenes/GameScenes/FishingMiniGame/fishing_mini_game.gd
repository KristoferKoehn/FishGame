extends Node2D

var fish = null
var hook = null
var time = 0
var timeLimit = 10
signal fishCaught(success: bool)
var distanceCutoff = 200
var successTimeLimit = 6
var successTime = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish = $Fish
	hook = $CharacterBody2D/Bobber/Hook


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time + delta
	if time >= timeLimit:
		# Mission Failed
		fishCaught.emit(false)
		#queue_free()
	
	var distance = abs(hook.global_position - fish.global_position).length()
	if distance < distanceCutoff:
		successTime = successTime + delta
	
	if successTime >= successTimeLimit:
		# successful catch
		fishCaught.emit(true)
		#queue_free()
