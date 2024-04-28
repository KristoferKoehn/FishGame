extends Control
var defaultLength = 24
var defaultWeight = 10
var gold = 0
var pearls = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var length = defaultLength + randf_range(-(defaultLength / 2.0), (defaultLength / 2.0))
	var ratio = length / defaultLength
	var ratioCubed = ratio * ratio * ratio
	var weight = defaultWeight * ratioCubed
	$VBoxContainer/Label2.text = "It is " + str(length).substr(0,4) + " inches long and weighs " + str(weight).substr(0,4) + " pounds."
	gold = int(CurrencyManager.expectedFishValue * (weight / defaultWeight))
	if CurrencyManager.baitIsSuperWorm:
		gold = gold * 2
		pearls = 1
		$VBoxContainer/Label3.text = "It is worth " + str(gold) + " gold and " + str(pearls) + " pearl(s)!"
	else:
		$VBoxContainer/Label3.text = "It is worth " + str(gold) + " gold!"

func _on_continue_button_down() -> void:
	CurrencyManager.gold += gold
	CurrencyManager.pearls += pearls
	CurrencyManager.save_data()
	var ui: Node = get_parent()
	var baitSelection: Node = ui.find_child("BaitSelection", false, false)
	baitSelection.visible = true
	queue_free()
