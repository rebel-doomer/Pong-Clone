extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

 # todo Detect when the ball leaves the playfield. 
# todo Assign a point to the player who scored

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
	pass # Replace with function body.
