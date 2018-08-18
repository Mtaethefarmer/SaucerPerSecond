extends RigidBody2D

export (int) var speed = 5

var velocity = Vector2()

func _ready():
	pass

func _process(delta):
	get_input()
	
	apply_impulse(Vector2(), velocity)

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('ui_right'):
        velocity.x += 1
    if Input.is_action_pressed('ui_left'):
        velocity.x -= 1
    velocity = velocity.normalized() * speed