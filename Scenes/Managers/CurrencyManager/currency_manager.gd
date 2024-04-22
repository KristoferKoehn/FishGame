extends Node

var worms: int = 0
var gold: int = 0
var superworms: int = 0
var pearls: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var fileExists = FileAccess.file_exists("user://currency_settings.dat")
	if !fileExists:
		save_data()
		
	var file = FileAccess.open("user://currency_settings.dat", FileAccess.READ)
	var currencyString = file.get_as_text()
	file.close()
	
	var jobject: Dictionary = JSON.parse_string(currencyString)
	worms = jobject["worms"]
	gold = jobject["gold"]
	superworms = jobject["superworms"]
	pearls = jobject["pearls"]
	
func save_data() -> void:
	var dick = {"worms" : worms, "gold": gold, "superworms": superworms, "pearls": pearls}
	var currencyString = JSON.stringify(dick)
	var file = FileAccess.open("user://currency_settings.dat", FileAccess.WRITE)
	file.store_string(currencyString)
	file.close()
	

	
