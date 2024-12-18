extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -200.0
var time = 0
var land_time = 0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor() and (time - land_time) > 0.1:
		velocity += get_gravity() * delta
	if is_on_floor():
		land_time = time
		
	time += delta

	# Handle jump.
	if Input.is_action_pressed("jump") and (is_on_floor() or (not is_on_floor() and (time - land_time) < 0.1)):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false	
	if direction < 0:
		animated_sprite.flip_h = true

	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
