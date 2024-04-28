extends Node

var items_in_shop : Dictionary = {}
var items_unlocked : Array = []
var has_shop_list : bool = false
var player_node : Node3D 

func _ready():
	var fileExists = FileAccess.file_exists("user://customization_settings.dat")
	if !fileExists:
		save_data()
		
	var file = FileAccess.open("user://customization_settings.dat", FileAccess.READ)
	var currencyString = file.get_as_text()
	file.close()
	
	items_unlocked = JSON.parse_string(currencyString)


func register_player(player : Rogue) -> void:
	player_node = player
	for accessory in player.get_node("Rig/Skeleton3D/HeadAccessory").get_children():
		items_in_shop[accessory.name] = accessory.get_meta("price") if accessory.has_meta("price") else accessory.get_meta("pearls")

	has_shop_list = true

func save_data() -> void:
	var jstr = JSON.stringify(items_unlocked)
	var file = FileAccess.open("user://customization_settings.dat", FileAccess.WRITE)
	file.store_string(jstr)
	file.close()

func unlock_item(item_string) -> void:
	items_unlocked.append(item_string)

func activate_shop(ui : UI) -> void:
	ui.activate_shop()

func get_player() -> Node3D:
	return player_node
