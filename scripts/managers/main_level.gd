extends Node2D

var item_preload = preload("res://scenes/objects/item_base.tscn")
var upgrade_preload = preload("res://scenes/objects/upgrade.tscn")
var score = 0
var upgrades = 0

func _process(_delta):
	get_node("Score").text = str(score)

func _on_item_collected(value):
	var old_score = score
	score = score + value
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

func _on_PlayerSpeed_Button_pressed():
	var cost = 5
	var increase = 50
	print("Speed Buy Button Pressed")
	if score >= cost:
		score = score - cost
		print(str("Score reduced to ", score))
		upgrades = upgrades + 1
		print(str("Upgrades increased to ", upgrades))
		$player.speed = $player.speed + increase
		print(str("Speed increesed to ", $player.speed))
		$Upgrade_GridContainer.add_child(upgrade_preload.instance())
		print("Upgrade icon added to gridview")



func _on_SpawnSpeed_Button_pressed():
	var cost = 20
	var reduction = 1
	if score >= cost and $Timer.wait_time > 0:
		score = score - cost
		print(str("Score reduced to ", score))
		upgrades = upgrades + 1
		print(str("Upgrades increased to ", upgrades))
		$Timer.wait_time = $Timer.wait_time - reduction
		print(str("Spawn Time decreased to ", $Timer.wait_time))
		var upgrade_icon = upgrade_preload.instance()
		upgrade_icon.texture = load("res://assets/images/emotes/yarrNeato.png")
		$Upgrade_GridContainer.add_child(upgrade_icon)
		print("Upgrade icon added to gridview")
