extends Node
const ERUPTION = preload("res://Assets/eruption.png")
const FIRE = preload("res://Assets/fire.png")
const GAZE = preload("res://Assets/gaze.png")
const ICE = preload("res://Assets/ice.png")
const REWIND = preload("res://Assets/rewind.png")
const STACK = preload("res://Assets/stack.png")
const WATER = preload("res://Assets/water.png")

const STATUS = preload("res://Status.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.start_round.connect(_on_new_round)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_round(variation: int, role: int):
	for child in get_children():
		child.queue_free()
	var debuff_variation: int = randi_range(1, 4)
	var fire_status: Status = STATUS.instantiate()
	fire_status.icon = FIRE
	
	var secondary_status: Status = STATUS.instantiate()
	
	var rewind: Status = STATUS.instantiate()
	rewind.icon = REWIND
	
	if role == 1:
		match debuff_variation:
			1:
				fire_status.duration = 10
				rewind.duration = 16
				secondary_status.icon = ERUPTION
				secondary_status.duration = 43
			2:
				fire_status.duration = 20
				rewind.duration = 16
				secondary_status.icon = WATER
				secondary_status.duration = 43
			3:
				fire_status.duration = 30
				rewind.duration = 26
				secondary_status.icon = GAZE
				secondary_status.duration = 43
			4:
				fire_status.duration = 20
				fire_status.icon = ICE
				rewind.duration = 26
				secondary_status.icon = GAZE
				secondary_status.duration = 43
	else:
		match debuff_variation:
			1:
				fire_status.duration = 30
				rewind.duration = 26
				secondary_status.icon = GAZE
				secondary_status.duration = 43
			2:
				fire_status.duration = 20
				rewind.duration = 16
				secondary_status.icon = ERUPTION
				secondary_status.duration = 43
			3:
				fire_status.duration = 10
				rewind.duration = 16
				secondary_status.icon = ERUPTION
				secondary_status.duration = 43
			4:
				fire_status.duration = 20
				fire_status.icon = ICE
				rewind.duration = 16
				secondary_status.icon = ERUPTION
				secondary_status.duration = 43
	add_child(fire_status)
	add_child(rewind)
	add_child(secondary_status)
