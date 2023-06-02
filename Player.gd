extends CharacterBody3D


var gravity = 20
var speed = 5
var jump_velocity = 5
var mouse_sens = 0.006


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Camera3D/RayCast3D.add_exception(self)


func _physics_process(delta):
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jump
	if Input.is_action_pressed("jump"): #and is_on_floor():
		velocity.y = jump_velocity

	# Input movement
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
	move_and_slide()


func _input(event):
	# Game quit
	if Input.is_physical_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
	# Mouse motion
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * mouse_sens
		$Camera3D.rotation.x -= event.relative.y * mouse_sens
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-90), deg_to_rad(90))
		
	# Raycast
	if Input.is_action_just_pressed("primary"):
		var target = $Camera3D/RayCast3D.get_collider()
		if is_instance_valid(target):
			target.queue_free()
