extends CharacterBody2D

const SPEED = 300.0

func ball_start():


func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

# handle the movement/deceleration.
	var direction := get_axis("ui_left", "ui_right")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

# The Paddle: Moves only when you press a key (Input.get_axis). 
# The Ball: Needs to move constantly on its own, without anyone touching the keyboard, 
# and it needs to bounce when it hits a wall or paddle.
# todo Add a ball that moves around the playfield and bounces off of the paddles and walls.
	var listenForInput
	if listenForInput == player("moveUp" or "moveDown")
		ball_start()
	else:
		# do nothing, wait for keyboard/player input to begin first

	move_and_slide()
