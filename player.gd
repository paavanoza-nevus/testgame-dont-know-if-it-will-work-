extends CharacterBody2D


const SPEED = 60.0

var last_direction: Vector2 = Vector2.RIGHT

@onready var animations: AnimatedSprite2D = $Animations

func _physics_process(_delta: float) -> void:
	process_movement()		
	process_animation()
	move_and_slide()


func process_movement() -> void:
		# movement stuff
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		last_direction = direction
	else:
		velocity = Vector2.ZERO


	
func process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation("run", last_direction)
	else:
		play_animation("idle", last_direction)
		

func play_animation(prefix: String, dir: Vector2) -> void:
	if dir.x != 0:
		animations.flip_h = dir.x < 0
		animations.play(prefix + "_right")
	elif dir.y < 0:
		animations.play(prefix + "_up")
	elif dir.y > 0:
		animations.play(prefix + "_down")
