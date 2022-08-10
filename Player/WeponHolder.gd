extends Spatial


onready var rayCast = $RayCast

func _input(event):
	
	if event.is_action_pressed("fire"):
		rayCast.enabled = true
		var obj = rayCast.get_collider()
		if obj != null:
			if obj.get_parent().get_groups()[0] == "target":
				obj.get_parent().hit(10)
		
	
