
extends CanvasModulate
class_name DayAndNightCycle

signal changeDayTime(dayTime: DAY_STATE)

@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum DAY_STATE {NOON, EVENING}

var dayTime: DAY_STATE = DAY_STATE.NOON

func _ready() -> void:
	add_to_group("dayAndNightCycle")

func get_current_hour() -> int:
	if dayTime == DAY_STATE.NOON:
		return 12
	else:
		return 18

func get_current_minute() -> int:
	return 0

func is_daytime() -> bool:
	return dayTime == DAY_STATE.NOON

func _process(delta: float) -> void:
	var animationPos = animation_player.current_animation_position
	var animationLength = animation_player.current_animation_length / 2

	if animationPos > animationLength and dayTime != DAY_STATE.EVENING:
		dayTime = DAY_STATE.EVENING
		changeDayTime.emit(dayTime)
	elif animationPos < animationLength and dayTime != DAY_STATE.NOON:
		dayTime = DAY_STATE.NOON
		changeDayTime.emit(dayTime)
