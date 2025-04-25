extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
enum flower_status{
#	fase 1 del gioco
	avvizzito, 
#	fase 2 del gioco
	semi_sbocciato,
#	 fase 3 (finale) del gioco
	eretto,
#	fase 4 """""""""filmato"""""""" movimento della camera finale
	sbocciato
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
