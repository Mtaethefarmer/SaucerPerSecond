extends AudioStreamPlayer

#Hard coded bpm
onready var bpm  = 104

#Duration of a beat
#Make sure to do floating point division
onready var crotchet =  60.0 / bpm

#Where the last beat was played in the song
var last_beat = 0.0

signal beat_played

func _ready():
	pass

func _physics_process(delta):
	play_beat()
	
func play_beat():
	#Current position in the song
	var play_head = get_playback_position()
	
	#If play_head has passed the next beat
	if play_head > (last_beat + crotchet):
		#Increment the position of the last beat
		last_beat += crotchet
		emit_signal("beat_played", play_head)
		
#DEBUG INFO
		$Clap.play()
#		print("Playhead " + str(get_playback_position()))
#		print("Crotchet = " + str(crotchet))
#		print("Beat Count = " +str(beat_count))
#DEBUG INFO