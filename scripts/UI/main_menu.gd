extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var main_scene = load("res://scenes/levels/main_level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_play_button_pressed():
	print_debug("Play button pressed.")
	var instance = main_scene.instance()
	add_child(instance)

func _on_quit_button_pressed():
	print_debug("Play button pressed.")
	get_tree().quit()
	pass # Replace with function body.
