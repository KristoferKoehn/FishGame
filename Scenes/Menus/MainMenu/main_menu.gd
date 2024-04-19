extends Control

func _on_play_button_down() -> void:
	SceneSwitcher.instantiateAndPushScene("res://Scenes/GameScenes/PrimaryGameScene/MainLevel.tscn")

func _on_question_settings_button_down() -> void:
	SceneSwitcher.instantiateAndPushScene("res://Scenes/Menus/QuestionSettingsMenu/QuestionSettingsMenu.tscn")

func _on_quit_button_down() -> void:
	get_tree().quit()
