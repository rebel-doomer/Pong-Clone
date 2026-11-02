extends CharacterBody2D

const SPEED: float = 400.0

var is_moving: bool = false
var velocity_vector: Vector2 = Vector2.ZERO

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
	# Randomize or give a solid starting diagonal direction
	velocity_vector = Vector2(1, 0.6).normalized()

func reset() -> void:
	is_moving = false
	velocity = Vector2.ZERO
	velocity_vector = Vector2.ZERO
	global_position = Vector2(500, 250) # Center of your playfield area