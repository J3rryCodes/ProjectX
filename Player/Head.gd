extends Spatial

export var mouse_sensitivity = 0.3
onready var camera = $Camera

var camera_x_rotation = 0

func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

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
