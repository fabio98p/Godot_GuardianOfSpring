extends Node2D

var vulnerable:bool 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if vulnerable and GameController.emit_damage:
		print("nemico colpito dal process")
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	vulnerable = true
	print("nemico colpito ")


func _on_area_2d_area_exited(area: Area2D) -> void:
	vulnerable = false
	 # Replace with function body.
