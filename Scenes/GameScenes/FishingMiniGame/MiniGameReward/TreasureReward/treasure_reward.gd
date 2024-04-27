extends Control

var gold = 0
var pearls = 0
var superWorms = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_get_normal_chest_button_down() -> void:
	$VBoxContainer/HBoxContainer/MarginContainer2/VBoxContainer/GetNormalChest.disabled = true
	$VBoxContainer/HBoxContainer/MarginContainer2/VBoxContainer/GetNormalChest.text = "Opened!"
	var expectedFishValue = CurrencyManager.expectedFishValue
	var addedGold = 2 * CurrencyManager.expectedFishValue + randi_range(-expectedFishValue, expectedFishValue + 1)
	if CurrencyManager.baitIsSuperWorm:
		addedGold = addedGold * 2
	gold += addedGold
	updateRewardLabel()

func _on_get_special_chest_button_down() -> void:
	EducationManager.questionCompleted.connect(getReward)
	$VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/GetSpecialChest.disabled = true
	$VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/GetSpecialChest.text = "Opened!"
	var scene : Node = SceneSwitcher.instantiateScene("res://Scenes/Menus/QuestionMenu/QuestionMenu.tscn")
	$VBoxContainer.visible = false
	add_child(scene)

func getReward(success: bool) -> void:
	EducationManager.questionCompleted.disconnect(getReward)
	$VBoxContainer.visible = true
	if success:
		var expectedFishValue = CurrencyManager.expectedFishValue
		var addedGold = 3 * CurrencyManager.expectedFishValue + randi_range(-expectedFishValue, expectedFishValue + 1)
		var addedPearls = randi_range(1, 3)
		var addedSuperWorms = 1
		if CurrencyManager.baitIsSuperWorm:
			addedGold = addedGold * 2
			addedPearls = addedPearls * 2
			addedSuperWorms = addedSuperWorms * 2
		gold += addedGold
		pearls += addedPearls
		superWorms += addedSuperWorms
	else:
		$VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/GetSpecialChest.disabled = false
		$VBoxContainer/HBoxContainer/MarginContainer/VBoxContainer/GetSpecialChest.text = "Locked. Try again?"
	updateRewardLabel()

func updateRewardLabel() -> void:
	$VBoxContainer/MarginContainer/Label.text = "You got " + str(gold) + " gold, " + str(pearls) + " pearls, and " + str(superWorms) + " Superworm!"

func _on_continue_button_down() -> void:
	CurrencyManager.gold += gold
	CurrencyManager.pearls += pearls
	CurrencyManager.superworms += superWorms
	CurrencyManager.save_data()
	var ui: Node = get_parent()
	var baitSelection: Node = ui.find_child("BaitSelection", false, false)
	baitSelection.visible = true
	queue_free()
