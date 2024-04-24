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
		# SceneSwitcher.replaceSelfOnParent(self, catchFailedScene)
		pass
	
	var distance = abs(hook.global_position - fish.global_position).length()
	if distance < distanceCutoff:
		successTime = successTime + delta
		catchBar.value = successTime / successTimeLimit
	
	if successTime >= successTimeLimit:
		# successful catch
		var roll = randf()
		if roll <= CurrencyManager.chanceOfChest:
			SceneSwitcher.replaceSelfOnParent(self, "res://Scenes/GameScenes/FishingMiniGame/MiniGameReward/TreasureReward/TreausreReward.tscn")
			pass
		else:
			SceneSwitcher.replaceSelfOnParent(self, "res://Scenes/GameScenes/FishingMiniGame/MiniGameReward/FishReward/FishReward.tscn")
			pass


