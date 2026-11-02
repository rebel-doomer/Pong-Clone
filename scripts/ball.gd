extends CharacterBody2D

const SPEED = 400.0

# Track if ball has been launched yet
var is_moving := false
var velocity_vector := Vector2.ZERO

func _physics_process(delta: float) -> void:
	# If ball isn't moving yet, wait for input to start
	if not is_moving:
		# Start when the player presses a move key
		if Input.is_action_just_pressed("moveUp") or Input.is_action_pressed("moveDown"):
			ball_start()
		return # Stop running the rest of this function until it is launched

	# Handle the movement: apply velocity vector scaled by speed
	velocity = velocity_vector * SPEED

	# todo Amake ball bounces off of the paddles and walls.
	# bounce/collision logic for the ball
var collision: bool = move_and_slide()
	
	if collision == true:
		# Get the first collision object and store it explicitly in a variable
		var slide_collision: KinematicCollision2D = get_slide_collision(0)
		
		# Get the surface normal from that saved object
		var normal: Vector2 = slide_collision.get_normal()
		
		# Bounce the velocity vector off that normal
		velocity_vector = velocity_vector.bounce(normal)

func ball_start() -> void:
	is_moving = true
	# Give the ball a starting diagonal direction (e.g., up and right)
	velocity_vector = Vector2(1, 0.6).normalized()
