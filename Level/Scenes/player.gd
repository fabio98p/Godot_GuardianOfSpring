extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var animation_type:String = "idle"
var is_attacking = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_passi: AudioStreamPlayer2D = $AudioStreamPassi
@onready var audio_stream_jump: AudioStreamPlayer2D = $AudioStreamJump
@onready var audio_stream_attack: AudioStreamPlayer2D = $AudioStreamAttack
@onready var player: CharacterBody2D = $"."
@onready var attack_zone: Area2D = $AttackZone


func _physics_process(delta: float) -> void:
	if !GameController.loseGame :
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
			
		if !is_attacking:
		# Handle jump.
			if Input.is_action_just_pressed("Jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY

			# Get the input direction and handle the movement/deceleration.
			# As good practice, you should replace UI actions with custom gameplay actions.
			var direction := Input.get_axis("Left", "Right")
			if direction:
				velocity.x = direction * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			animation_handler(direction)
			move_and_slide()


func animation_handler(direction):
	
	if !is_attacking:
		# handle no special animation
		if !is_on_floor():
			animation_type = "jump"
			audio_stream_passi.stop()
			
		elif direction:
			animation_type = "run"
			
		else:
			animation_type = "idle"
			audio_stream_passi.stop()
	
	# handle the direction of the animation
	if direction == -1:
		animated_sprite_2d.flip_h = false
		attack_zone.position.x = -251
	elif direction == 1:
		animated_sprite_2d.flip_h = true
		attack_zone.position.x = 0.0
	
	#animated_sprite_2d.animation = animation_type
	animated_sprite_2d.play(animation_type)
	
func _input(event: InputEvent) -> void:
	if !GameController.loseGame :
		if event.is_action_pressed("Jump") and is_on_floor():
			audio_stream_jump.play()
		if event.is_action_pressed("Right"):
			audio_stream_passi.play()
			
		if event.is_action_pressed("Left"):
			audio_stream_passi.play()
		if event.is_action_pressed("Attack") and is_on_floor() and !is_attacking:
			is_attacking = true
			animated_sprite_2d.play("attack")
			audio_stream_jump.stop()
			audio_stream_passi.stop()
			await get_tree().create_timer(0.3).timeout
			audio_stream_attack.play()
			GameController.emit_damage = true
		
func _on_animated_sprite_2d_animation_finished() -> void:
	print("attack")
	if is_attacking:
		is_attacking = false
		GameController.emit_damage = false
