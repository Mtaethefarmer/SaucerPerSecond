extends Control

onready var Game = load("res://Scenes/World.tscn")
onready var Instructions = load("res://Scenes/Instructions.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_tree().change_scene_to(Game)


func _on_Instructions_pressed():
	get_tree().change_scene_to(Instructions)
