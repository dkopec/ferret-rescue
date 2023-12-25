extends Node2D

var item_preload = preload("res://scenes/objects/item_base.tscn")
var upgrade_preload = preload("res://scenes/objects/upgrade.tscn")
var score = 0

func findChildWithType(node: Node, type: String) -> Node:
	# Iterate through the node's children
	for child in node.get_children():
		var child_type = child.type
		if child_type == type:
			print(str("Found node with parameter that equals ", type))
			return child
	# If no child with the specified parameter is found
	print(str("No child of node ", node.name, " with type that equals ", type, " found."))
	return null

func spawn_item():
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

func _process(_delta):
	if (int(get_node("Score").text) != score):
		get_node("Score").text = str(score)
		print(str("Score label text updated to ", score))

func _on_item_collected(value):
	var old_score = score
	score = score + value
	print(str("Score increased from ", old_score, " to ", score))

func _on_Timer_timeout():
	spawn_item()

func _on_PlayerSpeed_Button_pressed():
	var cost = 5
	var increase = 50
	print("Speed Buy Button Pressed")
	if score >= cost:
		score = score - cost
		print(str("Score reduced to ", score))
		var speed_upgrade = findChildWithType($Upgrade_VFlowContainer, "Speed")
		if speed_upgrade:
			speed_upgrade.count = speed_upgrade.count + 1
			print(str("Speed Upgrade increased to ", speed_upgrade.count))
		else:
			speed_upgrade = upgrade_preload.instance()
			speed_upgrade.type = "Speed"
			speed_upgrade.get_node("Icon").texture = load("res://assets/images/emotes/yarrHype.png")
			$Upgrade_VFlowContainer.add_child(speed_upgrade)
			print("Upgrade icon added to list")
		$player.speed = $player.speed + increase
		print(str("Speed increased to ", $player.speed))

func _on_SpawnSpeed_Button_pressed():
	var cost = 20
	var reduction = 1
	if score >= cost and $Timer.wait_time > 1:
		score = score - cost
		print(str("Score reduced to ", score))
		var spawn_upgrade = findChildWithType($Upgrade_VFlowContainer, "Spawn")
		if spawn_upgrade:
			spawn_upgrade.count = spawn_upgrade.count + 1
			print(str("Spawn upgrade increased to ", spawn_upgrade.count))
		else:
			spawn_upgrade = upgrade_preload.instance()
			spawn_upgrade.type = "Spawn"
			spawn_upgrade.get_node("Icon").texture = load("res://assets/images/emotes/yarrNeato.png")
			$Upgrade_VFlowContainer.add_child(spawn_upgrade)
			print("Spawn upgrade added to list")
		$Timer.wait_time = $Timer.wait_time - reduction
		print(str("Spawn Time decreased to ", $Timer.wait_time))
		if score >= cost and $Timer.wait_time <= 1:
			$SpawnSpeed_Button.disabled = true
