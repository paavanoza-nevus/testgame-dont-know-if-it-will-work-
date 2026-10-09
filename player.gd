extends CharacterBody2D


const SPEED = 150.0
@onready var anim = $Animations

func _physics_process(delta: float) -> void:
	process_movement()		
	move_and_slide()


func process_movement() -> void:
		# movement stuff
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
