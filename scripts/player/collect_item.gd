extends Area2D

signal item_collected(value)
var item_value = 1

func _on_Item_body_entered(_body):
	print("Item Collected")
	emit_signal("item_collected", item_value)
	queue_free()

func _on_Timer_timeout():
	var time = get_node("Timer").wait_time
	queue_free()
	print(str("Item expired after ", time , " seconds."))
