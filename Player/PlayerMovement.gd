extends KinematicBody

export var sprint_speed = 18
export var walk_speed = 12

var velocity = Vector3.ZERO
var jump_acc = 18
var gravity = 0.98
var is_sprint = false

onready var head = $Head

func _ready():
	pass
	
func _physics_process(delta):
	var direction = Vector3.ZERO
	var head_basics = head.global_transform.basis
	
	is_sprint = Input.is_action_pressed("sprint")
	
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
		direction.y = -0.01
		
	direction = direction.normalized()
		
	velocity.x = direction.x *  walk_speed
	
	# Shift key pressed and moving forword
	if is_sprint and direction.z < 0:
		velocity.z = direction.z * sprint_speed
	else:
		velocity.z = direction.z * walk_speed
	
	velocity.y += direction.y * jump_acc
	velocity.y -= gravity
	
	velocity = move_and_slide(velocity,Vector3.UP)
	
