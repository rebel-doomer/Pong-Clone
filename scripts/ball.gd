extends CharacterBody2D

const SPEED = 300.0

# track if ball has been launched yet
var is_moving := false
var velocity_vector := Vector2.ZERO


func _physics_process(delta: float) -> void:
	# # If ball isn't moving yet, check for a start trigger aka listen for (first) input
	if not is_moving():
		# start when the player presses spacebar or a move key
		if Input.is_action_just_pressed("moveUp") or Input.is_action_pressed("moveDown"):
			ball_start()
		return # Stop running the rest of this function until it is launched

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

func ball_start():
