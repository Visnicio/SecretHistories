extends Node
class_name HumanoidCharacterInput
# desired (horizontal) movement vector in world space, length limited to 1.0
var movement_vector : Vector3 = Vector3.ZERO:
	set(value):
		movement_vector = value.limit_length(1.0)
var jump : bool = false
var crouch : bool = false
var sprint : bool = false
var lean_left : bool = false
var lean_right : bool = false
var lean_forward : bool = false
var mouse_captured: bool = false


func _ready() -> void:
	mouse_captured = true if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else false


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("debug_switch_mouse_capture"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE else Input.MOUSE_MODE_VISIBLE
		mouse_captured = true if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED else false
