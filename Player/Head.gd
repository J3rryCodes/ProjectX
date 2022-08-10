extends Spatial

export var mouse_sensitivity = 0.3
onready var camera = $Camera
onready var crosshair = $TextureRect

var camera_x_rotation = 0
var crosshair_size = 40

func _init():

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _ready():
	
	var display_size = OS.window_size
	var half_crosshair = (crosshair.rect_size.x * crosshair.rect_scale.x) * 0.5
	crosshair.set_position(Vector2((display_size.x/2)+half_crosshair,(display_size.y/2)+half_crosshair))

func _input(event):
	
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

		var x_delta = deg2rad(-event.relative.y * mouse_sensitivity)
		if camera_x_rotation+x_delta >= -1.5 and camera_x_rotation+x_delta <= 1.5:
			camera.rotate_x(x_delta)
			camera_x_rotation += x_delta
		
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
