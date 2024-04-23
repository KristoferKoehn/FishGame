extends Node2D

var fish = null
var hook = null
var time = 0
var timeLimit = 20
signal fishCaught(success: bool)
var distanceCutoff = 200
var successTimeLimit = 5
var successTime = 0
var catchBar = null
var countDown = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish = $Fish
	hook = $CharacterBody2D/Bobber/Hook
	catchBar = $ProgressBar
	countDown = $CountDown


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time = time + delta
	countDown.text = str(int(timeLimit - time))
	
	if time >= timeLimit: # TODO: Offer retry
		# Mission Failed
		fishCaught.emit(false)
		queue_free()
	
	var distance = abs(hook.global_position - fish.global_position).length()
	if distance < distanceCutoff:
		successTime = successTime + delta
		catchBar.value = successTime / successTimeLimit
	
	if successTime >= successTimeLimit:
		# successful catch
		fishCaught.emit(true)
		queue_free()
