extends Control
var defaultLength = 24
var defaultWeight = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var length = defaultLength + randf_range(-(defaultLength / 2), defaultLength)
	var ratio = length / defaultLength
	var ratioCubed = ratio * ratio * ratio
	var weight = defaultWeight * ratioCubed
	var gold = int(CurrencyManager.expectedFishValue * (weight / defaultWeight))
	CurrencyManager.gold += gold
	CurrencyManager.save_data()
	$VBoxContainer/Label2.text = "It is " + str(length).substr(0,4) + " inches long and weighs " + str(weight).substr(0,4) + " pounds."
	$VBoxContainer/Label3.text = "It is worth " + str(gold) + " gold!"


func _on_continue_button_down() -> void:
	queue_free()
