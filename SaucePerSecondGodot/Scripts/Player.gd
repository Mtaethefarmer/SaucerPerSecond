extends KinematicBody2D

export (int) var speed = 400

var velocity = Vector2()

var screen_size

func _ready():
	 screen_size = get_viewport_rect().size

func _physics_process(delta):
	
	get_input()	
	
	move_and_slide(velocity)

func get_input():
	if Input.is_action_pressed('ui_right'):
		velocity = Vector2(0,-1)
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity = Vector2(0,-1)
		velocity.x -= 1
	velocity = velocity.normalized() * speed
	
func check_boundary():
	if position.x > screen_size.x:
		velocity = Vector2(0,-1)
		velocity.x *= -1
