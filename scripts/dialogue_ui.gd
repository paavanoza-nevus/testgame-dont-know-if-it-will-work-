extends CanvasLayer

@onready var panel = $DialoguePanel
@onready var dialogue_text = $DialoguePanel/VBoxContainer/DialogueText
@onready var choice1 = $DialoguePanel/VBoxContainer/Choice1
@onready var choice2 = $DialoguePanel/VBoxContainer/Choice2
@onready var choice3 = $DialoguePanel/VBoxContainer/Choice3

	
func _ready() -> void:
	panel.hide()
	choice1.pressed.connect(_on_choice1_pressed)
	choice2.pressed.connect(_on_choice2_pressed)
	choice3.pressed.connect(_on_choice3_pressed)
	
func start_dialogue() -> void:
	panel.show()
	dialogue_text.text = "?"
	choice1.show()
	choice2.show()
	choice3.show()
	
func _on_choice1_pressed() -> void:
	dialogue_text.text = "You are in the Golden Plynth Outpost, a marvelous island in the endless sea!"
	choice1.hide()
	choice2.hide()
	choice3.text = "Thanks for the info, bye bye!"
	
func _on_choice2_pressed() -> void:
	dialogue_text.text = "I am the guide for all the noob players in this gam-I mean, world."
	choice1.hide()
	choice2.hide()
	choice3.text = "Ok, good to know, bye bye!"
	
func _on_choice3_pressed() -> void:
	panel.hide()
	choice2.show()
	
func end_dialogue() -> void:
	panel.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
