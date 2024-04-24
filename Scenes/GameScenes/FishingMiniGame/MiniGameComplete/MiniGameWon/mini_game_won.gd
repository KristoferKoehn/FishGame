extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_button_down() -> void:
	var roll = randf()
	if roll <= CurrencyManager.chanceOfChest:
		SceneSwitcher.replaceSelfOnParent(get_parent(), "res://Scenes/GameScenes/FishingMiniGame/MiniGameReward/TreasureReward/TreasureReward.tscn")
	else:
		SceneSwitcher.replaceSelfOnParent(get_parent(), "res://Scenes/GameScenes/FishingMiniGame/MiniGameReward/FishReward/FishReward.tscn")
