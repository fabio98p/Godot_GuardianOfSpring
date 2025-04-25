extends Control

@onready var panel: Panel = $Panel
@onready var panel_black: Panel = $PanelBlack
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var texture:Array[String]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPrologue()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func startPrologue():

	for iteration in texture:
		change_bg_img(iteration)
		changeBlackToImage()
		await get_tree().create_timer(4.0).timeout
		changeImageToBlack()
		await get_tree().create_timer(2.0).timeout
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Level/level.tscn")
	
func changeBlackToImage():
	animation_player.play("BlackToImage")
	
	
func changeImageToBlack():
	animation_player.play("ImageToBlack")
	
func change_bg_img(img: String):
	var style : StyleBoxTexture = StyleBoxTexture.new()
	
	style.texture = load(img)
	panel.add_theme_stylebox_override("panel", style)
