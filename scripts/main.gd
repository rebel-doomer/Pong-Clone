extends Node2D

# todo Assign a point to the player who scored
# Declare typed score variables
var player_one_score: int = 0
var player_two_score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

"""
handle the game loop:
	- resetting ball once it gets off screen
	- keeping score

scripts on individual nodes (player, ball, CPU, etc.) 
handle their own specific movement/logic
"""

func _on_off_screen_body_entered(body: Node2D) -> void:
	 # Explicitly check if the node that entered the area is named "Ball"
	if body.name == "Ball": # todo Detect when the ball leaves the playfield.
		print("The ball has left the playfield!")
		
