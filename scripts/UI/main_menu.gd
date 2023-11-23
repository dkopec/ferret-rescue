extends Node2D

func _on_play_pressed():
	print("Main Menu Play Button Pressed")
	get_tree().change_scene_to_file("res://scenes/levels/main_level.tscn")

func _on_quit_pressed():
	print("Main Menu Quit Button Pressed")
	get_tree().quit()
