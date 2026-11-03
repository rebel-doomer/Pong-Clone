extends CharacterBody2D

const SPEED: float = 400.0
var fixed_x: float = 0.0 # Custom variable to remember the paddle's starting X position

func _ready() -> void:
	# Automatically save the X coordinate on startup so the paddle never drifts sideways
	fixed_x = global_position.x

func _physics_process(delta: float) -> void:
	# Reset vertical velocity to zero at the start of every frame
	velocity.y = 0.0

	# Check keyboard inputs for moving up and down
	if Input.is_action_pressed("moveUp"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("moveDown"):
		velocity.y = SPEED

	# Move the paddle based on velocity
	move_and_slide()

	# Force-lock the X position every single frame so the ball can never push it left or right!
	global_position.x = fixed_x
