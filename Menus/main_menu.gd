extends Control
@onready var start_button: Button = $VBoxContainer/StartButton
@onready var credit_button: Button = $VBoxContainer/CreditButton
@onready var exit_button: Button = $VBoxContainer/ExitButton

@onready var music_button: Button = $HBoxContainer/MusicButton
@onready var sfx_button: Button = $HBoxContainer/SfxButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
#	cambio scena al gioco
	pass # Replace with function body.


func _on_credit_button_pressed() -> void:
	#	cambio scena a crediti
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_music_button_toggled(is_muted: bool) -> void:
#	togglare la musica 
	var music_bus_index = AudioServer.get_bus_index("Music") 
	AudioServer.set_bus_mute(music_bus_index,is_muted)
	print("ciao music mute")


func _on_sfx_button_toggled(is_muted: bool) -> void:
	#	togglare la sfx
	var sfx_bus_index = AudioServer.get_bus_index("Sfx") 
	AudioServer.set_bus_mute(sfx_bus_index,is_muted)
