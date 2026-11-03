extends CharacterBody2D

const SPEED: float = 400.0 # ball's speed in which it moves

var is_moving: bool = false # this variable is a bool, very simple but handy to use, gets a lot of stuff done
var velocity_vector: Vector2 = Vector2.ZERO # todo bad redundancy
var start_position: Vector2 = Vector2.ZERO # todo redundant

func _ready() -> void:
	# Automatically saves the exact position the ball was placed in the editor
	start_position = global_position

func _physics_process(delta: float) -> void:
	if not is_moving:
		velocity = Vector2.ZERO # todo so much redundancy to delete/fix later
		# Press Spacebar (ui_accept), moveUp, or moveDown to launch the ball after reset
		# ui accept is built into godot, the spacebar
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("moveUp") or Input.is_action_just_pressed("moveDown"):
			ball_start()
		return
		
	velocity = velocity_vector * SPEED

	var collision: bool = move_and_slide() 
	
	if collision == true: # tells the game that a collision has occured, but it doesn't give details about the crash. 
		# below, creates a new variable to store the details of the crash.
		# note: KinematicCollision2D: Godot's built-in way of labeling the type of data this is storing. This variable holds information about a physics collision.
		var slide_collision: KinematicCollision2D = get_slide_collision(0) # This line grabs those details so the ball knows how to bounce. set to 0 to only grab details of the very first indexed thing it detected during collision
		if slide_collision: # note: get_normal() looks at the collision report to figure out which direction the wall or paddle's surface is facing.
			var normal: Vector2 = slide_collision.get_normal()
			velocity_vector = velocity_vector.bounce(normal) # note: normal. uses that information to bounce the ball away at the correct angle

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
