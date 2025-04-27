extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var level: Node2D = $".."
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level.changeFlowerStatusSignal.connect(Callable(self, "_changeFlowerStatus"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _changeFlowerStatus():
	match GameController.numberOfWave:
		0: 	animation_player.play("avvizzito")
		1:	animation_player.play("eretto")
		2:	animation_player.play("semisbocciato")
		3:	animation_player.play("finale")
