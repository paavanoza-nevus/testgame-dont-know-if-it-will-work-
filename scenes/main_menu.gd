extends Control

func _ready() -> void:
	print("Main Menu script is running")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file.call_deferred("res://scenes/game.tscn")

func _on_settings_pressed() -> void:
	print("SETTINGS BUTTON FUNCTION RAN")
# func _on_settings_pressed() -> void:
	# print("Settings button clicked!")
	
