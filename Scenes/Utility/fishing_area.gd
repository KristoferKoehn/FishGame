class_name FishingArea
extends Node3D

@onready var floating_text : PackedScene = preload("res://Scenes/Utility/3DText.tscn")
@onready var text_point = $TextPoint

var current_floating = null

var player_locked : bool = false
var player : Rogue = null;

func _on_area_3d_body_entered(_body:Node3D) -> void:
	if _body.name != "Rogue": return
	player = _body
	if current_floating == null:
		current_floating = floating_text.instantiate()
		
		current_floating.text = "Press E to Fish";
		current_floating.position = text_point.position
		add_child(current_floating)
		_body.ContextNode = self
func _on_area_3d_body_exited(_body:Node3D) -> void:
	if _body.name != "Rogue": return
	player = null
	if current_floating != null:
		current_floating.queue_free()
		current_floating = null;
		_body.ContextNode = null

func _input(event):

	if event.is_action_pressed("escape"):
		if player_locked && player != null:
			player.InputLockout = false
			player_locked = false
