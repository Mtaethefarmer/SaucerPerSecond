extends RigidBody2D

export (int) var min_speed # Minimum speed range.
export (int) var max_speed # Maximum speed range.

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _on_Visibility_screen_exited():
	queue_free()

func _on_Mob_body_entered(body):
	queue_free()
