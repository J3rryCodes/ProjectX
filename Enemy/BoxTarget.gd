extends Spatial


export var health = 100

func hit(var damage):
	
	print("damage "+ str(damage))
	
	health -= damage
	
	if health <= 0:
		queue_free()
