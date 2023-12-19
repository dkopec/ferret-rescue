extends Node2D

var item_preload = preload("res://scenes/objects/item_base.tscn")
var score = 0

func _on_item_collected(value):
	var old_score = score
	score = score + value
	get_node("Score").text = str(score)
	print(str("Score increased from ", old_score, " to ", score))

func _on_Timer_timeout():
	var screen_size = get_viewport_rect().size
	var screen_length = screen_size.x
	var screen_height = screen_size.y
	print(str("The screen size is", screen_size, " so ", screen_length, " by ", screen_height))
	
	var item_instance = item_preload.instance()
	var random_position_x = rand_range(0.0, screen_length)
	var random_position_y = rand_range(0.0, screen_height)
	var random_coordinate =  Vector2(random_position_x,random_position_y)
	item_instance.position = random_coordinate
	item_instance.connect("item_collected", self, "_on_item_collected")
	add_child(item_instance)
	
	print(str("Item spawned at ", random_coordinate))
	
