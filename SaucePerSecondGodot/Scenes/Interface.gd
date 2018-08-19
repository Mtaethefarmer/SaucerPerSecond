extends MarginContainer

var score = 0

func _ready():
	$HBoxContainer/Right.color = Color(0, 0, 0, 0)
	$HBoxContainer/Left.color = Color(0, 0, 0, 0)
	
func _process(delta):
	#Check for input
	if Input.is_action_pressed("ui_right"):
		$HBoxContainer/Right.color = Color(0, 1, 0, 0.5)
	if Input.is_action_pressed("ui_left"):
		$HBoxContainer/Left.color = Color(1, 0, 0, 0.5)
		
	if Input.is_action_just_released("ui_right"):
		$HBoxContainer/Right.color = Color(0, 0, 0, 0)
	if Input.is_action_just_released("ui_left"):
		$HBoxContainer/Left.color = Color(0, 0, 0, 0)