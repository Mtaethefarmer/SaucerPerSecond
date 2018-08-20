extends RigidBody2D

onready var Bullet = preload("res://Scenes/Bullet.tscn")

export (int) var speed = 75

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
	
func create_bullet():
	#Create a bullet
	var bullet = Bullet.instance()
	add_child(bullet)
	
	#Velocity of bullet is twice as fast as the player
	var bullet_vel = Vector2(0, -20)
	
	#Match the player's gravity
	bullet.gravity_scale = -10
	
	#Ignore the player
	add_collision_exception_with(bullet)

#func _on_Music_beat_played(note_length):
#	create_bullet()