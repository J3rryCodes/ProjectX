extends Spatial


onready var rayCast = $RayCast

func _input(event):
	
	if event.is_action_pressed("fire"):
		rayCast.enabled = true
		var obj = rayCast.get_collider()
		
		
	
