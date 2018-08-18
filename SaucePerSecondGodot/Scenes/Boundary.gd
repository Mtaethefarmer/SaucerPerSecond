extends Area2D

onready var player = preload("res://Scenes/Player.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	position.y = player.position.x
