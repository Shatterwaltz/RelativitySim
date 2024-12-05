extends Node3D
@onready var chain_show_timer: Timer = $ChainShowTimer
@onready var chain_hide_timer: Timer = $ChainHideTimer

@onready var chains: Node3D = $Chains

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.start_round.connect(_on_new_run)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_run(variation: int, _role: int):
	chains.visible = false
	rotation = Vector3.ZERO
	rotate_y(deg_to_rad((variation-1) * 45))
	chain_show_timer.start(4)
	chain_hide_timer.stop()


func _on_chain_show_timer_timeout() -> void:
	chain_hide_timer.start(4)
	chains.visible = true


func _on_chain_hide_timer_timeout() -> void:
	chains.visible = false
