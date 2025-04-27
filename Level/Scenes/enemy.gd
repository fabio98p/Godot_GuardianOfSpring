extends Node2D

var vulnerable:bool 
@export var velocity:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !GameController.loseGame:
		if vulnerable and GameController.emit_damage:
			print("nemico colpito dal process")
		
		position -= transform.x * velocity * delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	vulnerable = true
	print("nemico colpito ")


func _on_area_2d_area_exited(area: Area2D) -> void:
	vulnerable = false
	 # Replace with function body.
