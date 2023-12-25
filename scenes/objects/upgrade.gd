extends HBoxContainer

export (int) var count = 0

export (String) var type

func _process(_delta):
	$Number.text = str(count)
