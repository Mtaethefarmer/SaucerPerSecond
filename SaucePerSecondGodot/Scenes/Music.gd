extends AudioStreamPlayer

#Hard coded bpm
onready var bpm  = 104

#Duration of a beat per sec
#Make sure to do floating point division
onready var crotchet =  60.0 / bpm

#Amount of acceptable lag in input presses per sec
onready var latency = 0.5

#Current positon in the song
onready var play_head = 0.0

#Where the last beat was played in the song
var last_beat = 0.0

signal played_on_beat
signal played_off_beat

func _ready():
	pass

func _physics_process(delta):
	play_beat()
	check_timing()
	
func play_beat():
	#Current position in the song
	play_head = get_playback_position()
	
	#Find the last beat
	if play_head > last_beat + crotchet:
		last_beat += crotchet

func check_timing():
	#Check if the player pressed the left or right keys
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		#Check if key press was on beat
		if play_head > last_beat + crotchet - latency:
			if play_head < last_beat + crotchet + latency:
				#Key was pressed on beat
				emit_signal("played_on_beat")
				print("*****ON BEAT*****")
#DEBUG INFO
			else:
				emit_signal("played_off_beat")
				print("OFF BEAT")
				print("By: " + str(play_head - last_beat) + " secs")
				print("Playhead " + str(play_head))
				print("Last Beat = " + str(last_beat))
		else:
			emit_signal("played_off_beat")
			print("OFF BEAT")
			print("By: " + str(play_head - last_beat) + " secs")
			print("Playhead: " + str(play_head))
			print("Last Beat: " + str(last_beat))
			
		
		$Clap.play()
#DEBUG INFO