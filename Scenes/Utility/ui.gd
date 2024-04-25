class_name UI
extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UIManager.register_UI(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Panel/HBoxContainer/MarginContainer/HBoxContainer/WormCount.text = str(CurrencyManager.worms)
	$Panel/HBoxContainer/MarginContainer2/HBoxContainer/SuperWormCount.text = str(CurrencyManager.superworms)
	$Panel/HBoxContainer/MarginContainer3/HBoxContainer/GoldCount.text = str(CurrencyManager.gold)
	$Panel/HBoxContainer/MarginContainer4/HBoxContainer/PearlCount.text = str(CurrencyManager.pearls)
	pass

func getReward(success: bool) -> void:
	EducationManager.questionCompleted.disconnect(getReward)
	if success:
		CurrencyManager.worms += 10
	$Panel/HBoxContainer/GetQuestion.disabled = false
	CurrencyManager.save_data()

func _on_get_question_button_down() -> void:
	EducationManager.questionCompleted.connect(getReward)
	$Panel/HBoxContainer/GetQuestion.disabled = true
	var scene : Node = SceneSwitcher.instantiateScene("res://Scenes/Menus/QuestionMenu/QuestionMenu.tscn")
	add_child(scene)

func start_fishing_game() -> void:
	pass

func get_fishing_reward() -> void:
	pass

func activate_shop() -> void:
	var t : Tween = get_tree().create_tween()
	get_node("ShopPanel").visible = true;
	t.tween_property(get_node("ShopPanel"), "modulate:a", 1, 1)
	get_node("ShopPanel")
	var shop_items : Dictionary = CustomizationManager.items_in_shop
	var tree : Tree = get_node("ShopPanel/ShopItems")
	tree.clear()
	tree.create_item() # creates root, default hidden. So the rest doesn't break. Don't ask me

	for item_name in shop_items:
		var t_item : TreeItem = tree.create_item(null, 200)
		t_item.set_text(0, item_name)

		if CustomizationManager.items_unlocked.has(item_name):
			t_item.set_text(1, "Purchased!")
		else:
			t_item.set_text(1, str(shop_items[item_name]))
		t_item.set_text_alignment(0, HORIZONTAL_ALIGNMENT_LEFT)
		t_item.set_text_alignment(1, HORIZONTAL_ALIGNMENT_RIGHT)

func deactivate_shop() -> void:
	#apparently this is how you do lambdas in gdscript
	var vis = func() -> void:
		get_node("ShopPanel").visible = false

	var t : Tween = get_tree().create_tween()
	t.tween_property(get_node("ShopPanel"), "modulate:a", 0, 0.2)
	t.tween_callback(vis)


func _on_purchase_button_pressed():
	var tree : Tree = get_node("ShopPanel/ShopItems")
	var t_item : TreeItem = tree.get_selected()
	if t_item != null:
		if !CustomizationManager.items_unlocked.has(t_item.get_text(0)):
			if CurrencyManager.gold >= int(t_item.get_text(1)):
				CustomizationManager.items_unlocked.append(t_item.get_text(0))
				CurrencyManager.gold = CurrencyManager.gold - int(t_item.get_text(1))
				CurrencyManager.save_data()
				CustomizationManager.save_data()
				t_item.set_text(1, "Purchased!")
		else:
			return

