extends Node2D

@onready var label: Label = $Label
@onready var time_countdown: Time_Countdown = $Time_countdown
@export var timeLastWave:float
@onready var flower: Node2D = $Flower
@onready var lose_game: AudioStreamPlayer2D = $LoseGame
var prevEndGame:bool = false
@onready var fine_livello: AnimationPlayer = $FineLivello
signal changeFlowerStatusSignal 
@onready var ambient: AudioStreamPlayer2D = $Ambient
@onready var win_game: AudioStreamPlayer2D = $WinGame
@export var enemy_scene: PackedScene 
#@export var spawnEnemyPos: Vector2
var spawnEnemyPos := [
	
	{
		"posX" : 1451.0,
		"posY" : 508,
		"rot" : 0.0,
	},
	{
		"posX" : 1361.0,
		"posY" : 831.0,
		"rot" : 27.4,
	},
	{
		"posX" : -45.0,
		"posY" : 847.0,
		"rot" : 150.8,
	},
	{
		"posX" : -319.0,
		"posY" : 425.0,
		"rot" : 185.1,
	},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_spawn_enemies()
	time_countdown.endTimer.connect(Callable(self, "_changeWave"))
	changeFlowerStatusSignal.emit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameController.loseGame and !prevEndGame:
		lose_game.play()
		prevEndGame=true
	#label.text = time_countdown._timeToString()

func _changeWave():
#	FINE LIVELLLO
	endOldWave()
#	timer di 4 secondi 
	await get_tree().create_timer(30.0).timeout
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
		GameController.winGame  = true
		ambient.stop()
		win_game.play()
		
#		animazione della telecamera dopo animazione fiore che brilla qualche secondo e transizione in alto
		await get_tree().create_timer(4.0).timeout
		fine_livello.play("test prova")
		pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Menus/Credits/credits.tscn")


func _on_lose_game_finished() -> void:
	GameController.numberOfWave = 0
	GameController.emit_damage = false
	GameController.loseGame = false
	GameController.winGame  = false
	prevEndGame = false
	get_tree().reload_current_scene()

func spawn_enemies(velocita, enemyPos:Vector2, enemyRot):
	if !GameController.loseGame  and !GameController.winGame:
		var enemies = enemy_scene.instantiate()

		#dire velocità dello spostamento
		enemies.velocity = velocita

		add_child(enemies)
		enemies.position = enemyPos
		enemies.rotation_degrees = enemyRot

func timer_spawn_enemies():
	await get_tree().create_timer(2.0).timeout
	var velProg := 60
	var spawnTimeProg := 2.5 
	while !GameController.loseGame:
		await get_tree().create_timer(spawnTimeProg).timeout
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var num = rng.randi_range(0, 3)
		spawn_enemies(velProg, Vector2(spawnEnemyPos[num].posX, spawnEnemyPos[num].posY), spawnEnemyPos[num].rot )
		velProg += 2
		spawnTimeProg -= 0.02 
