extends Node2D

@onready var label: Label = $Label
@onready var time_countdown: Time_Countdown = $Time_countdown
@export var timeLastWave:float
@onready var flower: Node2D = $Flower
signal changeFlowerStatusSignal 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_countdown.endTimer.connect(Callable(self, "_changeWave"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = time_countdown._timeToString()

func _changeWave():
#	FINE LIVELLLO
	endOldWave()
#	timer di 4 secondi 
	await get_tree().create_timer(4.0).timeout
#	INIZIO LIVELLO
	stratNewWave()

func stratNewWave():
	GameController.numberOfWave += 1
	time_countdown.time = timeLastWave
	time_countdown.stopped = false

func endOldWave():
	#cambio del fiore
	changeFlowerStatusSignal.emit()
