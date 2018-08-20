extends Path2D

export (PackedScene) var Mob = preload("res://Scenes/Mob.tscn")

func _ready():
	randomize()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Music_beat_played(beat_length):
		# Choose a random location on Path2D.
	$"Spawn Location".set_offset(randi())
	
	# Create a Mob instance and add it to the scene.
	var mob = Mob.instance()
	add_child(mob)
	
	# Set the mob's direction perpendicular to the path direction.
	var direction = $"Spawn Location".rotation + PI / 2
	
	# Set the mob's position to a random location.
	mob.position = $"Spawn Location".position
	
	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# Choose the velocity.
	mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed), 0).rotated(direction))
