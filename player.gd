extends CharacterBody3D


var SPEED = 8.0
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var JUMP_VELOCITY = 4.5
@export var camera_pivot: Node3D

func _ready() -> void:
	GameManager.start_round.connect(_on_new_round)

func _on_new_round(_variation: int, _role: int):
	transform.origin = Vector3.ZERO

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input = Input.get_vector("left", "right", "forward", "back")
	velocity = (camera_pivot.basis * Vector3(input.x, velocity.y, input.y)).normalized() * SPEED
	velocity.y -= gravity * delta
	move_and_slide()
