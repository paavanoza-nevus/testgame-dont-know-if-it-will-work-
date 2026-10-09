extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -210.0
@onready var anim = $Animations
var is_rolling = false



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("roll") and is_on_floor():
		anim.play("roll")
	

	# movement stuff
	var direction := Input.get_axis("move_left", "move_right")
	
	if is_rolling == false:
		if direction == 0:
			anim.play("idle")
	elif is_rolling == false: 
		if direction != 0:
			anim.play("run")
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true
		
	if Input.is_action_just_pressed("roll") and is_on_floor() and not is_rolling:
		is_rolling = true
		anim.play("roll")

		if is_rolling:
			if not anim.is_playing():
				is_rolling = false
		else:
			if direction == 0:
				anim.play("idle")
			else:
				anim.play("run")
			

	move_and_slide()
