extends Node2D

var fish = null
var hook = null
var time = 0
var timeLimit = 20
var distanceCutoff = 200
var successTime = 0
var successTimeLimit = 5
var catchBar = null
var countDown = null
var countingDown = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish = $Fish
	hook = $CharacterBody2D/Bobber/Hook
	catchBar = $Control/ProgressBar
	countDown = $Control/CountDown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if countingDown:
		time = time + delta
		countDown.text = str(int(timeLimit - time))
	
		if time >= timeLimit: 
			# Mission Failed
			countingDown = false
			$CharacterBody2D.visible = false
			$Fish.visible = false
			var scene: Node = SceneSwitcher.instantiateScene("res://Scenes/GameScenes/FishingMiniGame/MiniGameComplete/MiniGameLost/MiniGameLost.tscn")
			add_child(scene)
		
		var distance = abs(hook.global_position - fish.global_position).length()
		if distance < distanceCutoff:
			successTime = successTime + delta
			catchBar.value = successTime / successTimeLimit
		
		if successTime >= successTimeLimit:
			# successful catch
			countingDown = false
			$CharacterBody2D.visible = false
			$Fish.visible = false
			var scene: Node = SceneSwitcher.instantiateScene("res://Scenes/GameScenes/FishingMiniGame/MiniGameComplete/MiniGameWon/MiniGameWon.tscn")
			add_child(scene)


