extends Area2D

var player_nearby = false
var dialogue_open = false
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = true
		

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = false
		dialogue_open = false
		DialogueUI.end_dialogue()

func _process(delta: float) -> void:
	if player_nearby and Input.is_action_just_pressed("Interact"):
		if not dialogue_open:
			dialogue_open = true
			get_node("../DialogueUI").start_dialogue()
			
			
