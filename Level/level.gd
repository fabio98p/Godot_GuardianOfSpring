extends Node2D

@onready var label: Label = $Label
@onready var time_countdown: Time_Countdown = $Time_countdown
@export var timeLastWave:float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_countdown.endTimer.connect(Callable(self, "_changeFlowerStatus"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = time_countdown._timeToString()

func _changeFlowerStatus():
#	cambio del fiore
#	timer di 4 secondi 
	await get_tree().create_timer(4.0).timeout
	time_countdown.time = timeLastWave
	time_countdown.stopped = false
