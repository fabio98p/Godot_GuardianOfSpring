extends Node2D

class_name Time_Countdown

@export var time:float 
var stopped:bool = false
var reverse

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stopped: 
		return
	time -= delta
	
func _timeToString():
	var sec= fmod(time, 60)
	var min= time/60
	var format_string = "%02d : %02d" 
	var attual_string = format_string % [min, sec]
	
	return attual_string
	
