extends KinematicBody2D

export (int) var speed = 200

var target = Vector2()
var velocity = Vector2()

func _ready():
	target = self.position

func _input(event):
	if event.is_action('click') or event is InputEventScreenTouch:
		target = event.position

func _physics_process(_delta):
	velocity = (target - position).normalized() * speed
	# rotation = velocity.angle()
	if (target - position).length() > 5:
		var _ms = move_and_slide(velocity)
