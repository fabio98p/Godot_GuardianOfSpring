extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")


func _on_button_pressed() -> void:
#	aumentare velocità credits in caso
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
