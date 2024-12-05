extends Node

signal start_round(variation: int, role:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("reset_dps"):
		start_round.emit(randi_range(1, 8), 1)
	if Input.is_action_just_pressed("reset_supp"):
		start_round.emit(randi_range(1, 8), 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
