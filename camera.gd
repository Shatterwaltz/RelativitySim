extends SpringArm3D
class_name CameraComponent

var mousePos: Vector2
#var mousePosLast: Vector2
#
@export var camera_sens := 0.2
@export var zoom_step := 0.3
@onready var camera_3d: Camera3D = $Camera3D

var pivot: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pivot = get_parent_node_3d()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	mousePosLast = mousePos
#	var mouseDiff := (mousePos - mousePosLast) * camera_sens
	if Input.is_action_just_pressed("camera_move"):
		mousePos = get_viewport().get_mouse_position()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if Input.is_action_just_released("camera_move"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		Input.warp_mouse(mousePos)
		
	if Input.is_action_just_released("zoom_out"):
		spring_length += zoom_step
	if Input.is_action_just_released("zoom_in"):
		spring_length -= zoom_step
	spring_length = clamp(spring_length, 1, 15)
	
func _input(event):
	if event is InputEventMouseMotion && Input.is_action_pressed("camera_move"):
		pivot.rotate_y(deg_to_rad(-event.relative.x * camera_sens))
		rotate_x(deg_to_rad(-event.relative.y * camera_sens))	
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(35))
