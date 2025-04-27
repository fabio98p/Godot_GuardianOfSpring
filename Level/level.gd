extends Node2D

@onready var label: Label = $Label
@onready var time_countdown: Time_Countdown = $Time_countdown
@export var timeLastWave:float
@onready var flower: Node2D = $Flower

@onready var fine_livello: AnimationPlayer = $FineLivello
signal changeFlowerStatusSignal 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_countdown.endTimer.connect(Callable(self, "_changeWave"))
	changeFlowerStatusSignal.emit()
	
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
	
	time_countdown.time = timeLastWave
	time_countdown.stopped = false

func endOldWave():
	#cambio del fiore
	print(GameController.numberOfWave)
	GameController.numberOfWave += 1
	changeFlowerStatusSignal.emit()
	if GameController.numberOfWave == 3:
#		animazione della telecamera dopo animazione fiore che brilla qualche secondo e transizione in alto
		await get_tree().create_timer(4.0).timeout
		fine_livello.play("test prova")
		pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Menus/Credits/credits.tscn")
