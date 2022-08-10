extends KinematicBody

export var speed = 14

var velocity = Vector3.ZERO
var jump_acc = 15
var gravity = 0.98

onready var head = $Head

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector3.ZERO
	var head_basics = head.global_transform.basis
	
	if Input.is_action_pressed("fwd"):
		direction -= head_basics.z
	elif Input.is_action_pressed("bwd"):
		direction += head_basics.z
		
	if Input.is_action_pressed("left"):
		direction -= head_basics.x
	elif Input.is_action_pressed("right"):
		direction += head_basics.x
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		direction.y = 1
	elif is_on_floor():
		direction.y = -0.1
		
	direction = direction.normalized()
		
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y += direction.y * jump_acc
	velocity.y -= gravity
	
	velocity = move_and_slide(velocity,Vector3.UP)
	
