extends Node2D

var vulnerable:bool 
@export var velocity:float
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_change_enemies_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !GameController.loseGame:
		if vulnerable and GameController.emit_damage:
			await get_tree().create_timer(0.3).timeout
			queue_free()
			print("nemico colpito dal process")
		
		position -= transform.x * velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	vulnerable = true
	print("nemico colpito ")


func _on_area_2d_area_exited(area: Area2D) -> void:
	vulnerable = false
	 # Replace with function body.

func _change_enemies_animation():
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(-10.0, 10.0)
	if my_random_number >= 0:
		animation_player.play("new_animation")
	else:
		animation_player.play("nemico2")
