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

#List of beats to be played, total of 104 beats
var beat_list = []

#Location of the next beat in the beat list
var beat_index = 0

signal beat_played
signal played_on_beat
signal played_off_beat

func _ready():
	init_beat_list()
	
func _physics_process(delta):
	#Music played in the physics process to get higher frequency of calls 
	play_beat()
	check_timing()
	
func play_beat():
	#Current position in the song
	play_head = get_playback_position()
	
	#Find the last beat
	if play_head > last_beat + (crotchet * beat_list[beat_index]):
		last_beat += crotchet * beat_list[beat_index]
		if beat_index < beat_list.size() - 1:
			beat_index += 1
		emit_signal("beat_played", crotchet * beat_list[beat_index])

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
			
		#Audio feedback
		$Clap.play()
#DEBUG INFO

func init_beat_list():
	
	#Maximum number of beats in the song
	var max_beats = bpm
	
	#Current number of beats loaded into the list
	var beats_loaded = 0
	
	#Generate random seed
	randomize()
	
	#For the maximum number of beats
	for i in range(max_beats):
		#Generate a random beat from 1 to 4
		var rand_beat = randi(i) % 4 +1
		
		#Check the number of beats loaded
		if beats_loaded + rand_beat < max_beats:
			#Add a new beat to the list
			beat_list.append(rand_beat)