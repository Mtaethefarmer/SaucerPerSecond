extends Node

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$Walls.position.y = $Player.position.y
	$Interface.rect_position.y = $Player.position.y + $Player/Camera2D.offset.y
	$Spawner.position.y = $Player.position.y + $Player/Camera2D.offset.y