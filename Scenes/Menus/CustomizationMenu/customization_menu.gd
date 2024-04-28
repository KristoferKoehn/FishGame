extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	$Panel/Tree.create_item()
	var items : Array = CustomizationManager.items_unlocked
	for item in items:
		if item.contains("Garbage"):
			continue
		var tree_item : TreeItem = $Panel/Tree.create_item()
		tree_item.set_text(0, item)
		tree_item.set_text_alignment(0, HORIZONTAL_ALIGNMENT_LEFT)
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouse:
		return
	if event.is_action("escape"):
		queue_free()

func _on_equip_button_pressed() -> void:
	var t_item : TreeItem = $Panel/Tree.get_selected()
	var c_holder : Node3D = CustomizationManager.get_player().find_child("HeadAccessory")

	if t_item != null:
		for cust in c_holder.get_children():
			cust.visible = false
			
		CustomizationManager.get_player().find_child(t_item.get_text(0)).visible = true


func _on_back_button_pressed() -> void:
	get_parent().get_node("PausePanel").visible = true
	queue_free()
