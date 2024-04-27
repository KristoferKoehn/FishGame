extends Control

var wormsUsedToCast = 3
var superWormsUsedToCast = 1
var worms
var superWorms

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/HBoxContainer/WormButton.disabled = true
	$VBoxContainer/HBoxContainer/SuperWormButton.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: # could be avoided with a refacttor. have the currency manager publish a currency changed event that this subscribes to so we arent checking every frame. Also, make it the currency managers responsibility to save its own stuff on a change. 
	worms = CurrencyManager.worms
	if worms < wormsUsedToCast:
		$VBoxContainer/HBoxContainer/WormButton.disabled = true
	else:
		$VBoxContainer/HBoxContainer/WormButton.disabled = false
	
	superWorms = CurrencyManager.superworms
	if superWorms < superWormsUsedToCast:
		$VBoxContainer/HBoxContainer/SuperWormButton.disabled = true
	else:
		$VBoxContainer/HBoxContainer/SuperWormButton.disabled = false

func _on_worm_button_button_down() -> void:
	CurrencyManager.worms -= wormsUsedToCast
	CurrencyManager.save_data()
	startMiniGame()

func _on_super_worm_button_button_down() -> void:
	CurrencyManager.superworms -= superWormsUsedToCast
	CurrencyManager.save_data()
	startMiniGame()

func startMiniGame() -> void:
	var fishingMiniGame: Node = SceneSwitcher.instantiateScene("res://Scenes/GameScenes/FishingMiniGame/FishingMiniGame.tscn")
	var ui: Node = get_parent()
	ui.add_child(fishingMiniGame)
	visible = false

func _on_get_more_worms_button_down() -> void:
	EducationManager.questionCompleted.connect(getReward)
	visible = false
	var scene : Node = SceneSwitcher.instantiateScene("res://Scenes/Menus/QuestionMenu/QuestionMenu.tscn")
	get_parent().add_child(scene)

func getReward(success: bool) -> void:
	EducationManager.questionCompleted.disconnect(getReward)
	if success:
		CurrencyManager.worms += 10
		CurrencyManager.save_data()
	visible = true
