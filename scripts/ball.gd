extends CharacterBody2D

const SPEED: float = 400.0

var is_moving: bool = false
var velocity_vector: Vector2 = Vector2.ZERO
var start_position: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Automatically saves the exact position you placed the ball in the editor
	start_position = global_position

func _physics_process(delta: float) -> void:
	if not is_moving:
		velocity = Vector2.ZERO
		# Press Spacebar (ui_accept), moveUp, or moveDown to launch the ball after reset
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("moveUp") or Input.is_action_just_pressed("moveDown"):
			ball_start()
		return

	velocity = velocity_vector * SPEED

	var collision: bool = move_and_slide()
	
	if collision == true:
		var slide_collision: KinematicCollision2D = get_slide_collision(0)
		if slide_collision:
			var normal: Vector2 = slide_collision.get_normal()
			velocity_vector = velocity_vector.bounce(normal)

func ball_start() -> void:
	is_moving = true
	
	# Randomly choose left (-1) or right (1) direction
	var random_direction_x = randf_range(-1.0, 1.0)
	if random_direction_x >= 0:
		random_direction_x = 1.0
	else:
		random_direction_x = -1.0
		
	# Give it a randomized vertical tilt so it doesn't always go the same way
	var random_direction_y = randf_range(-0.7, 0.7)
	
	velocity_vector = Vector2(random_direction_x, random_direction_y).normalized()

func reset() -> void:
	is_moving = false
	velocity = Vector2.ZERO
	velocity_vector = Vector2.ZERO
	global_position = start_position # Snaps right back to its original editor position!