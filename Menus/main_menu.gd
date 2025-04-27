extends Control
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var credit_button: Button = $VBoxContainer/CreditButton
@onready var exit_button: Button = $VBoxContainer/ExitButton

@onready var music_button: Button = $HBoxContainer/MusicButton
@onready var sfx_button: Button = $HBoxContainer/SfxButton

@onready var barra_music: Sprite2D = $HBoxContainer/MusicButton/barraMusic
@onready var barra_sfx: Sprite2D = $HBoxContainer/SfxButton/barraSfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.numberOfWave = 0
	GameController.emit_damage = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
#	cambio scena al gioco
	get_tree().change_scene_to_file("res://Level/Prologue/Prologue.tscn")


func _on_credit_button_pressed() -> void:
	#	cambio scena a crediti
	get_tree().change_scene_to_file("res://Menus/Credits/credits.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_music_button_toggled(is_muted: bool) -> void:
#	togglare la musica 
	var music_bus_index = AudioServer.get_bus_index("Music") 
	AudioServer.set_bus_mute(music_bus_index,is_muted)
	barra_music.visible = is_muted
	print("ciao music mute")


func _on_sfx_button_toggled(is_muted: bool) -> void:
	print("ciao sfx")
	#	togglare la sfx
	var sfx_bus_index = AudioServer.get_bus_index("Sfx") 
	AudioServer.set_bus_mute(sfx_bus_index,is_muted)
	barra_sfx.visible = is_muted
