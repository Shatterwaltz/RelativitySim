extends Node
class_name Status


@onready var timer: Timer = $Timer
@onready var countdown: Label = $Countdown
@export var texture_rect: TextureRect
var icon: Texture2D:
	set (new_val):
		texture_rect.texture = new_val
var duration: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(duration)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	countdown.text = str(ceili(timer.time_left))


func _on_timer_timeout() -> void:
	queue_free()
