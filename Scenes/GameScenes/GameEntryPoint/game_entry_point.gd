extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneSwitcher.instantiateAndPushScene("res://Scenes/Menus/MainMenu/MainMenu.tscn")
