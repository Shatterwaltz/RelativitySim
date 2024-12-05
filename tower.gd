extends Node
class_name Tower
@onready var spinner_cw: Node3D = $SpinnerCW
@onready var spinner_ccw: Node3D = $SpinnerCCW

@onready var show_spinner: Timer = $ShowSpinner
@onready var hide_spinner: Timer = $HideSpinner

@export var time_til_active: int
var is_cw: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.start_round.connect(_on_round_start)

func _on_round_start(variation: int, role: int):
	spinner_cw.visible = false
	spinner_ccw.visible = false
	if randi() % 2:
		is_cw = true
	else: is_cw = false
	show_spinner.start(time_til_active)
	hide_spinner.stop()

func _on_show_spinner_timeout() -> void:
	if is_cw:
		spinner_cw.visible = true
	else:
		spinner_ccw.visible = true
	hide_spinner.start(4)


func _on_hide_spinner_timeout() -> void:
	spinner_cw.visible = false
	spinner_ccw.visible = false
