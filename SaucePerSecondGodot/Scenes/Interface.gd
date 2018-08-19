extends MarginContainer

var score = 0

func _ready():
	$"Beat Feedback"/Right.color = Color(0, 0, 0, 0)
	$"Beat Feedback"/Left.color = Color(0, 0, 0, 0)
	
func _process(delta):
	pass
#	#Check for input
#	if Input.is_action_pressed("ui_right"):
#		$"Beat Feedback"/Right.color = Color(0, 1, 0, 0.5)
#	if Input.is_action_pressed("ui_left"):
#		$"Beat Feedback"/Left.color = Color(1, 0, 0, 0.5)
#
#	if Input.is_action_just_released("ui_right"):
#		$"Beat Feedback"/Right.color = Color(0, 0, 0, 0)
#	if Input.is_action_just_released("ui_left"):
#		$"Beat Feedback"/Left.color = Color(0, 0, 0, 0)

func _on_Music_played_off_beat():
	#Player loses points
	score -= 10
	$Score.text = "Score: " + str(score)
	$Score.set("custom_colors/font_color", Color(1,0,0))
	
	#Check for input
	if Input.is_action_pressed("ui_right"):
		$"Beat Feedback/Right/Tween".stop_all()
		$"Beat Feedback"/Right.color = Color(1, 0, 0, 0.175)
	if Input.is_action_pressed("ui_left"):
		$"Beat Feedback/Left/Tween".stop_all()
		$"Beat Feedback"/Left.color = Color(1, 0, 0, 0.175)

func _on_Music_played_on_beat():
	#Player gaines points
	score += 15
	$Score.text = "Score: " + str(score)
	$Score.set("custom_colors/font_color", Color(0,1,0))
	
	#Check for input
	if Input.is_action_pressed("ui_right"):
		$"Beat Feedback/Right/Tween".stop_all()
		$"Beat Feedback"/Right.color = Color(0, 1, 0, 0.075)
	if Input.is_action_pressed("ui_left"):
		$"Beat Feedback/Left/Tween".stop_all()
		$"Beat Feedback"/Left.color = Color(0, 1, 0, 0.075)

func _on_Music_beat_played(crochet):
	#Change the color of the right part of the screen based on the rhythm
	$"Beat Feedback/Right/Tween".interpolate_property($"Beat Feedback/Right", "color", Color(1, 1, 1, 0.0), Color(1, 1, 1, 0.075), crochet,Tween.TRANS_SINE,Tween.EASE_OUT)
	$"Beat Feedback/Right/Tween".start()
	
	$"Beat Feedback/Left/Tween".interpolate_property($"Beat Feedback/Left", "color", Color(1, 1, 1, 0.0), Color(1, 1, 1, 0.075), crochet,Tween.TRANS_SINE,Tween.EASE_OUT)
	$"Beat Feedback/Left/Tween".start()